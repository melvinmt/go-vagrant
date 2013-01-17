# Installs apt-get
require_recipe "apt"

# Sync time to prevent syncing issues between VM and local env
execute "sync-time" do
  command "ntpdate pool.ntp.org"
end

# update apt-get list
execute "initial-sudo-apt-get-update" do
  command "apt-get update"
end

# Our version of .bashrc has /home/vagrant/bin in PATH
cookbook_file "/home/vagrant/.bashrc" do
  source ".bashrc"
  mode "0644"
  owner "vagrant"
  group "vagrant"
  action :create
end

# Installs latest stable mongodb
apt_repository "mongo-10gen" do
  uri "http://downloads-distro.mongodb.org/repo/ubuntu-upstart"
  distribution "dist"
  components ["10gen"]
  key "7F0CEB10"
  keyserver "keyserver.ubuntu.com"
  action :add
end
package "mongodb-10gen"

# Add ppa apt repository for go
apt_repository "gophers-go-ppa" do
  uri          "http://ppa.launchpad.net/gophers/go/ubuntu"
  distribution node['lsb']['codename']
  components   ["main"]
  key          "9AD198E9"
  keyserver    "keyserver.ubuntu.com"
  action :add
end

# This doesn't work yet.. but I keep trying
execute "export_go_paths" do
  command "export GPATH=/var/www/app"
  command "export PATH=$PATH:/var/www/app/bin"
end

# Update the apt-get list again
execute "second-sudo-apt-get-update" do
  command "apt-get update"
end

# Install go stable
package "golang-stable" do
  action :install
end

# Install git
include_recipe "git"

# Install bazaar
include_recipe "bazaar"
