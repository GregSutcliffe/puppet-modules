class puppet::service {
  service {"${puppet::service_name}": require => Class['puppet::install'] }
}
