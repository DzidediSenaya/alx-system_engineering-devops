# Puppet manifest to configure /etc/ssh/ssh_config to use a private key and disable password authentication

file_line { 'Use private key and disable password auth':
  path   => '/etc/ssh/ssh_config',
  line   => [
    'IdentityFile ~/.ssh/school',
    'PasswordAuthentication no',
  ],
  match  => [
    '^#?IdentityFile',
    '^#?PasswordAuthentication',
  ],
}
