# These apps are missing an appcast as it seems.
# If this is wrong, please make a pull request.

# Latest versions

dep "Google Chrome Canary.app"  do source "https://storage.googleapis.com/chrome-canary/GoogleChromeCanary.dmg" end
dep "Google Chrome Dev.app"     do source "http://dl.google.com/chrome/mac/dev/GoogleChrome.dmg" end
dep "Google Chrome Beta.app"    do source "http://dl.google.com/chrome/mac/beta/GoogleChrome.dmg" end
dep "Google Chrome.app"         do source "http://dl.google.com/chrome/mac/stable/GoogleChrome.dmg" end
dep "Hex Fiend.app"             do source "http://ridiculousfish.com/hexfiend/files/HexFiend.dmg" end
dep "HTTP Client.app"           do source "http://ditchnet.org/httpclient/dist/HTTPClient.zip" end
dep "Opera.app"                 do source "http://www.opera.com/download/get/?id=35742" end
dep "Opera Next.app"            do source "http://www.opera.com/download/get/?id=35817&location=360&nothanks=yes&sub=marine" end
dep "Pixelmator.app"            do source "http://pixelmator.s3.amazonaws.com/Pixelmator.zip" end
dep "Skype.app"                 do source "http://www.skype.com/go/getskype-macosx.dmg" end
dep "Spotify.app"               do source "http://download.spotify.com/Spotify.dmg" end
dep "Things.app"                do source "http://downloads.culturedcode.com/things/download/" end
dep "Tower.app"                 do source "http://www.git-tower.com/download" end
dep "Versions.app"              do source "http://versionsapp.com/redirect/versionslatest" end

# Fixed versions

dep "1Password.app"             do source "http://aws.cachefly.net/dist/1P/mac/1Password-3.8.21.zip" end
dep "Airfoil.app"               do source "http://www.rogueamoeba.com/airfoil/download/Airfoil.zip" end
dep "Bonjour Mounter.app"       do source "http://bonjourmounter.gestosoft.com/download/Bonjour%20Mounter%203.0.13.zip" end
dep "Charles.app"               do source "http://www.charlesproxy.com/assets/release/3.7/charles_macosx.zip" end
dep "Dropbox.app"               do source "https://dl.dropboxusercontent.com/u/17/Dropbox%202.0.12.dmg" end
dep "Firefox.app"               do source "https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/21.0/mac/en-US/Firefox%2021.0.dmg" end
dep "Firefox Beta.app"          do source "https://ftp.mozilla.org/pub/mozilla.org/firefox/candidates/22.0b1-candidates/build1/mac/en-US/Firefox%2022.0b1.dmg" end
dep "Firefox Aurora.app"        do
                                  provides "FirefoxAurora.app"
                                  source "https://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/2013-05-17-00-40-16-mozilla-aurora/firefox-23.0a2.en-US.mac.dmg"
                                end
dep "HTTPScoop.app"             do source "http://www.tuffcode.com/releases/HTTPScoop_1.4.3.dmg" end
dep "LaunchBar.app"             do source "http://www.obdev.at/downloads/launchbar/LaunchBar-5.4.3.dmg" end
dep "Sequel Pro.app"            do source "http://sequel-pro.googlecode.com/files/sequel-pro-0.9.8.dmg" end
dep "The Unarchiver.app"        do source "http://theunarchiver.googlecode.com/files/TheUnarchiver3.7.zip" end
dep "VLC.app"                   do source "http://download.videolan.org/pub/videolan/vlc/2.0.6/macosx/vlc-2.0.6.dmg" end

# Special cases

