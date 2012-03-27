# Class: jboss::service
#
# This class manages jboss services
#
# == Variables
#
# Refer to jboss class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by jboss
#
class jboss::service inherits jboss {

  case $jboss::install {

    package: {
      service { 'jboss':
        ensure     => $jboss::manage_service_ensure,
        name       => $jboss::service,
        enable     => $jboss::manage_service_enable,
        hasstatus  => $jboss::service_status,
        pattern    => $jboss::process,
        require    => Package['jboss'],
      }
    }

    source: {
    }

    puppi: {
    }

    default: { }

  }


  ### Service monitoring, if enabled ( monitor => true )
  if $jboss::bool_monitor == true {
    monitor::port { "jboss_${jboss::protocol}_${jboss::port}":
      protocol => $jboss::protocol,
      port     => $jboss::port,
      target   => $jboss::monitor_target,
      tool     => $jboss::monitor_tool,
      enable   => $jboss::manage_monitor,
    }
    monitor::process { 'jboss_process':
      process  => $jboss::process,
      service  => $jboss::service,
      pidfile  => $jboss::pid_file,
      user     => $jboss::process_user,
      argument => $jboss::process_args,
      tool     => $jboss::monitor_tool,
      enable   => $jboss::manage_monitor,
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $jboss::bool_firewall == true {
    firewall { "jboss_${jboss::protocol}_${jboss::port}":
      source      => $jboss::firewall_source,
      destination => $jboss::firewall_destination,
      protocol    => $jboss::protocol,
      port        => $jboss::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $jboss::firewall_tool,
      enable      => $jboss::manage_firewall,
    }
  }

}
