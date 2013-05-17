dep 'XQuartz.installer' do
  # http://xquartz.macosforge.org/downloads/sparkle/release.xml
  # change to use sparkle when installer template can handle sparkle:
  # https://github.com/benhoskings/babushka/issues/268
  source 'http://xquartz.macosforge.org/downloads/SL/XQuartz-2.7.4.dmg'
  met? { '/Applications/Utilities/XQuartz.app'.p.exists?  }
end
dep 'Growl.installer' do
  source 'http://growl.cachefly.net/Growl-1.2.1.dmg'
  #pkg_name 'Growl.pkg'
  provides 'growlnotify'
end