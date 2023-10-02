#!/usr/bin/env bash
# Puppet manifest to configure a custom HTTP response header for Nginx

# Define a custom fact to retrieve the server's hostname
Facter.add(:custom_hostname) do
  setcode 'hostname -f'
end

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Create a custom Nginx configuration file
file { '/etc/nginx/conf.d/custom_response_header.conf':
  ensure  => present,
  content => "server {
    listen 80;
    server_name _;

    location / {
        add_header X-Served-By $::custom_hostname;
        # Other Nginx configuration directives can go here
    }
}\n",
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Ensure Nginx service is running
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}
