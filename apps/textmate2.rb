dep "TextMate" do
  requires "TextMate.app", "TextMate mate"
end

dep "TextMate mate" do
  requires "TextMate.app"
  met? { which "mate" }
  meet { shell "ln -sf '#{app_dir('TextMate.app') / 'Contents/SharedSupport/Support/bin/mate'}' /usr/local/bin/mate" }
end

dep "TextMate.app" do
  source "http://api.textmate.org/downloads/beta"
end
