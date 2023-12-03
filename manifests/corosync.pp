#
# = Class: helper::corosync
#
# This class wraps create_resources around corosync hashes for Corosync objects
class helper::corosync {

  include corosync

  # cluster resources
  $corosync_resource_defaults = hiera_hash('corosync::resource_defaults', {}) 
  create_resources(cs_rsc_defaults, $corosync_resource_defaults)

  $corosync_primitives = hiera_hash('corosync::primitives', {}) 
  create_resources(cs_primitive, $corosync_primitives)

  $corosync_clones = hiera_hash('corosync::clones', {}) 
  create_resources(cs_clone, $corosync_clones)

  $corosync_locations = hiera_hash('corosync::locations', {}) 
  create_resources(cs_location, $corosync_locations)

  $corosync_colocations = hiera_hash('corosync::colocations', {}) 
  create_resources(cs_colocation, $corosync_colocations)

  $corosync_orders = hiera_hash('corosync::orders', {}) 
  create_resources(cs_order, $corosync_orders)

}
