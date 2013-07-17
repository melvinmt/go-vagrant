Sets up a basic Go/Golang development box using vagrant based on Ubuntu.


Uses chef recipes to provision `MongoDB`, `git`, `bazaar` and.. `go` of course.

# Installation

Install [vagrant](http://downloads.vagrantup.com/) on your machine.

Open terminal:

    git clone https://github.com/melvinmt/go-vagrant.git go-projects
    cd go-projects
    git submodule update --init --recursive
    cd vagrant
    vagrant up
    
   
Place/clone all your go packages in src and `go build` or `go install` from there!
