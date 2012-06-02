# Class: jboss::user
#
# This class creates jboss user
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by jboss
#
class jboss::user inherits jboss {
  @user { $jboss::process_user :
    ensure     => $jboss::manage_file,
    comment    => "${jboss::process_user} user",
    password   => '!',
    managehome => false,
    uid        => $jboss::user_uid,
    gid        => $jboss::user_gid,
    home       => $jboss::real_jboss_dir,
    shell      => '/bin/bash',
    require    => Group['jboss'] ,
  }
  @group { $jboss::process_user :
    ensure     => $jboss::manage_file,
    gid        => $jboss::user_gid,
  }

  User <| title == $jboss::process_user |>
  Group <| title == $jboss::process_user |>

}
