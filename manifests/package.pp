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
  $use_backport = hiera('use_backport'),
) inherits inspircd::params {
  if $use_backport {
    file { '/etc/apt/preferences.d/inspircd.pref':
      ensure  => $ensure,
      content => template('inspircd/etc/apt/preferences.d/inspircd.pref.erb'),
    }
  }
  package { 'inspircd':
    ensure => $ensure,
    require => $use_backport ? {
      true => File['/etc/apt/preferences.d/inspircd.pref'],
      default => [],
    }
  }
}

