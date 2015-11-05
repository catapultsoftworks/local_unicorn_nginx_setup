Usage:

    git clone https://github.com/ndoit/local_unicorn_nginx_setup
    cd local_unicorn_nginx_setup
    ruby run.rb

* When running locally, make sure to select ports that don't conflict with existing ports.  You may wish to go manually unlink site files from /etc/nginx/sites-enabled to avoid this.  
* Make sure your Vagrantfile is forwarding the ports you want.  
* Older vagrant VMs probably have the default cert location as /etc/nginx/ssl.
* Pull requests welcome.
