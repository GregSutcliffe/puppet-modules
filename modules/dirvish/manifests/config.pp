class dirvish::config {

  # The main config file
  file { '/etc/dirvish/master.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('dirvish/master.conf.erb')
  }

  create_resources(dirvish::vault,$::dirvish::vaults)

}
