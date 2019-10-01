#
# = Class: helper::postgresql
#
# Installs postgresql and creates roles/databases/hbas from Hiera hashes
class helper::postgresql {
  # postgresql
  include ::postgresql::client
  include ::postgresql::server

  # roles
  $postgresql_roles = hiera_hash('postgresql::roles', {})
  create_resources(::postgresql::server::role, $postgresql_roles)

  # databases
  $postgresql_databases = hiera_hash('postgresql::databases', {})
  create_resources(::postgresql::server::database, $postgresql_databases)

  # Host based access rules
  $postgresql_hba_rules = hiera_hash('postgresql::hba_rules', {})
  create_resources(::postgresql::server::pg_hba_rule, $postgresql_hba_rules)

}
