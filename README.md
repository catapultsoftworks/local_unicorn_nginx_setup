Usage:

    git clone https://github.com/ndoit/local_unicorn_nginx_setup
    cd local_unicorn_nginx_setup
    ruby run.rb
    # answer interactive questions and go!

* When running locally, make sure to select ports that don't conflict with existing ports.  You may wish to go manually unlink site files from /etc/nginx/sites-enabled to avoid this.  
* Make sure your Vagrantfile is forwarding the ports you want.  
* Older vagrant VMs probably have the default cert location as /etc/nginx/ssl.
* Pull requests welcome.

Example output:
```
*****************************************************
*  Let's set up your new app to use unicorn         *
*  and NGINX!                                       *
*****************************************************

Enter App Root (default value "/vagrant/apps/test_target"): 
Enter Unicorn Worker Count (default value "4"): 
Enter App Name (default value "test_target"): 
Enter Unicorn Port (default value "3000"): 
Enter Http Timeout (default value "30"): 
Enter Ssl Cert Path (default value "/ssl"): 
Enter Certificate Filename (default value "server.crt"): 
Enter Certificate Key Filename (default value "server.key"): 
Enter Http Port (default value "80"): 
Enter Ssl Port (default value "443"): 

- Uncommenting unicorn in Gemfile
- Generating unicorn config file at /vagrant/apps/test_target/config/unicorn.rb
- Generating NGINX  config file at /vagrant/apps/test_target/config/test_target_nginx.  The restart script will copy it into the nginx config path when you run it.
- Writing restart script at /vagrant/apps/test_target/restart.sh
- Making restart script executable

*****************************************************
*  Just run /vagrant/apps/test_target/restart.sh 
*  to start!      
*****************************************************
```
