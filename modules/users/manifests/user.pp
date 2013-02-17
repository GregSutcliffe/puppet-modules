define users::user (
  $role   = 'user',
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
    password   => $passwd,
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

  $sudo_string = $role ? {
    admin_nopasswd => "$name ALL=(ALL) NOPASSWD: ALL\n",
    admin          => "$name ALL=(ALL) ALL\n",
    default        => "\n",
  }

    sudo::directive { $name:
      ensure  => present,
      content => $sudo_string,
    }

}
