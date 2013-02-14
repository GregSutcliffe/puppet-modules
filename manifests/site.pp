node default {
  case $operatingsystem {
    'Archlinux': {

      # Always use systemd, init is broken on Arch
      Service { provider => "systemd" }

      # System is not in the same place as Puppet thinks
      file { '/bin/systemctl':
        ensure => link,
        target => '/usr/bin/systemctl',
      }

      # Ensure repos are up-to-date
      file { '/etc/cron.hourly/pacman-repo-update':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => 0744,
        content => "#!/bin/bash\nexec ionice -c 2 -n 7 nice -n 19 pacman -Sy\n"
      }

      package { 'ruby-augeas': ensure => installed }

    }
    default:     { }
  }
}
