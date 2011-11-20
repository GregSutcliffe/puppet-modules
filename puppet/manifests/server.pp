class puppet::server inherits puppet::agent {

  #package { ["libmysql-ruby","libactiverecord-ruby1.8"]: ensure => installed }

  File["/etc/puppet/puppet.conf"] {
    content => template("puppet/puppet.conf.core.erb","puppet/puppet.conf.master.erb")
  }
  
  file {
    "/etc/puppet/kill_node_in_storeconfigs_db.rb":
      ensure  => present,
      mode    => 755,
      source  => "puppet:///modules/puppet/kill_node_in_storeconfigs_db.rb";
  }

}
