# = Class: jboss
#
# This is the main jboss class
#
#
# == Parameters
#
# Module Specific params
#
# [*version*]
#   The Jboss version you want to install. The default install_source is
#   calculated according to itu.
#
# [*install*]
#   Kind of installation to attempt:
#     - package : Installs jboss using the OS common packages
#     - source  : Installs jboss downloading and extracting a specific
#                 tarball or zip file
#     - puppi   : Installs jboss tarball or file via Puppi, creating the
#                 "puppi deploy jboss" command
#   Can be defined also by the variable $jboss_install
#
# [*install_source*]
#   The URL from where to retrieve the source tarball/zip.
#   Used if install => "source" or "puppi"
#   Default is from upstream developer site. Update the version when needed.
#   Can be defined also by the variable $jboss_install_source
#
# [*install_destination*]
#   The base path where to extract the source tarball/zip.
#   Used if install => "source" or "puppi". Default /opt
#   Can be defined also by the variable $jboss_install_destination
#
# [*install_dirname*]
#   Name of the jboss directory. A link in install_destination with this name
#   and pointing to the created_dirname is created during puppi or source
#   installation. Default jboss (So by default you have /opt/jboss)
#
# [*created_dirname*]
#   Name of the directory created by the source tarball/zip
#   Default is based on the official sources. You hardly need to override it#
#
# [*install_precommand*]
#   A custom command to execute before installing the source tarball/zip.
#   Used if install => "source" or "puppi"
#   Check jboss/manifests/params.pp before overriding the default settings
#   Can be defined also by the variable $jboss_install_precommand
#
# [*install_postcommand*]
#   A custom command to execute after installing the source tarball/zip.
#   Used if install => "source" or "puppi"
#   Check jboss/manifests/params.pp before overriding the default settings
#   Can be defined also by the variable $jboss_install_postcommand
#
# [*manage_user*]
#   Define if the Jboss user has to be automatically created on puppi/source
#   installation. Default: true. Set to false if you manage user jboss
#   in other ways (note: As user as defined in process_user (jboss) must exist)
#
# [*user_uid*]
#   The uid of the jboss user ($process_user). Default: undefined
#
# [*user_gid*]
#   The gid of the jboss user ($process_user). Default: undefined
#
# [*init_script_template*]
#   The template to use to create the init script (when installation is not
#   made via packages).
#
# [*conf_script_template*]
#   The template to use to create the configuration script imported by the
#   Jboss startup shell script. Default: undefined
#
# [*bindaddr*]
#   Bind address of Jboss . Default 127.0.0.1
#
# [*bindaddr_admin_console*]
#   The address where to bind the admin console of the Jboss instance. Default: 127.0.0.1
#
# [*mode*]
#   Jboss Mode.
#   - On Jboss 7 refers to operating mode:
#     Possible values: standalone (default) , domain
#   - On earling versions refers to the server template to use
#     Possible values: default (default) , all , minimal
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, jboss class will automatically "include $my_class"
#   Can be defined also by the variable $jboss_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, jboss main config file will have the param:
#   source => $source
#   Can be defined also by the variable $jboss_source
#
# [*source_dir*]
#   If defined, the whole jboss configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the variable $jboss_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the variable $jboss_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, jboss main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the variable $jboss_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the variable $jboss_options
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the variable $jboss_absent
#
# [*service_autorestart*]
#   Automatically restarts the jboss service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Set to '' to avoid the management of jboss service. Useful when using
#   multiple instances.
#   Can be defined also by the (top scope) variable $jboss_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $jboss_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the variables $jboss_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for jboss checks
#   Can be defined also by the variables $jboss_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the variables $jboss_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the variables $jboss_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the variables $jboss_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $jboss_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for jboss port(s)
#   Can be defined also by the (top scope) variables $jboss_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling jboss. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $jboss_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $jboss_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the variables $jboss_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the variables $jboss_audit_only
#   and $audit_only
#
# Default class params - As defined in jboss::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of jboss package
#
# [*service*]
#   The name of jboss service
#
# [*service_status*]
#   If the jboss service init script supports status argument
#
# [*process*]
#   The name of jboss process
#
# [*process_args*]
#   The name of jboss arguments. Used by puppi and monitor.
#   Used only in case the jboss process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user jboss runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $jboss_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $jboss_protocol
#
#
# == Examples
#
# You can use this class in 2 ways:
# - Set variables (at top scope level on in a ENC) and "include jboss"
# - Call jboss as a parametrized class
#
# See README for details.
#
#
# == Author
#   Alessandro Franceschi <al@lab42.it/>
#
class jboss (
  $version             = params_lookup( 'version' ),
  $install             = params_lookup( 'install' ),
  $install_source      = params_lookup( 'install_source' ),
  $install_destination = params_lookup( 'install_destination' ),
  $install_dirname     = params_lookup( 'install_dirname' ),
  $created_dirname     = params_lookup( 'created_dirname' ),
  $install_precommand  = params_lookup( 'install_precommand' ),
  $install_postcommand = params_lookup( 'install_postcommand' ),
  $manage_user         = params_lookup( 'manage_user' ),
  $user_uid            = params_lookup( 'user_uid' ),
  $user_gid            = params_lookup( 'user_gid' ),
  $init_script_template = params_lookup( 'init_script_template' ),
  $conf_script_template = params_lookup( 'conf_script_template' ),
  $bindaddr            = params_lookup( 'bindaddr' ),
  $bindaddr_admin_console = params_lookup('bindaddr_admin_console'),
  $mode                = params_lookup( 'mode' ),
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $source_dir          = params_lookup( 'source_dir' ),
  $source_dir_purge    = params_lookup( 'source_dir_purge' ),
  $template            = params_lookup( 'template' ),
  $service_autorestart = params_lookup( 'service_autorestart' , 'global' ),
  $options             = params_lookup( 'options' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $firewall            = params_lookup( 'firewall' , 'global' ),
  $firewall_tool       = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src        = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst        = params_lookup( 'firewall_dst' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $package             = params_lookup( 'package' ),
  $service             = params_lookup( 'service' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_dir          = params_lookup( 'config_dir' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $config_file_init    = params_lookup( 'config_file_init' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' ),
  $port                = params_lookup( 'port' ),
  $protocol            = params_lookup( 'protocol' )
  ) inherits jboss::params {

  $bool_manage_user=any2bool($manage_user)
  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)


  ### Definition of some variables used in the module
  $manage_package = $jboss::bool_absent ? {
    true  => 'absent',
    false => 'present',
  }

  $manage_service_enable = $jboss::bool_disableboot ? {
    true    => false,
    default => $jboss::bool_disable ? {
      true    => false,
      default => $jboss::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $jboss::bool_disable ? {
    true    => 'stopped',
    default =>  $jboss::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $jboss::bool_service_autorestart ? {
    true    => $disable ? {
      ''      => undef,
      default => Service[jboss],
    },
    false   => undef,
  }

  $manage_file = $jboss::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $jboss::bool_absent == true
  or $jboss::bool_disable == true
  or $jboss::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $jboss::bool_absent == true
  or $jboss::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $jboss::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $jboss::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $jboss::source ? {
    ''        => undef,
    default   => $jboss::source,
  }

  $manage_file_content = $jboss::template ? {
    ''        => undef,
    default   => template($jboss::template),
  }

  ### Calculations of variables whose value depends on different params
  # If this seems complex... you are right, but managing automatically different
  # versions and cases IS complex...

  $real_install_source = $jboss::install_source ? {
    ''      => $jboss::version ? {
      '4' => 'http://sourceforge.net/projects/jboss/files/JBoss/JBoss-4.2.3.GA/jboss-4.2.3.GA.zip',
      '5' => 'http://sourceforge.net/projects/jboss/files/JBoss/JBoss-5.1.0.GA/jboss-5.1.0.GA.zip',
      '6' => 'http://download.jboss.org/jbossas/6.1/jboss-as-distribution-6.1.0.Final.zip',
      '7' => 'http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.zip',
    },
    default => $jboss::install_source,
  }

  $real_created_dirname = $jboss::created_dirname ? {
    ''      => $jboss::version ? {
      '4' => 'jboss-4.2.3.GA',
      '5' => 'jboss-5.1.0.GA',
      '6' => 'jboss-6.1.0.Final',
      '7' => 'jboss-as-7.1.1.Final',
    },
    default => $jboss::created_dirname,
  }

  $real_init_script_template = $jboss::init_script_template ? {
    ''      => $jboss::version ? {
      '4' => 'jboss/jboss6.init.erb',
      '5' => 'jboss/jboss6.init.erb',
      '6' => 'jboss/jboss6.init.erb',
      '7' => 'jboss/jboss7.init.erb',
    },
    default => $jboss::init_script_template,
  }

  $real_install_destination = $jboss::install_destination ? {
    ''      => '/opt',
    default => $jboss::install_destination,
  }

  $real_jboss_dir = "$real_install_destination/$install_dirname"

  $real_install_postcommand = $jboss::install_postcommand ? {
    ''      => "chown -R ${jboss::process_user} ${jboss::real_install_destination}/${jboss::real_created_dirname}",
    default => $jboss::install_postcommand,
  }

  $real_mode = $mode ? {
    ''      => $jboss::version ? {
      '4' => 'default',
      '5' => 'default',
      '6' => 'default',
      '7' => 'standalone',
    },
    default => $jboss::mode,
  }

  $real_config_file = $jboss::config_file ? {
    ''      => $jboss::version ? {
      '4' => "${jboss::real_jboss_dir}/server/${jboss::real_mode}/conf/jboss-service.xml",
      '5' => "${jboss::real_jboss_dir}/server/${jboss::real_mode}/conf/jboss-service.xml",
      '6' => "${jboss::real_jboss_dir}/server/${jboss::real_mode}/conf/jboss-service.xml",
      '7' => "${jboss::real_jboss_dir}/${jboss::real_mode}/configuration/${jboss::real_mode}.xml",
    },
    default => $jboss::config_file,
  }

  $real_conf_script_path = $jboss::version ? {
    '4' => "${jboss::real_jboss_dir}/server/${jboss::real_mode}/bin/run.conf",
    '5' => "${jboss::real_jboss_dir}/server/${jboss::real_mode}/bin/run.conf",
    '6' => "${jboss::real_jboss_dir}/server/${jboss::real_mode}/bin/run.conf",
    '7' => "${jboss::real_jboss_dir}/bin/${jboss::real_mode}.conf",
  }

  $real_instance_basedir = $jboss::version ? {
    '4' => "${jboss::real_jboss_dir}/server",
    '5' => "${jboss::real_jboss_dir}/server",
    '6' => "${jboss::real_jboss_dir}/server",
    '7' => "${jboss::real_jboss_dir}",
  }

  $real_config_dir = $jboss::config_dir ? {
    ''      => $jboss::install ? {
      package => $::operatingsystem ? {
        default => '/etc/jboss/',
      },
      default => $jboss::version ? {
        '4' => "${jboss::real_jboss_dir}/server/${jboss::real_mode}/conf",
        '5' => "${jboss::real_jboss_dir}/server/${jboss::real_mode}/conf",
        '6' => "${jboss::real_jboss_dir}/server/${jboss::real_mode}/conf",
        '7' => "${jboss::real_jboss_dir}/${jboss::real_mode}/configuration",
      },
    },
    default => $jboss::config_dir,
  }

  $real_data_dir = $jboss::data_dir ? {
    ''      => $jboss::install ? {
      package => $::operatingsystem ? {
        default => '/usr/share/jboss/',
      },
      default => $jboss::version ? {
        '4' => "${jboss::real_jboss_dir}/server/${jboss::real_mode}/webapps",
        '5' => "${jboss::real_jboss_dir}/server/${jboss::real_mode}/webapps",
        '6' => "${jboss::real_jboss_dir}/server/${jboss::real_mode}/webapps",
        '7' => "${jboss::real_jboss_dir}/${jboss::real_mode}/deployments",
      },
    },
    default => $jboss::data_dir,
  }


  ### Managed resources
  # Installation is managed in a dedicated class
  require jboss::install

  # Service is managed in a dedicated class
  if $disable != '' {
    require jboss::service
  }

  if ($jboss::source or $jboss::template) {
    file { 'jboss.conf':
      ensure  => $jboss::manage_file,
      path    => $jboss::real_config_file,
      mode    => $jboss::config_file_mode,
      owner   => $jboss::config_file_owner,
      group   => $jboss::config_file_group,
      require => Class['jboss::install'],
      notify  => $jboss::manage_service_autorestart,
      source  => $jboss::manage_file_source,
      content => $jboss::manage_file_content,
      replace => $jboss::manage_file_replace,
      audit   => $jboss::manage_audit,
    }
  }

  # The whole jboss configuration directory can be recursively overriden
  if $jboss::source_dir {
    file { 'jboss.dir':
      ensure  => directory,
      path    => $jboss::real_config_dir,
      require => Class['jboss::install'],
      notify  => $jboss::manage_service_autorestart,
      source  => $source_dir,
      recurse => true,
      purge   => $jboss::bool_source_dir_purge,
      replace => $jboss::manage_file_replace,
      audit   => $jboss::manage_audit,
    }
  }

  if $jboss::conf_script_template {
    file { 'jboss.script.conf':
      ensure  => $jboss::manage_file,
      path    => $jboss::real_conf_script_path,
      mode    => $jboss::config_file_mode,
      owner   => $jboss::config_file_owner,
      group   => $jboss::config_file_group,
      require => Class['jboss::install'],
      notify  => $jboss::manage_service_autorestart,
      content => template($jboss::conf_script_template),
      replace => $jboss::manage_file_replace,
      audit   => $jboss::manage_audit,
    }
  }

  ### Include custom class if $my_class is set
  if $jboss::my_class {
    include $jboss::my_class
  }

  ### Provide puppi data, if enabled ( puppi => true )
  if $jboss::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'jboss':
      ensure    => $jboss::manage_file,
      variables => $classvars,
      helper    => $jboss::puppi_helper,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $jboss::bool_debug == true {
    file { 'debug_jboss':
      ensure  => $jboss::manage_file,
      path    => "${settings::vardir}/debug-jboss",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
    }
  }

}
