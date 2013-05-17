dep "rvm" do
  requires "curl.managed"
  
  met? {
    "~/.rvm/scripts/rvm".p.file?
  }

  meet {
    shell "curl -L https://get.rvm.io | bash -s stable --autolibs=packages --ruby --rails"
  }
end