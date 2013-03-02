# Trivial class to include the dirvish keys on the clients
#
# Requires that /root/.ssh/authorized_keys is present
#
class dirvish::client (
  $pre_script = 'undef'
) {

  # Read the dirvish key from the puppetmaster
  $pub_key  = ssh_keygen('dirvish_key','public')

  file_line { 'dirvish_ssh_pubkey':
    ensure => present,
    path   => '/root/.ssh/authorized_keys',
    line   => "ssh-rsa ${pub_key} dirvish_key\n",
  }

  $content = $pre_script ? {
    'undef' => template('dirvish/pre_client.sh.erb'),
    default => $pre_script,
  }

  # Basic pre-run script
  file { '/etc/dirvish_pre_client':
    owner   => 'root',
    group   => 'root',
    mode    => 0755,
    content => $content,
  }

  # Dirvish depends on rsync
  package { 'rsync': ensure => installed }

}
