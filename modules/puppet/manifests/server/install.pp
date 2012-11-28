class puppet::server::install {

  case $operatingsystem {
    'Archlinux': { } # master package is also called puppet, which causes a duplicate resource
    default:     { package { $puppet::server::master_package: ensure => installed } }
  }

}
