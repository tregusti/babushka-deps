require "json"

dep "Firefox configured" do
  requires "Firefox.app"
  requires "Firefox with custom stylesheet"
end

dep "Firefox Aurora configured" do
  requires "Firefox Aurora.app"
  requires "Firefox with custom stylesheet"
end

dep "Firefox with custom stylesheet" do
  requires "dotfiles.repo"
  
  def original_css_file
    "/Users/#{current_username}/code/dotfiles/config/browser.css"
  end
  
  def root
    "/Users/#{current_username}/Library/Application Support/Firefox/Profiles"
  end

  def profiles
    @profiles ||= begin
      Dir.chdir(root) do
        Dir.glob("*.default")
      end
    end.tap do |profiles|
      if profiles.nil? or profiles.size.zero?
        unmeetable! "No profiles for Firefox."
      end
    end
  end

  def main_profile
    profiles.first
  end

  def linked_css_file
    "#{root}/#{main_profile}/chrome/userContent.css"
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
    shell! "ps -A | grep 'Firefox(Aurora|Beta).app' | grep 'Applications' > /dev/null 2>&1"
  end

  def kill
    if running?
      log_warn "Killing all firefox instances"
      shell "killall 'firefox' > /dev/null 2>&1"
    end
  end

  met? {
    linked?
  }
  meet {
    if linkable?
      # Kill instances
      kill
      # Ensure dir is there
      dir = File.dirname(linked_css_file)
      Dir.mkdir(dir) unless Dir.exist?(dir)
      # Overwrite existing link with new one
      shell "ln -sfn '#{original_css_file}' '#{linked_css_file}'"
    else
      log_error "Custom css file exists with contents. Will not overwrite!"
    end
  }
end