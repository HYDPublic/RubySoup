$as_vagrant='sudo -u vagrant -H bash -l -c'
$home='/home/vagrant'

Exec {
  path => ['/usr/sbin', '/usr/bin', '/sbin', '/bin']
}

# --- Preinstall Stage ---------------------------------------------------------

stage { 'preinstall':
  before => Stage['main']
}

class apt_get_update {
  exec { 'apt-get -y update':
    unless => "test -e ${home}/.rvm"
  }
}
class { 'apt_get_update':
  stage => preinstall
}

# --- Packages -----------------------------------------------------------------

package { 'curl':
  ensure => installed
}

package { 'git-core':
  ensure => installed
}

  # ---
  # STN 2014Apr01 remove that from the brown bag
  # ---
  # STN ExecJS runtime.
  # STN package { 'nodejs':
  # STN   ensure => installed
  # STN }

# --- Ruby ---------------------------------------------------------------------

#  command => "${as_vagrant} 'curl -L https://get.rvm.io | bash -s stable'",
exec { 'install_rvm':
  command => "${as_vagrant} 'curl -L https://get.rvm.io | bash -s stable --autolibs=enabled --ruby'",
  creates => "${home}/.rvm/bin/rvm",
  require => Package['curl']
}

exec { "${as_vagrant} 'gem install pry'":
  #creates => "${home}/.rvm/bin/pry",
  require => Exec['install_rvm']
}

exec { "${as_vagrant} 'gem install pry-doc'":
  #creates => "${home}/.rvm/bin/pry-doc",
  require => Exec['install_rvm']
}

exec { 'install-gem-ssh':
  command => "${as_vagrant} 'gem install net-ssh'",
  require => Exec['install_rvm']
}

exec { "${as_vagrant} 'gem install net-scp'":
  require => Exec['install-gem-ssh']
}
