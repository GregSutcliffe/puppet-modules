# Basic SSH module
#
# Ensure sshd is running everywhere
# Also generates hostkeys on demand on the puppetmaster so that rebuilding
# a host doesn't cause MITM warnings
#
class ssh {

  package { 'openssh-server': ensure => installed }
  ~>
  file { '/etc/ssh/sshd_config':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('ssh/sshd.conf.erb')
  }
  ~>
  service { 'ssh':
    ensure => running,
    enable => true,
  }

}
