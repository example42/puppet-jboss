# Class: jboss::params
#
# This class defines default parameters used by the main module class jboss
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to jboss class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class jboss::params {

  ### Module specific parameters
  $version = '6'
  $install = 'source'
  $install_dirname = 'jboss'
  $created_dirname = ''
  $install_precommand = ''
  $install_postcommand = ''
  $manage_user = true
  $user_uid = undef
  $user_gid = undef
  $init_script_template = ''
  $conf_script_template = ''
  $bindaddr = '127.0.0.1'
  $bindaddr_admin_console = '127.0.0.1'
  $mode = ''

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'jboss',
  }

  $service = $::operatingsystem ? {
    default => 'jboss',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'java',
  }

  $process_args = $::operatingsystem ? {
    default => 'jboss',
  }

  $process_user = $::operatingsystem ? {
    default => 'jboss',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/jboss.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/var/lib/jboss',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/jboss',
  }

  $log_file = $::operatingsystem ? {
    default => '',
  }

  $port = '8080'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $puppi = false
  $puppi_helper = 'phpapp'
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/24'
  $firewall_dst = $::ipaddress
  $debug = false
  $audit_only = false

}
