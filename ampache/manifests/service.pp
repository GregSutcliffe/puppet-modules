class ampache::service {

  # This should really be in an apache module
  service { "apache2":
    ensure    => running, enable => true, hasstatus => true, hasrestart => true,
    subscribe => Package["ampache"]
   }

  exec { "reload-apache":
    command     => "/etc/init.d/apache2 reload",
    onlyif      => "/usr/sbin/apachectl -t",
    require     => Service["apache2"],
    refreshonly => true,
  }

}
