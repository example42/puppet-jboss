# Puppet module: jboss

This is a Puppet jboss module from the second generation of Example42 Puppet Modules.

Made by Alessandro Franceschi / Lab42

Official site: http://www.example42.com

Official git repository: http://github.com/example42/puppet-jboss

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module.

For detailed info about the logic and usage patterns of Example42 modules read README.usage on Example42 main modules set.

## USAGE - Basic management

* Install jboss using your distro package, if available

        class { 'jboss': }

* Install the latest jboss version from upstream site

        class { 'jboss':
          install             => 'source',
        }

* Install the latest jboss version from upstream site using puppi. 
  You will have a 'puppi deploy jboss' to deploy and update jboss.

        class { 'jboss':
          install             => 'puppi',
        }

* Install source from a custom url to a custom install_destination path.
  The following parameters apply both for "source" and "puppi" install methods.
  Puppi method may be used to manage deployment updates (given the $install_source is updated).
  By default install_source is set to upstream developer and install_destination to Web (App) server document root
  Pre and post installation commands may be already defined (check jboss/manifests/params.pp) override them only if needed.
  Url_check and url_pattern are used for application checks, if monitor is enabled. Override only if needed.

        class { 'jboss':
          install             => 'source',
          install_source      => 'http://deploy.example42.com/jboss/jboss.tar.gz',
        }

* Install Jboss 7 (by default Jboss 6 is installed)
  Versions 4, 5, 6, and 7 are supported for source or puppi installation
  (Note: Not all the combinations have been tested)

        class { 'jboss':
          install             => 'source',
          version             => '7',
        }

* Remove jboss

        class { 'jboss':
          absent => true
        }

* Enable auditing without without making changes on existing jboss configuration files

        class { 'jboss':
          audit_only => true
        }

* Manage different Jboss Instances

        class { 'jboss':
          disable  => '', # Jboss main service is not managed
        }

        jboss::instance { 'app1':
          createuser => false, # Default user jboss is already created by jboss class
          bindaddr    => '127.0.0.1',
          port        => '8080',
        }

        jboss::instance { 'app2':
          user     => 'app2',
          bindaddr => '127.0.0.1',
          port     => '8081', # You can't have, obviously, 2 instances binding to the same address and port
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file

        class { 'jboss':
          source => [ "puppet:///modules/lab42/jboss/wp-config.php-${hostname}" , "puppet:///modules/lab42/jboss/wp-config.php" ],
        }


* Use custom source directory for the whole configuration dir

        class { 'jboss':
          source_dir       => 'puppet:///modules/lab42/jboss/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file

        class { 'jboss':
          template => "example42/jboss/wp-config.php.erb",
        }

* Automaticallly include a custom subclass

        class { "jboss:"
          my_class => 'jboss::example42',
        }


## USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)
  Note that this option requires the usage of Example42 puppi module

        class { 'jboss': 
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with
  a puppi::helper define ) to customize the output of puppi commands 

        class { 'jboss':
          puppi        => true,
          puppi_helper => 'myhelper', 
        }

* Activate automatic monitoring (recommended, but disabled by default)
  This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'jboss':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'puppi' ],
        }


[![Build Status](https://travis-ci.org/example42/puppet-jboss.png?branch=master)](https://travis-ci.org/example42/puppet-jboss)
