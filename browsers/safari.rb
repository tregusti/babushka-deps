dep "Safari configured" do
  requires "Safari with custom stylesheet"
end

dep "Safari with custom stylesheet" do
  def css
    "~/code/dotfiles/config/browser.css"
  end
  met? {
    enabled       =  "1" == shell("defaults read com.apple.Safari UserStyleSheetEnabled")
    correct_value = css == shell("defaults read com.apple.Safari UserStyleSheetLocationURLString")
    enabled && correct_value
  }
  meet {
    shell "defaults write com.apple.Safari UserStyleSheetEnabled -int 1"
    shell "defaults write com.apple.Safari UserStyleSheetLocationURLString -string '#{css}'"
  }
end

dep "WebKit configured" do
  # WebKit reads custom stylesheet prefs from Safari
  requires "Safari with custom stylesheet"
end