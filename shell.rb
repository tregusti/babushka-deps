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

dep "dotfiles configured", :fullname, :email, :github_username do
  requires "code", "zsh"
  requires "dotfiles.repo"
  
  met? {
    "~/.gitconfig".p.exists?
  }
  meet {
    fullname.ask "Your full name"
    email.ask "Your email"
    github_username.ask "Github username"
  
    input = ""
    input << "y\n" if "~/.gitconfig".p.exists?
    input << "#{fullname}\n"
    input << "#{email}\n"
    input << "#{github_username}\n"
    input << "" # token...

    login_shell %Q{rake install <<< "#{input}"}, :cd => "~/code/dotfiles"
  }
end

dep "dotfiles.repo" do
  repo        "git@github.com:tregusti/dotfiles.git"
  destination "~/code/dotfiles"
end
