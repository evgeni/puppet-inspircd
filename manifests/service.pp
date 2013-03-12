class inspircd::service (
  $ensure_enable  = hiera('ensure_enable', $inspircd::params::ensure_enable),
  $ensure_running = hiera('ensure_running', $inspircd::params::ensure_running),
) inherits inspircd::params {
  service { 'inspircd':
    ensure     => $ensure_running,
    enable     => $ensure_enable,
    hasrestart => true,
    hasstatus  => true,
    require    => Class['inspircd::config'],
  }
}
