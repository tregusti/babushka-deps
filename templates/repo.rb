# Credit where credit is due:
# https://github.com/jamesottaway/babushka-deps/blob/6791f60e7d40e45e048daecbcc90613bc74bd138/templates/git.rb

meta :repo do
  accepts_value_for :repo
  accepts_value_for :destination

  template {
    met? {
      destination.to_fancypath.exists? &&
        shell("(cd #{destination} && git remote -v)")[repo]
    }
    meet {
      shell "git clone --recursive #{repo} #{destination}",
            :spinner => true
    }
  }
end
