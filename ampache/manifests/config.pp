class ampache::config {

  # Create database - beyond scope of this module

  $debug_a = $ampache::params::debug
  file { '/etc/ampache/ampache.cfg.php':
    content => template('ampache/ampache.cfg.php')
  }

  # This creates update crons that import music into ampache, and sort it
  file { '/etc/cron.d/ampache':
    content => "# Ampache cleanup
25 5 * * * root php /usr/share/ampache/www/bin/catalog_update.inc 2>&1 > /var/log/ampache/catalog_update.log
35 * * * * root php /usr/share/ampache/www/bin/catalog_update.inc -a -c 2>&1 >> /var/log/ampache/catalog_update.log
45 * * * * root php /usr/share/ampache/www/bin/sort_files.inc 2>&1 >> /var/log/ampache/catalog_update.log
55 * * * * root find /usr/share/ampache/music -type d -empty -delete
56 * * * * root chown -R www-data /usr/share/ampache/music\n"
  }

}
