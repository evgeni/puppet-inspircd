class inspircd::package (
  $ensure = hiera('ensure', $inspircd::params::ensure),
) inherits inspircd::params {
  package { 'inspircd':
    ensure => $ensure,
  }
}
