class ntp (
  $servers   = undef,
  $iburst    = false,
  $country   = undef,
  $continent = undef
) {
  case $continent {
    undef:           {}
    'africa':        {}
    'asia':          {}
    'europe':        {}
    'north-america': {}
    'oceania':       {}
    'south-america': {}
    default: {
      notify { "ntp: unknown continent '${continent}' specified - known good values are: 'europe', 'asia', 'oceania', 'north-america', 'south-america', 'africa'": }
    }
  }

  if $servers {
    $_serverlist = $servers
  }
  elsif $country {
    $_serverlist = [
      "0.${country}.pool.ntp.org",
      "1.${country}.pool.ntp.org",
      "2.${country}.pool.ntp.org",
    ]
  }
  elsif $continent {
    $_serverlist = [
      "0.${continent}.pool.ntp.org",
      "1.${continent}.pool.ntp.org",
      "2.${continent}.pool.ntp.org",
    ]
  }
  else {
    $_serverlist = [
      '0.pool.ntp.org',
      '1.pool.ntp.org',
      '2.pool.ntp.org',
    ]
  }

  class { 'ntp::config':
    servers => $_serverlist,
    iburst  => $iburst,
  }
  include ntp::install
  include ntp::service
}
