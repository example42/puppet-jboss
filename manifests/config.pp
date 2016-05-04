class jboss::config {
  include ::jboss


  if ($::jboss::source or $::jboss::template) {
    file { 'jboss.conf':
      ensure  => $::jboss::manage_file,
      path    => $::jboss::real_config_file,
      mode    => $::jboss::config_file_mode,
      owner   => $::jboss::config_file_owner,
      group   => $::jboss::config_file_group,
      source  => $::jboss::manage_file_source,
      content => $::jboss::manage_file_content,
      replace => $::jboss::manage_file_replace,
      audit   => $::jboss::manage_audit,
    }
  }

  # The whole jboss configuration directory can be recursively overriden
  if $::jboss::source_dir and $::jboss::source_dir != '' {
    file { 'jboss.dir':
      ensure  => directory,
      path    => $::jboss::real_config_dir,
      source  => $::jboss::source_dir,
      recurse => true,
      purge   => $::jboss::bool_source_dir_purge,
      replace => $::jboss::manage_file_replace,
      audit   => $::jboss::manage_audit,
    }
  }
  if ! $::jboss::conf_script_template == '' {
    file { 'jboss.script.conf':
      ensure  => $::jboss::manage_file,
      path    => $::jboss::real_conf_script_path,
      mode    => $::jboss::config_file_mode,
      owner   => $::jboss::config_file_owner,
      group   => $::jboss::config_file_group,
      content => template($::jboss::conf_script_template),
      replace => $::jboss::manage_file_replace,
      audit   => $::jboss::manage_audit,
    }
  }

}
