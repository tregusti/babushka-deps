# Media computer
dep "mimer" do
  
  # Browsers
  requires "Google Chrome.app"

  # Utils
  requires "iStat Menus.app",
           "Alfred.app",
           "1Password.app",
           "Dropbox.app",
           "Bonjour Mounter.app",
           "The Unarchiver.app",
           "TotalFinder beta.app"

  # Media apps
  requires "Spotify.app",
           "VLC.app"

  # System setup
  requires "dotfiles.repo",
           "OSX Dock configured"
end