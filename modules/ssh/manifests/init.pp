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

  # Generate RSA keys reliably
  $rsa_priv = ssh_keygen({name => "ssh_host_rsa_${::fqdn}", dir => 'ssh/hostkeys'}) 
  $rsa_pub  = ssh_keygen({name => "ssh_host_rsa_${::fqdn}", dir => 'ssh/hostkeys', public => 'true'}) 

  file { '/etc/ssh/ssh_host_rsa_key':
    owner   => 'root',
    group   => 'root',
    mode    => 0600,
    content => $rsa_priv,
  }

  file { '/etc/ssh/ssh_host_rsa_key.pub':
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => "ssh-rsa $rsa_priv host_rsa_${::hostname}\n",
  }

  ## Generate DSA keys reliably
  #$dsa_priv = ssh_keygen({name => "ssh_host_dsa_${::fqdn}", dir => 'ssh/hostkeys', type => 'dsa'})
  #$dsa_pub  = ssh_keygen({name => "ssh_host_dsa_${::fqdn}", dir => 'ssh/hostkeys', type => 'dsa', public => 'true'})

  #file { '/etc/ssh/ssh_host_dsa_key':
  #  owner   => 'root',
  #  group   => 'root',
  #  mode    => 0600,
  #  content => $dsa_priv,
  #}

  #file { '/etc/ssh/ssh_host_dsa_key.pub':
  #  owner   => 'root',
  #  group   => 'root',
  #  mode    => 0644,
  #  content => "ssh-rsa $dsa_priv host_rsa_${::hostname}\n",
  #}
}
