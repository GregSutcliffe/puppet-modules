class puppet::agent::daemon {

  # Cleanup Cron version if we're moving an old host
  cron { 'puppet-agent': ensure => absent }
  file { '/usr/local/sbin/run_puppet': ensure  => absent }

  # Daemon setup
  file { "/etc/default/puppet": content => "START=yes\nDAEMON_OPTS=''\n" }
  
  service { "puppet": 
    ensure    => running,
    subscribe => [File['/etc/default/puppet'],File['/etc/puppet/puppet.conf']]
  }

}
