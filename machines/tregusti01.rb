dep "tregusti01" do
  requires "dotfiles configured"
  
  requires "the_silver_searcher.managed",
           "nano.managed",
           "curl.managed",
           "wget.managed",
           "git.managed",
           "zsh.managed",
           
           # Monitoring/Stats tools
           "htop.managed",
           "iftop.managed",
           "bmon.managed"

end