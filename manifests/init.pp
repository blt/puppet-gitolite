class gitolite($ensure=file, $gituser='git', $admin_key, $path="/var/lib/$gituser") {
  case $operatingsystem {
    'debian': {
      file { '/var/cache/debconf/gitolite.preseed':
        ensure => $ensure,
        content => template('gitolite/gitolite.preseed.erb'),
        before => Package['gitolite'],
      }
    }
    default: { fail "awfully sorry, but $operatingsystem is not yet supported" }
  }

  package { 'gitolite':
    ensure => present,
    responsefile => '/var/cache/debconf/gitolite.preseed',
  }
}
