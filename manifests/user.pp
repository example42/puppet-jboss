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
    managehome => true,
    shell      => '/bin/bash',
    before     => Group['jboss'] ,
  }
  @group { $jboss::process_user :
    ensure     => $jboss::manage_file,
  }

  User <| title == $jboss::process_user |>
  Group <| title == $jboss::process_user |>

}
