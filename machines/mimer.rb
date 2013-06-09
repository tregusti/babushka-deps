# Media computer
dep "mimer" do
  
  # System setup
  requires "homebrew",
           "dotfiles configured",
           "OSX Dock configured"

  # Browsers
  requires "Google Chrome.app"

  # Utils
  requires "iStat Menus.app",
           "Alfred.app",
           "1Password.app",
           "Dropbox.app",
           "Bonjour Mounter.app",
           "The Unarchiver.app",
           "Tagger.app"
           # "TotalFinder beta.app"

  # Media apps
  requires "Spotify.app",
           "VLC.app"
end