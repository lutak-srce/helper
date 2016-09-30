#
# = Class: helper::logstash
#
# Installs logstash and creates configs
class helper::logstash {

  case $::operatingsystem {
    'RedHat', 'CentOS', 'Fedora', 'Scientific', 'Amazon', 'OracleLinux': {
      include ::java::openjdk8
      include ::yum::repo::logstash
    }
    default: { }
  }

  include ::logstash

  # load configs from hiera
  $logstash_configs = hiera_hash('logstash::configfiles', {})
  create_resources(::logstash::configfile, $logstash_configs)
  $logstash_patterns = hiera_hash('logstash::patternfiles', {})
  create_resources(::logstash::patternfile, $logstash_patterns)

}
