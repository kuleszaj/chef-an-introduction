name              "rails4"
maintainer        "Atomic Object, LLC"
maintainer_email  "admin@atomicobject.com"
license           "BSD"
description       "Ensures chef configuration is operational."
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.0.1"

recipe "default", "Sets up Ruby2, Passenger 4, and MySQL"

%w{ ubuntu }.each do |os|
    supports os
end

depends "apt"
depends "apache2"
depends "database"
