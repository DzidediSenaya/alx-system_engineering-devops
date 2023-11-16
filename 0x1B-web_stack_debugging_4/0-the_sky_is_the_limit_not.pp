# Puppet Manifest to Increase Worker Connections in Nginx Configuration

# Increase worker connections in Nginx configuration
exec { 'fix-for-nginx':
  command => 'sed -i "s/15/4096/" /etc/nginx/nginx.conf',
  path    => '/usr/local/bin/:/bin/',
  notify  => Exec['nginx-restart'],
}

# Restart Nginx after configuration changes
exec { 'nginx-restart':
  command => 'service nginx restart',
  path    => '/etc/init.d/',
  refreshonly => true,
}
