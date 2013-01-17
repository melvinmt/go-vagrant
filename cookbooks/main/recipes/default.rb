require_recipe "apt"

execute "sync-time" do
  command "ntpdate pool.ntp.org"
end

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

apt_repository "mongo-10gen" do
  uri "http://downloads-distro.mongodb.org/repo/ubuntu-upstart"
  distribution "dist"
  components ["10gen"]
  key "7F0CEB10"
  keyserver "keyserver.ubuntu.com"
  action :add
end
package "mongodb-10gen"

apt_repository "gophers-go-ppa" do
  uri          "http://ppa.launchpad.net/gophers/go/ubuntu"
  distribution node['lsb']['codename']
  components   ["main"]
  key          "9AD198E9"
  keyserver    "keyserver.ubuntu.com"

  action :add
end

execute "export_go_paths" do
  command "export GPATH=/var/www/app"
  command "export PATH=$PATH:/var/www/app/bin"
end

execute "second-sudo-apt-get-update" do
  command "apt-get update"
end

package "golang-stable" do
  action :install
end

include_recipe "git"

include_recipe "bazaar"