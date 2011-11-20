class puppet::install {

  $packages = $operatingsystem ? {
    "Archlinux" => [ "puppet", "facter" ],
    "Debian"    => [ "facter", "puppet", "puppet-common" ],
    default     => [ ]
  }

  package { $packages:
    ensure  => latest,
    notify  => Class["puppet::agent"],
    provider => $operatingsystem ? {
      "Archlinux" => "yaourt",  # Use my custom yaourt provider
      default     => undef,
    }
  }

}
