class ntp::config (
  $servers, # array
  $iburst,  # bool
) {
  augeas { 'ntp-servers':
    changes => template('ntp/changes.erb'),
    incl    => '/etc/ntp.conf',
    lens    => 'Ntp.lns',
  }
}
