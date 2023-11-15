# Puppet Manifest to Increase Worker Connections in Nginx Configuration

# Define a Puppet class to encapsulate the configuration changes
class nginx_worker_connections {
  
  # Exec resource to replace the value '15' with '4096' in the nginx default configuration
  exec { 'fix--for-nginx':
    command => 'sed -i "s/15/4096/" /etc/default/nginx',
    path    => '/usr/local/bin/:/bin/',
    # Notify the 'nginx-restart' exec resource to run if changes are made by this exec
    notify  => Exec['nginx-restart'],
  }

  # Exec resource to restart Nginx after configuration changes
  exec { 'nginx-restart':
    command => 'service nginx restart',
    path    => '/etc/init.d/',
    # Only run if notified by the 'fix--for-nginx' exec resource
    refreshonly => true,
  }
}

# Apply the class to the node
include nginx_worker_connections

