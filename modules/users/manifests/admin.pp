define users::admin (
  $passwd = undef,
  $key    = undef,
  $uid    = undef,
  $shell  = 'bin/bash'
) {

  user { $name:
    ensure     => present,
    home       => "/home/${name}",
    managehome => true,
    name       => $name,
    shell      => $shell,
    uid        => $uid,
  }

  if $key == undef {
    # nothing to do
  }
  else {

    file { "/home/${name}/.ssh":
      ensure => directory,
      mode   => 0700,
      owner  => $name,
    }

    file { "/home/${name}/.ssh/authorized_keys":
      ensure  => present,
      mode    => 0600,
      owner   => $name,
      content => $key,
    }

  }

  sudo::directive { $name:
    ensure  => present,
    content => "$name ALL=(ALL) NOPASSWD: ALL\n",
  }

}
