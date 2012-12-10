class foreman_proxy::service {

  case $::operatingsystem {
    Archlinux: { $service_name = 'foreman-proxy.service' } # systemd workaround
    default: { $service_name = 'foreman-proxy' }
  }

  service { $service_name:
    ensure    => running,
    enable    => true,
    hasstatus => true,
    alias     => 'foreman-proxy',
    require   => Class['foreman_proxy::config'],
  }

}
