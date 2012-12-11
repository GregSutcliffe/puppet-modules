class squid::service {

  service { 'squid.service':
    ensure => running,
    enable => true,
  }

}
