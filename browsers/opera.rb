require "json"

dep "Opera configured" do
  requires "Opera.app"
  requires "Opera with custom stylesheet"
end

dep "Opera Next configured" do
  requires "Opera Next.app"
  # Opera next doesn't seem to read a custom css file from the same place as other chromium based browsers, so don't even try
  # requires "Opera Next.chrome_css"
end

# dep "Opera Next.chrome_css" do
#   requires "Opera Next.app"
#   vendor "Opera"
# end

# Valid for Opera < 15 (later are chromium based)
dep "Opera with custom stylesheet" do
  requires "dotfiles.repo"
  
  def original_css_file
    "/Users/#{current_username}/code/dotfiles/config/browser.css"
  end
  
  def prefs_file
    lib = "/Users/#{current_username}/Library"
    # Opera is sandboxed if downloaded from App Store
    sandboxed_prefs_file = "#{lib}/Containers/com.operasoftware.Opera/Data/Library/Opera/operaprefs.ini"
    # Opera is NOT sandboxed if downloaded from opera.com
    normal_prefs_file    = "#{lib}/Opera/operaprefs.ini"
    
    @prefs_file ||= if sandboxed_prefs_file.p.exists?
                      sandboxed_prefs_file
                    else
                      normal_prefs_file
                    end
  end

  def running?
    # 1. List all running processes
    # 2. Filter out not matching
    # 3. Filter out the first grep
    shell! "ps -A | grep 'Opera.app' | grep 'Applications' > /dev/null 2>&1"
  end

  def kill
    if running?
      log_warn "Killing Opera"
      shell "killall 'Opera' > /dev/null 2>&1", :log => "ignore"
    end
  end

  def regex
    /^Local CSS File=(.*?)$/
  end
  
  def pref_value
    "Local CSS File=#{original_css_file}"
  end
  
  met? {
    if prefs_file.p.exists?
      match = regex.match File.read( prefs_file )
      match && (match[1] == original_css_file)
    else
      false
    end
  }
  meet {
    # Kill running instances
    kill
    
    # Ensure directories are present
    File.dirname(prefs_file).p.mkdir
    
    # Read in current prefs
    prefs = if prefs_file.p.exists?
              File.read prefs_file
            else
              "[User Prefs]"
            end
    
    if prefs =~ regex
      # Replace existing pref
      prefs = prefs.sub regex, pref_value
    else
      # Insert new pref
      prefs = prefs.sub /(\[User Prefs\])/, "\\1\n#{pref_value}"
    end
    log "Writing new prefs"
    File.write(prefs_file, prefs)
  }
  
end
