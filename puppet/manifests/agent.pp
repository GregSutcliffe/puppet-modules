class puppet::agent {

  file { '/etc/puppet/puppet.conf':
    content => template('puppet/puppet.conf.core.erb')
  }

  # This stuff depends on the daemonization
  $minute1 = fqdn_rand(30)
  $minute2 = $minute1 + 30
  cron { 'puppet-agent':
    ensure  => $p_daemonize ? {
      'true'  => absent,
      default => present
    },
    command => '/usr/local/sbin/run_puppet',
    user    => root,
    hour    => '*',
    minute  => [ $minute1, $minute2 ]
  }

  file { '/usr/local/sbin/run_puppet':
    ensure  => $p_daemonize ? {
      'true'  => absent,
      default => present
    },
    owner   => 'root',
    group   => 'root',
    mode    => 744,
    content => template('puppet/run_puppet.erb')
  }

  # Daemon setup
  file { '/etc/default/puppet':
    ensure  => $p_daemonize ? {
      'true'  => present,
      default => absent
    },
    content => "START=yes\nDAEMON_OPTS=''\n"
  }
  
  service { 'puppet':
    ensure    => $p_daemonize ? {
         'true' => running,
        default => stopped
    },
    status    => $operatingsystem ? {
      "Archlinux" => "pgrep puppetd",
         "Ubuntu" => "/etc/init.d/puppet status",
          default => undef
    },
    provider  => $operatingsystem ? {
      "Archlinux" => "init",
          default => undef
    },
    path      => [ '/etc/init.d', '/etc/rc.d' ],
    subscribe => [ File['/etc/default/puppet'], File['/etc/puppet/puppet.conf'] ]
  }

}
