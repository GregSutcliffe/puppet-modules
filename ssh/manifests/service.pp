class ssh::service {

  $ssh_name = $operatingsystem ? {
    "Archlinux" => "sshd",
    default => "ssh",
  }

  service { "$ssh_name":
    alias  => "ssh",
    ensure => running,
    status    => $operatingsystem ? {
      "Archlinux" => "pgrep sshd",
         "Ubuntu" => "/etc/init.d/ssh status",
          default => undef
    },
    provider  => $operatingsystem ? {
      "Archlinux" => "init",
          default => undef
    },
    path   => [ '/etc/init.d', '/etc/rc.d' ],
  }

}
