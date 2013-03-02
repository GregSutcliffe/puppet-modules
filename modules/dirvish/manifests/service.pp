class dirvish::service {

  # Dirvish runs from a cronjob
  cron { 'dirvish':
    command => '/etc/dirvish/dirvish-cronjob',
    user    => root,
    hour    => '2',
    minute  => '45'
  }

}
