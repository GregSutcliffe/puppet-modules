class ampache::mpd {

  # Client class for the ampache server to connect to
  $user = $operatingsystem ? {
    "Archlinux" => "greg",
    "Ubuntu"    => "mythuser",
  }

  package { 'mpd': ensure => present }

  File { require => Package['mpd'], before => Service['mpd'] }

  file { '/etc/mpd.conf':
    content => template('ampache/mpd.conf'),
    notify  => Service['mpd']
  }

  file { 
    '/var/lib/mpd/playlists':
      ensure  => directory,
      owner   => "$user";
    '/var/lib/mpd/mpd.db': owner => "$user";
    '/var/lib/mpd/mpdstate': owner => "$user";
    '/var/run/mpd':
      ensure  => directory,
      owner   => "$user";
    '/var/run/mpd/mpd.pid': owner => "$user";
  }

  service { 'mpd':
    ensure   => running,
    status   => $operatingsystem ? {
      "Archlinux" => 'ls /run/daemons/mpd',
         "Ubuntu" => 'pgrep mpd',
          default => undef
    },
    provider => $operatingsystem ? {
      "Archlinux" => "init",
          default => undef
    },
    path     => [ '/etc/init.d', '/etc/rc.d' ]
  }
}
