dep 'textmate' do
  requires 'TextMate.app', 'textmate helper'
end

dep 'textmate helper' do
  requires 'TextMate.app'
  met? { which 'mate' }
  meet { shell "ln -sf '#{app_dir('TextMate.app') / 'Contents/SharedSupport/Support/bin/mate'}' /usr/local/bin/mate" }
end

dep 'TextMate.app' do
  source 'http://api.textmate.org/downloads/beta'
end
