node default {
  case $operatingsystem {
    'Archlinux': { Service { provider => "systemd" } }
    default:     { }
  }
}
