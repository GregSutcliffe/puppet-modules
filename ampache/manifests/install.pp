class ampache::install {

  # For Ubuntu 11.10
  # Needs Apache, Mysql, Php (not configured here)

  package { ["unzip","php5-gd", "ampache"]: 
    ensure => installed,
    notify => Exec["reload-apache"]
  }

  exec { "enable-ampache":
    command => "/usr/sbin/a2enmod ApacheAmpache",
    creates => "/etc/apache2/sites-enabled/ApacheAmpache",
    notify  => Exec["reload-apache"],
    require => Package["ampache"],
  }

  exec { "install-flash-plugin":
    command => "/bin/bash /usr/share/ampache/www/bin/grab_xspf.sh",
    creates => "/usr/share/ampache/www/modules/flash/xspf_jukebox.swf",
    require => Package["ampache"],
  }
    

}
