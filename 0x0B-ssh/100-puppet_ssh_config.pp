# Puppet manifest to configure /etc/ssh/ssh_config to use a private key and disable password authentication

file_line { 'Turn off passwd auth':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  line   => '    PasswordAuthentication no',
  }
file_line { 'Declare identity file':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  line   => '    IdentityFile ~/.ssh/holberton',
  }
