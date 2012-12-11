# basic squid module to cache requests
# good for repeated OS installs
#
class squid {
  class { 'squid::install': } ~>
  class { 'squid::config':  } ~>
  class { 'squid::service': }
}
