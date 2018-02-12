#
# = Class: helper::apache
#
# Installs apache and creates vhosts from Hiera hashes
class helper::apache {
  include ::apache

  file { '/etc/logrotate.d/httpd':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/helper/apache.logrotate',
    require => Package['httpd'],
  }

  # Create virtual hosts
  $apache_vhosts = hiera_hash('apache::vhosts', {})
  create_resources(::apache::vhost, $apache_vhosts)

  # Create simple virtual hosts
  $apache_vhosts_simple = hiera_hash('apache::vhosts_simple', {})
  create_resources(::apache::vhostsimple, $apache_vhosts_simple)

}
