dep "ruby" do
  requires "rvm"
  
  met? {
    shell("which ruby") =~ %r!/Users/.*?/\.rvm/rubies/ruby-[\d\.]+-p\d+/bin/ruby!
  }
  
  meet {
    shell "rvm install ruby --verify-downloads 0"
    shell "rvm use --default ruby"
  }
end