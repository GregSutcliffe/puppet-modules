class puppet::install {

  case $operatingsystem {
    "Archlinux":       { include puppet::install::archlinux }
    /(Debian|Ubuntu)/: { include puppet::install::debian }
    default:           { notice("Unknown Operatingsystem for puppet::install: $operatingsystem") }
  }

}
