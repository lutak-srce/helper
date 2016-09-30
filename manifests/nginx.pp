#
# = Class: helper::nginx
#
# Installs nginx and creates vhosts from Hiera hashes
class helper::nginx {
  include ::yum::repo::nginx
  include ::nginx

  # Create virtual hosts
  $nginx_vhosts = hiera_hash('nginx::vhosts', {})
  create_resources(::Nginx::Vhost, $nginx_vhosts)

  # Create locations
  $nginx_locations = hiera_hash('nginx::locations', {})
  create_resources(::Nginx::Location, $nginx_locations)
}
