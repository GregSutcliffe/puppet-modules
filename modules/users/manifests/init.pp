class users {

  # Class to ensure I exist everywhere
  user { 'greg':
    ensure     => present,
    comment    => 'Greg Sutcliffe',
    home       => '/home/greg',
    managehome => true,
    name       => 'greg',
    shell      => '/bin/bash',
    uid        => 2000,
  }

  file { '/home/greg/.ssh':
    ensure => directory,
    mode   => 0700,
    owner  => 'greg',
  }

  file { '/home/greg/.ssh/authorized_keys':
    ensure  => present,
    mode    => 0600,
    owner   => 'greg',
    content => template('users/greg.sshkey.pub')
  }

}
