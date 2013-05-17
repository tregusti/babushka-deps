dep "OSX Dock configured" do
  met? {
    "1" == shell("defaults read com.apple.Dock showhidden") &&
    "1" == shell("defaults read com.apple.Dock autohide") &&
    "48" == shell("defaults read com.apple.Dock tilesize")
  }
  meet {
    shell "defaults write com.apple.Dock showhidden -bool YES"
    shell "defaults write com.apple.Dock autohide -bool YES"
    shell "defaults write com.apple.Dock tilesize -int 48"
  }
end