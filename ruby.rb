dep "ruby" do
  requires "rvm"
  
  met? {
    # better check later on
    in_path? "ruby"
  }
  
  meet {
    shell "rvm install ruby --verify-downloads 0"
  }
end