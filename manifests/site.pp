node default {
  case $operatingsystem {
    'Archlinux': { 
      Service { provider => "systemd" }
      file { '/bin/systemctl':
        ensure => link,
        target => '/usr/bin/systemctl',
      }
    }
    default:     { }
  }
}
