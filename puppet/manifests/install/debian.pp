class puppet::install::debian {

  $packages = [ "facter", "puppet", "puppet-common" ]

  package { $packages:
    ensure  => latest,
    notify  => Class["puppet::agent"],
  }

}
