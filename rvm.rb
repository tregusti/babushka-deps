dep "rvm configured" do
  requires "rvm",
           "bundler added to rvm defaults",
           "bundler added to rvm global",
           "rvm install on use flag"
end

dep "rvm" do
  requires "curl.managed"
  
  met? {
    "~/.rvm/scripts/rvm".p.file?
  }

  meet {
    shell "curl -L https://get.rvm.io | bash -s stable --autolibs=packages --ruby --rails"
  }
end

dep "bundler added to rvm defaults" do
  def default_gems_path
    File.expand_path("~/.rvm/gemsets/default.gems")
  end
  met? { File.read(default_gems_path).to_s =~ /bundler/ }
  meet { File.open(default_gems_path, "a") {|f| f << "\nbundler"} }
end

dep "bundler added to rvm global" do
  def global_gems_path
    File.expand_path("~/.rvm/gemsets/global.gems")
  end
  met? { File.read(global_gems_path).to_s =~ /bundler/ }
  meet { File.open(global_gems_path, "a") {|f| f << "\nbundler"} }
end

dep "rvm install on use flag" do
  def rvmrc_path
    File.expand_path("~/.rvmrc")
  end
  met? { File.exists?(rvmrc_path) && File.read(rvmrc_path).to_s =~ /rvm_gemset_create_on_use_flag/ }
  meet { File.open(rvmrc_path, "a") {|f| f << "\nexport rvm_gemset_create_on_use_flag=1" } }
end