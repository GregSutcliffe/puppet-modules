What is it?
===========

A Puppet module for installing and configuring Ampache and MPD

Released under the Apache 2.0 licence

Testing:
--------

This has only been tested on Ubuntu Server 11.10. The MPD client has also been
tested on ArchLinux.

Usage:
------

Review the parameters in ampache::params (not much in there right now)

* TODO: Move the other params from config to params

Your music server should include the ampache class, and you need to set the
variable "db_pass" for database access.

Any machine you want to control mpd on from Ampache should include ampache::mpd

Known Issues:
-------------

Ampache is a typical PHP webservice - it expects you to set up Apache, Mysql
and PHP (all out of scope for this module) and then surf to "myhost/ampache"
and run the installer.

There is a stub service class which ensures Apache is running and can be restarted
when the Ampache vhost is added. If you already have a Apache class, remove this
one and notify your own from install and config.

As such, this module doesn't do much - it does deploy a config file (which was
generated when _I_ installed ampache, but that's not very helpful to anyone else.

I would recommend following the basic Ampache install before copying the resulting
config file into this module, and then use this to _maintain_ your installation

For MPD, it is common for PulseAudio to run as a user, so mpd needs to be run as
the same user for it to play sound. For MythTV this will be whatever user is 
running the Mythfrontend process. Adjust ampache::mpd appropriately, and review
templates/mpd.conf

Integration of MPD streams to Ampache is not yet written - add it in Ampache
under Localplay -> Add Instance.

Contact:
--------
greg.sutcliffe@gmail.com
gwmngilfen on Freenode ( #puppet / #foreman / #archlinux )
