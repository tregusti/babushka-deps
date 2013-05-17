# Not in use yet. Is it working? =)

meta "defaults" do
  accepts_value_for :domain
  accepts_value_for :key
  accepts_value_for :value
  # bool is default (first) See http://git.io/5CS5wg
  accepts_value_for :type, %w(bool boolean string int integer float)
  
  template {
    met? {
      value == shell("defaults read #{domain} #{key}")
    }
    meet {
      if type == "string"
        val = "'#{value}'"
      else
        val = value
      end
      shell "defaults write #{domain} #{key} #{val}"
    }
  }
end