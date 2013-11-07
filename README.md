anchoring_mng
=============
This is rails application for manager anchorings.

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
  4. create your database
     depot> mysql -u root
     mysql> CREATE DATABASE depot_production DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
     mysql> GRANT ALL PRIVILEGES ON depot_production.*
     mysql-> TO 'username'@'localhost' IDENTIFIED BY 'password';
     mysql> EXIT;
  5. load the database
     rake db:setup RAILS_ENV="production"

