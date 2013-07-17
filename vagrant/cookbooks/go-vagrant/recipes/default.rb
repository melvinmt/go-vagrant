# Installs apt-get
require_recipe "apt"

# Sync time to prevent syncing issues between VM and local env
# execute "sync-time" do
#   command "ntpdate pool.ntp.org"
# end

execute "apt-key" do
  command "sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10"
end

execute "10gen.list" do
  command "echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/10gen.list"
end

# update apt-get list
execute "initial-sudo-apt-get-update" do
  command "apt-get update"
end

# Our version of .bashrc has /home/vagrant/bin in PATH
template "/home/vagrant/.bashrc" do
  source "bashrc.erb"
  mode 0644
  owner "vagrant"
  group "vagrant"
end

include_recipe "mongodb::default"

include_recipe "golang::default"

# # Add ppa apt repository for go
# apt_repository "gophers-go-ppa" do
#   uri          "http://ppa.launchpad.net/gophers/go/ubuntu"
#   distribution node['lsb']['codename']
#   components   ["main"]
#   key          "9AD198E9"
#   keyserver    "keyserver.ubuntu.com"
#   action :add
# end

# execute "apt-get update" do
#   action :nothing
# end

# # Install go stable
# package "golang-stable" do
#   action :install
# end

# Install git
include_recipe "git"

# Install bazaar
include_recipe "bazaar"
