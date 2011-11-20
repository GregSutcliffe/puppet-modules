class puppet::devel inherits puppet::server {
  
  package { "vim-puppet":
    ensure => installed,
    notify => Exec["Enable Vim Syntax"],
  }

  exec { "Enable Vim Syntax":
    cwd => "/tmp",
    command => "/usr/bin/vim-addons -w install puppet",
    refreshonly => "true"
  }

  package { "mysql-server": ensure => installed }

  service { "mysql": ensure => running }

  file { 
    "/usr/local/sbin/create-puppet-db":
      mode => 755,
      owner => root,
      group => root,
      content => "#! /bin/bash
mysql -u root < /usr/local/sbin/create-puppet-db.sql
touch /usr/local/sbin/.create-puppet-db.created\n";
    "/usr/local/sbin/create-puppet-db.sql":
      mode => 644,
      owner => root,
      group => root,
      content => "-- SQL for Creating puppet db from fresh

-- Create the DB
CREATE DATABASE puppet;

-- Create the user
GRANT USAGE ON *.* TO 'puppet'@'%' IDENTIFIED BY 'dev_env_pw';
GRANT ALL PRIVILEGES ON `puppet`.* TO 'puppet'@'%';\n";
  }

  exec { "Create Puppet mysql db":
    command => "/usr/local/sbin/create-puppet-db",
    creates	=> "/usr/local/sbin/.create-puppet-db.created",
  }  

  Package["mysql-server"] -> Service["mysql"] -> File["/usr/local/sbin/create-puppet-db"] 
    File["/usr/local/sbin/create-puppet-db"] -> File["/usr/local/sbin/create-puppet-db.sql"] 
      File["/usr/local/sbin/create-puppet-db.sql"] -> Exec["Create Puppet mysql db"]
  
  Service["apache2"] -> Service["mysql"]

}
