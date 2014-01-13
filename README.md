anchoring_mng

=============
This is a rails application for manageing anchorings.

Requirement:
  ruby 1.9.3
  rails 3.2.13
  
Installation:
  1. install ruby 1.9.3
  2. install rails 3.2.13
     gem install rails -v 3.2.10
  3. install bundles
     enter to root directory of the application, 
     bundle install

Deployment:
  1. install apache2
  2. istall passenger
     $ sudo gem install passenger
     $ sudo passenger-install-apache2-module
  3. configure virtual host
     <VirtualHost *:80>
       ServerName depot.yourhost.com
       DocumentRoot /home/rubys/work/depot/public/
       <Directory /home/rubys/work/depot/public>
         Order allow,deny
         Allow from all
       </Directory>
     </VirtualHost>

  3. install mysql
  4. load the database
     rake db:setup RAILS_ENV="production"

Windows Deployment:
  1. download and install Microsoft Web Planform Instaler
  2. add Helicon Zoo Feed
  3. install Zoo->Templates->Ruby Project
  4. in Helicon Manager for IIS express, start Web console
    4.1 gem install rails
    4.2 rails new .
    4.3 copy rails app file to the folder
    4.4 bundle install
  5. create en empty web-site via IIS manager, and enable write permissions for the entire web site folder
  6. copy the files craete before in Helicon Manager for IIS manager to the web-site folder
  7. start web console in Helicon Manager for IIS
    7.1 type and execute command: rake assets:precompile
  8. rename the deploy_sample.rb to deploy.rb, and access the web site via browser, and the Helicon is going
     to the deplay the application
  9. After all above has been done, you are ok the access the application.
    
