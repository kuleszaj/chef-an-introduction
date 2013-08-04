# Example Recipe
# Let's setup Passenger to run a Rails app
# Geared for Ubuntu 12.04 LTS...

# Some basic stuff that we'll likely want...
package "vim"
package "git"

# Uses the Opscode 'apt' LWP to setup another apt source (ppa repo)
apt_repository "brightbox-ruby-ng-experimental" do
  uri "http://ppa.launchpad.net/brightbox/ruby-ng-experimental/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "C3173AA6"
end

apt_repository "brightbox-passenger-experimental" do
  uri "http://ppa.launchpad.net/brightbox/passenger-experimental/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "C3173AA6"
end

# Install the "ruby2.0" and "ruby2.0-dev" package via apt
package "ruby2.0"
package "ruby2.0-dev"

# Bundler for managing our gems
gem_package "bundler"

# Install the libcurl4-openssl-dev package via apt (needed for Passenger)
package "libcurl4-openssl-dev"

# Install the "apache2-dev" package via apt (needed for Passenger)
package "apache2-dev"

# Install the "libapache2-mod-passenger" package via apt
package "libapache2-mod-passenger"

# Uses the Opscode 'apache2' LWP to setup an Apache2 virtual host
web_app "rails4" do
  server_name node['hostname']
  server_aliases [node['fqdn'], "my-site.example.com"]
  docroot "/var/www/rails4/current/public"
  allow_override ["All"]
  directory_options ["-MultiViews"]
end

# Create has containing database info
mysql_connection_info = {:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']}

# Uses the Opscode 'mysql_database' LWP set create a database
mysql_database 'rails4' do
  connection mysql_connection_info
  action :create
end

# Uses the Opscode 'mysql_database' LWP set create a database user with full permissions
mysql_database_user 'rails_user' do
  connection mysql_connection_info
  password 'super_secret'
  database_name 'rails4'
  host 'localhost'
  privileges [:all]
  action [:create,:grant]
end

