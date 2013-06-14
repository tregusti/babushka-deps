require "json"

meta :chrome_css do
  accepts_value_for :app_name, ["Chrome", "Chrome Canary"]
    
  template {
    requires "dotfiles.repo"

    def original_css_file
      "/Users/#{current_username}/code/dotfiles/config/browser.css"
    end

    def root
      "/Users/#{current_username}/Library/Application Support/Google/#{app_name}"
    end
  
    def local_state_file
      "#{root}/Local State"
    end

    def profiles
      @profiles ||= begin
        state = JSON.parse( IO.read( local_state_file ) )
        if state["profile"].has_key? "last_active_profiles"
          # chrome >= 29
          state["profile"]["last_active_profiles"]
        else
          # chrome < 29
          state["profile"]["info_cache"].keys
        end
      end.tap do |profiles|
        if profiles.nil? or profiles.size.zero?
          unmeetable! "No profiles for #{app_name}."
        end
      end
    end
  
    def main_profile
      profiles.first
    end

    def linked_css_file
      "#{root}/#{main_profile}/User StyleSheets/Custom.css"
    end
  
    # Has first/main profile got a symlinked custom css file
    def linked?
      File.symlink? linked_css_file
    end
  
    def linkable?
      missing = !File.exists?(linked_css_file)
      empty  = !missing and File.size(linked_css_file).zero?
      missing or empty
    end
  
    def running?
      # 1. List all running processes
      # 2. Filter out not matching
      # 3. Filter out the first grep
      shell! "ps -A | grep '#{app_name}.app' | grep 'Applications' > /dev/null 2>&1"
    end
  
    def kill
      if running?
        log_warn "Killing #{app_name}"
        shell "killall 'Google #{app_name}' > /dev/null 2>&1"
      end
    end

    met? {
      linked?
    }
    meet {
      if linkable?
        kill
        shell "rm -rf '#{linked_css_file}'"
        shell "ln -sfn '#{original_css_file}' '#{linked_css_file}'"
      else
        log_error "Custom css file exists with contents. Will not overwrite!"
      end
    }
  }
end

dep "Google Chrome.chrome_css" do
  requires "Google Chrome.app"
  app_name "Chrome"
end

dep "Google Chrome Canary.chrome_css" do
  requires "Google Chrome Canary.app"
  app_name "Chrome Canary"
end

dep "Google Chrome configured" do
  requires "Google Chrome.app"
  requires "Google Chrome.chrome_css"
end
dep "Google Chrome Canary configured" do
  requires "Google Chrome Canary.app"
  requires "Google Chrome Canary.chrome_css"
end

