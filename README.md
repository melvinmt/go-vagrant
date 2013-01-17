Sets up a basic Go/Golang development box using vagrant based on Ubuntu.

Uses chef recipes to provision `MongoDB`, `git`, `bazaar` and.. `go` of course.

The only thing I haven't figured out yet is how to export a path in a recipe so you'll need to ssh in and execute the following commands yourself:

    vagrant ssh
    export GPATH=/var/www/app
    export PATH=$PATH:/var/www/app/bin

I'll update this as soon as I've fixed it.
