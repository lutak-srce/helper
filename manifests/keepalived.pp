#
# = Class: helper::keepalived
#
# This class wraps create_resources around hiera hashes for KeepAliveD stuff
class helper::keepalived {
  include ::keepalived

  # vrrp scripts
  $keepalived_vrrp_scripts = hiera_hash('keepalived::vrrp::scripts', {})
  create_resources(keepalived::vrrp::script, $keepalived_vrrp_scripts)

  # vrrp instances
  $keepalived_vrrp_instances = hiera_hash('keepalived::vrrp::instances', {})
  create_resources(keepalived::vrrp::instance, $keepalived_vrrp_instances)

}
