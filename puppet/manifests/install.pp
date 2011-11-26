class puppet::install {

  case $operatingsystem {
    "Archlinux": { include puppet::install::archlinux }
    "Debian":    { include puppet::install::debian }
    default:     { warn("Unknown Operatingsystem for puppet::install: $operatingsystem") }
  }

}
