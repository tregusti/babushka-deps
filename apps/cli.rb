dep "nano.managed" do provides "nano > 2.2" end
dep "curl.managed"
dep "ack.managed"
dep "the_silver_searcher.managed" do
  # Silver searcher (instead of ack)
  provides "ag"
end
dep "htop.managed"
dep "wget.managed"
dep "unrar.managed"
dep "git.managed"
dep "zsh.managed" do
  after {
    # If you have administrator privileges, you must fix an Apple miss
    # configuration in Mac OS X 10.7 Lion by renaming /etc/zshenv to
    # /etc/zprofile, or Zsh will have the wrong PATH when executed
    # non-interactively by scripts.
    sudo "mv /etc/zshenv /etc/zprofile"
  }
end