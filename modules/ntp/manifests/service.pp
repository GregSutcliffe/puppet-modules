class ntp::service {
  service { 'ntpd':
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['ntp::config'],
  }
}
