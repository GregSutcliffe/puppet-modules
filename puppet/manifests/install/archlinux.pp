class puppet::install::archlinux {

  $packages = [ "facter", "puppet" ]

  package { $packages:
    ensure   => latest,
    notify   => Class["puppet::agent"],
  }

}
