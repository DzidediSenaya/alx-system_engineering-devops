# Puppet manifes to allow seamless login for holberton user and error-free file opening.

# Increase hard file limit for Holberton user.
exec { 'fix--for-nginx':
  command => 'sed -i "/holberton hard/s/5/50000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/'
}

# Increase soft file limit for Holberton user.
exec { 'nginx-restart':
  command => 'sed -i "/holberton soft/s/4/50000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/'
}
