define dirvish::vault(
  $client,
  $tree,
  $excludes = [],
) {

  file { "${::dirvish::backup_location}/${name}":
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => 0644,
  }
  ->
  file { "${::dirvish::backup_location}/${name}/dirvish":
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => 0644,
  }
  ->
  file { "${::dirvish::backup_location}/${name}/dirvish/default.conf":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => template('dirvish/vault.erb')
  }
  ~>
  # Initialize the vault. This could take a while, so we disable the timeout.
  # By using both creates and refreshonly, we hopefully avoid re-running this
  # when the 'initial' image rotates out
  exec { "Initialize Dirvish Vault: ${name}":
    timeout     => 0,
    command     => "/usr/sbin/dirvish --init --vault ${name} --image initial",
    refreshonly => true,
    creates     => "${::dirvish::backup_location}/${name}/initial",
    require     => File['/etc/dirvish/master.conf'],
  }


}
