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

}
