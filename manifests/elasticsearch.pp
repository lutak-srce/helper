#
# = Class: helper::elasticsearch
#
# Installs nginx and creates configs for elasticsearch
class helper::elasticsearch {

  include ::java::openjdk8
  include ::yum::repo::elasticsearch
  include ::elasticsearch

  # Create virtual hosts
  $elasticsearch_plugins = hiera_hash('elasticsearch::plugins', {})
  create_resources(::Elasticsearch::Plugin, $elasticsearch_plugins)

  File {
    ensure => file,
    owner  => root,
    group  => root,
  }

  # add daily cron to delete old indices
  file { '/usr/local/bin/rmindices':
    mode   => '0755',
    source => 'puppet:///modules/helper/rmindices',
  }
  file { '/etc/cron.d/rmindices':
    mode   => '0644',
    source => 'puppet:///modules/helper/rmindices.crond',
  }

}
