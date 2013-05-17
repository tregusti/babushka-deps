dep "zsh as user shell" do
  requires "zsh.managed"
  met? { sudo("dscl localhost -read /Local/Default/Users/#{current_username} shell")['/bin/zsh'] }
  meet { sudo("chsh -s '/bin/zsh' #{current_username}") }
end

dep "zsh as system shell" do
  requires "zsh.managed"
  met? { File.read("/etc/shells").to_s =~ /#{which('zsh')}/ }
  meet { sudo "echo `which zsh` >> /etc/shells" }
end

dep "zsh" do
  requires "zsh as user shell",
           "zsh as system shell"
end


dep "dotfiles.repo" do
  requires    "code", "zsh"
  repo        "https://github.com/tregusti/dotfiles.git"
  destination "~/code/dotfiles"
  
  met? {
    "~/code/dotfiles".p.directory?
  }
  after {
    log_warn %Q{Don't forget to invoke the install script:

  cd ~/code/dotfiles
  rake install}
  }
end