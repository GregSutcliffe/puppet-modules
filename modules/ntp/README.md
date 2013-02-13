# puppet-ntp

Puppet module for managing the Network Time Server daemon (ntpd) on a Linux
host. Configuration can either be a list of time server hostnames to use or a
country code/continent which results in appropriate pool.ntp.org time server
hosts being used.

Currently only tested on Redhat-like systems.

## Parameters

*servers*: a list of time server hostnames

*iburst*: whether of not to enable the iburst option - default 'false'

*country*: the country code (eg. _de_ for Germany or _uk_ for United Kingdom)

*continent*: one of: _europe_, _asia_, _oceania_, _north-america_, _south-america_, _africa_

If servers is specified it takes precedence over country or continent.  If
only country and continent are specified then country takes precedence over
continent.

If use_hiera or use_extlookup are specified then the other parameters are
ignored.  Hiera is checked before extlookup.

### Puppet 3 Hiera configuration

Add an ntp::servers, ntp::country or ntp::continent variable to a hiera config
file - for example in /etc/puppet/hieradata/common.yaml:

Add the ntp_servers variable with a list of time server hostnames (often
internal hosts):

    ntp::servers:
      - ntp1.domain.com

Or the ntp_country variable with a country code:

    ntp::country: de

Or the ntp_continent variable with one of 'europe', 'asia', 'oceania',
'north-america', 'south-america', 'africa':

    ntp::continent: africa

## Examples

Use default pool.ntp.org time servers:

    class { 'ntp': }

Specify a list of time servers to use:

    class { 'ntp':
      servers => [ 'ntp1.domain.com', 'ntp2.domain.com' ],
    }

Use time servers from a specific country, in this case the United Kingdom:

    class { 'ntp':
      country => 'uk',
    }

Use time servers from a specific continent, in this case Asia:

    class { 'ntp':
      continent => 'asia',
    }

## Notes

See [How do I use pool.ntp.org](http://www.pool.ntp.org/en/use.html) for
details of the available NTP zones.  NTP servers are not available for all
countries - see the country list under each continent - so use a continent or
the default pool if your country is not listed.

## Testing

Tests are implemented using RSpec, rspec-puppet and puppetlabs_spec_helper.  To
run them you will first need to install puppetlabs_spec_helper and
rspec-hiera-puppet:

    # gem install puppetlabs_spec_helper rspec-hiera-puppet

Then switch to the module directory and run rake:

    $ rake spec
    /usr/bin/ruby -S rspec spec/classes/ntp_spec.rb --color
    ............
    
    Finished in 1.02 seconds
    12 examples, 0 failures

## Support

License: Apache License, Version 2.0

GitHub URL: https://github.com/erwbgy/puppet-ntp
