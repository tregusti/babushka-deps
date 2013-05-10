dep "code" do
  met? { shell("file -b ~/code") == "directory" }
  meet { shell("mkdir -p ~/code") }
end