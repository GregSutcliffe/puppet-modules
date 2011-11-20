class ssh::install {

  $packages = $operatingsystem ? {
    "Archlinux" => [ "openssh" ],
    "Debian"    => [ "openssh-server" ],
    default     => [ ]
  }
  package { $packages:
    ensure  => latest,
  }
  
}
