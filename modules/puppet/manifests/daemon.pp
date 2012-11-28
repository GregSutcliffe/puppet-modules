class puppet::daemon inherits puppet::service {
  Service["${puppet::service_name}"] {
    enable => true,
    ensure => running,
  }

  cron { 'puppet': ensure => absent }

}
