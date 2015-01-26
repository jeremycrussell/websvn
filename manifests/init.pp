# == Class: websvn
#
# Full description of class websvn here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'websvn':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class websvn ( 
 $localrepo = undef,
 $remoterepo = undef
)  {

  apache::custom_config { 'websvn':
    content => "
Alias /websvn /usr/share/websvn/

<Directory /usr/share/websvn/>
  Options MultiViews
  DirectoryIndex wsvn.php
  Order Allow,Deny
  Allow from all
</Directory>",
  }

  package { 'websvn':
    ensure => 'latest'
  }

  file { '/etc/websvn/config.php':
    content => template("$module_name/config.php.erb"),
    ensure => present,
    mode => '0644',
    owner => 'root',
    group => 'root',
    require => Package['websvn']
  }

}
