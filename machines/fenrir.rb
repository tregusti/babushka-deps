dep "fenrir" do
  # Browsers
  requires "Google Chrome.app",
           "Google Chrome Canary.app",
           "Opera.app",
           # "Opera Next.app", # next releases not available right now...
           "Firefox.app",
           "Firefox Aurora.app"

  # CLI tools
  requires "the_silver_searcher.managed",
           "nano.managed",
           "curl.managed",
           "wget.managed",
           "git.managed",
           "htop.managed",
           "zsh.managed"

  # Developer tools
  requires "TextMate",
           "Tower.app",
           "Versions.app",
           "iTerm.app"

  # Utils
  requires "iStat Menus.app",
           "Alfred.app",
           "1Password.app",
           "Dropbox.app",
           "Bonjour Mounter.app",
           "The Unarchiver.app",
           "Things.app"

  # Media apps
  requires "Spotify.app",
           "VLC.app"

  # System setup
  requires "dotfiles.repo",
           "OSX Dock configured",
           "rvm configured"
end