# Installs apt-get
require_recipe "apt"

execute "apt-key" do
  command "sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10"
end

execute "10gen.list" do
  command "echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/10gen.list"
end

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
