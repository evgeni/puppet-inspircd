class inspircd::params {
  case $::osfamily {
    Debian: { }
    default: {
      fail('This module only supports Debian-based systems')
    }
  }
  $ensure = present
  $ensure_enable = true
  $ensure_running = running
  $description = "InspIRCd server"
  $networkname = "localnet"
  $adminname = "root rootsen"
  $adminnick = "root"
  $adminemail = "root@example.com"
  $ips = ['127.0.0.1', $::ipaddress]
}
