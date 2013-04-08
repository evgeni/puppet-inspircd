# == Class: inspircd::config
#
# Create configuration files for InspIRCd, based on default settings
# from inspircd::params and hiera.
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
class inspircd::config (
  $ensure      = hiera('ensure', $inspircd::params::ensure),
  $servername  = hiera('servername', $::fqdn),
  $network     = hiera('network', $servername),
  $description = hiera('description', $inspircd::params::description),
  $networkname = hiera('networkname', $inspircd::params::networkname),
  $adminname   = hiera('adminname', $inspircd::params::adminname),
  $adminemail  = hiera('adminemail', $inspircd::params::adminemail),
  $adminnick   = hiera('adminnick', $inspircd::params::adminnick),
  $ips         = hiera('ips', $inspircd::params::ips),
  $opers       = hiera('opers', []),
  $ssl         = hiera('ssl', undef),
  $cafile      = hiera('cafile', undef),
  $certfile    = hiera('certfile', undef),
  $keyfile     = hiera('keyfile', undef),
  $ldapauth    = hiera('ldapauth', undef),
) inherits inspircd::params {
  file { '/etc/inspircd/inspircd.conf':
    ensure  => $ensure,
    owner   => 'irc',
    group   => 'irc',
    mode    => '0400',
    content => template('inspircd/inspircd.conf.erb'),
    require => Package['inspircd'],
    notify  => Class['inspircd::service'],
  }

  file { '/etc/default/inspircd':
    ensure  => $ensure,
    owner   => 'irc',
    group   => 'irc',
    mode    => '0400',
    source  => 'puppet:///modules/inspircd/default',
    require => Package['inspircd'],
    notify  => Class['inspircd::service'],
  }
}
