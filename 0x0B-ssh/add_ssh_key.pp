# Puppet manifest to add SSH public key to the ubuntu user's authorized keys

file { '/home/ubuntu/.ssh':
  ensure  => 'directory',
  owner   => 'ubuntu',
  group   => 'ubuntu',
  mode    => '0700',
  require => File['/home/ubuntu'],
}

file { '/home/ubuntu/.ssh/authorized_keys':
  ensure  => 'file',
  owner   => 'ubuntu',
  group   => 'ubuntu',
  mode    => '0600',
  content => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNdtrNGtTXe5Tp1EJQop8mOSAuRGLjJ6DW4PqX4wId/Kawz35ESampIqHSOTJmbQ8UlxdJuk0gAXKk3Ncle4safGYyM/VeDK3LN5iAJxf4kcaxNtS3eVxWBE5iF3FbIjOqwxw5Lf5sRa5yXxA8HfWidhbIG5TqKL922hPgsCGABIrXRlfZYeC0FEuPWdr6smOElSVvIXthRWp9cr685KdCI+COxlj1RdVsvIo+zunmLACF9PYdjB2s96Fn0ocD3c5SGLvDOFCyvDojSAOyE70ebIElnskKsDTGwfT4P6jh9OBzTyQEIS2jOaE5RQq4IB4DsMhvbjDSQrP0MdCLgwkN',
  require => File['/home/ubuntu/.ssh'],
}

