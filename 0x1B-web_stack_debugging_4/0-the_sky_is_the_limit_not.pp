# Puppet Manifest to Increase Worker Connections in Nginx Configuration

exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/'
} ->

# Restart Nginx after configuration changes
exec { 'nginx-restart':
  command => 'nginx restart',
  path    => '/etc/init.d/'
}
