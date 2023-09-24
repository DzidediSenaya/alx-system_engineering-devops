# 100-puppet_ssh_config.pp

# Ensure the SSH client configuration directory exists
file { '/home/your_username/.ssh':
  ensure  => 'directory',
  owner   => 'your_username',
  group   => 'your_username',
  mode    => '0700',
  require => User['your_username'],
}

# Configure the SSH client to use the private key and refuse password authentication
file_line { 'Configure SSH client':
  path    => '/home/your_username/.ssh/config',
  line    => [
    'Host your_server_hostname_or_IP',
    '  IdentityFile ~/.ssh/school',
    '  PasswordAuthentication no',
  ],
  ensure  => present,
  match   => '^Host your_server_hostname_or_IP',
  require => File['/home/your_username/.ssh'],
}
