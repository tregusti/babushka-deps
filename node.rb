require "net/http"

def new_shell_warning cmd
  log_warn "You need to open a new shell for #{cmd} to be in the path."
end

dep "node" do
  requires "nvm"
  
  def version
    @version ||= begin
      url = URI.parse("http://nodejs.org/")
      res = Net::HTTP.start(url.host, url.port) { |http|
        req = Net::HTTP::Get.new(url.path)
        http.request(req)
      }
      re = /Current Version: (v\d+\.\d+\.\d+)/i
      res.body.match(re)[1] or "v0.10"
    end
  end
  
  met? {
    # log = true to prevent babushka from logging error to user. babushka bug or strangeness…
    log "Checking node presence..."
    login_shell("which node", :log => true)
  }
  meet {
    log "Installing latest stable node..."
    login_shell "nvm install #{version}", :spinner => true
    log "Making node #{version} the default"
    login_shell "nvm alias default #{version}"
    new_shell_warning "node"
  }
end

dep "nvm" do
  # curl needed to get new node versions
  requires "curl.managed"
  
  def remote_url
    "https://github.com/creationix/nvm.git"
  end

  def base_path
    "~/.nvm"
  end
  
  met? {
    exists = "#{base_path}/nvm.sh".p.exists?
    if exists
      repo = Babushka::GitRepo.new base_path
      git_update remote_url, repo
    end
    exists
  }
  meet {
    git remote_url, :to => base_path
    new_shell_warning "nvm"
  }
end