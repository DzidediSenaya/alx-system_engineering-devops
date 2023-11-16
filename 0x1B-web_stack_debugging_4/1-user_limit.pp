# Puppet Manifest to Increase File Limits for holberton user

# Exec resource to set file limits for holberton user
exec { 'set-file-limits-for-holberton':
  command => 'echo "holberton soft nofile 4096" >> /etc/security/limits.conf && echo "holberton hard nofile 4096" >> /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/',
  onlyif  => 'test ! -e /etc/security/limits.d/20-nproc.conf', # Check if not already set
}

# Exec resource to apply the changes
exec { 'apply-file-limits':
  command => 'echo "ulimit -n 4096" >> /home/holberton/.bashrc',
  path    => '/usr/local/bin/:/bin/',
  onlyif  => 'grep "holberton" /etc/security/limits.conf', # Check if user limit is set
  require => Exec['set-file-limits-for-holberton'], # Ensure the limits are set before applying
}

# Exec resource to restart the session for changes to take effect
exec { 'restart-session':
  command     => 'su - holberton -c "source ~/.bashrc"',
  refreshonly => true,
  subscribe   => Exec['apply-file-limits'],
}
