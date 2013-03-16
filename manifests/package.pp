# == Class: inspircd::package
#
# Install InspIRCd.
#
# === Parameters
#
# None
#
# === Authors
#
# Evgeni Golov <evgeni@golov.de>
#
# === Copyright
#
# Copyright 2013 Evgeni Golov
#
class inspircd::package (
  $ensure = hiera('ensure', $inspircd::params::ensure),
) inherits inspircd::params {
  package { 'inspircd':
    ensure => $ensure,
  }
}
