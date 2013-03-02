class dirvish(
  $backup_location = $dirvish::params::backup_location,
  $vaults          = $dirvish::params::vaults
) inherits dirvish::params {

  anchor { 'dirvish::start':   } ->
  class  { 'dirvish::install': } ~>
  class  { 'dirvish::config':  } ~>
  class  { 'dirvish::service': } ~>
  anchor { 'dirvish::end':     }

}
