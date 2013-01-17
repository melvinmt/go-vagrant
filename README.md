Sets up a basic Go/Golang development box using vagrant based on Ubuntu.


Uses chef recipes to provision `MongoDB`, `git`, `bazaar` and.. `go` of course.

# Installation

Install [vagrant](http://downloads.vagrantup.com/) on your machine.

Open terminal:
   git clone https://github.com/melvinmt/go-vagrant.git

   cd go-vagrant

   vagrant up

Wait until vagrant is finished

   vagrant ssh

   mkdir -p /var/www/app/src

   cd /var/www/app/src
   
Place/clone all your go packages here and `go build` or `go install` from there!
