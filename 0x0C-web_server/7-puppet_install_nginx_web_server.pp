# Install Nginx package
package { 'nginx':
  ensure => 'installed',
}

# Create a custom HTML file with "Hello World!"
file { '/var/www/html/index.html':
  content => 'Hello World!',
  mode    => '0644',
  require => Package['nginx'],
}

# Configure the default Nginx site
file { '/etc/nginx/sites-available/default':
  content => template('nginx/default.erb'),
  require => Package['nginx'],
}

# Enable the default Nginx site by creating a symbolic link
file { '/etc/nginx/sites-enabled/default':
  ensure  => 'link',
  target  => '/etc/nginx/sites-available/default',
  require => File['/etc/nginx/sites-available/default'],
}

# Define an Nginx location block for /redirect_me
nginx::resource::location { '/redirect_me':
  ensure      => present,
  location    => '~ ^/redirect_me',
  rewrite     => '^/redirect_me(.*)$ https://www.example.com permanent',
  vhost       => 'default',
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure => 'running',
  enable => true,
  require => [
    File['/etc/nginx/sites-available/default'],
    Nginx::Resource::Location['/redirect_me'],
  ],
}
