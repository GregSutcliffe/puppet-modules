class ntp::service {

  $service_name =  $::operatingsystem ? {
    "Archlinux" => 'ntpd.service',  # systemd workaround
    "Ubuntu"    => 'ntp',
    "Debian"    => 'ntp',
    default     => 'ntpd',
  }

  service { 'ntpd':
    ensure     => running,
    name       => $service_name,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['ntp::config'],
  }

}
