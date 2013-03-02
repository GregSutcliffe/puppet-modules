class dirvish::params {

  # The place to store the backups
  $backup_location  = "/srv/backups"

  # The backups to perform. This is an example.
  $vaults = {
    test       => {
      client   => 'myclient',
      tree     => '/etc',
      excludes => [
        '*hosts*',
        '/etc/puppet'
      ]
    }
  }

}
