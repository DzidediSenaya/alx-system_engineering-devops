#!/usr/bin/env bash
# This script configures Nginx to include a custom HTTP response header
# named X-Served-By with the value being the hostname of the server.

# Check if the script is being run with superuser privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or using sudo."
    exit 1
fi

# Install Nginx if not already installed
if ! command -v nginx &>/dev/null; then
    apt-get update
    apt-get install -y nginx
fi

# Create a custom Nginx configuration file
echo "Adding custom Nginx configuration..."
cat <<EOF > /etc/nginx/conf.d/custom_response_header.conf
server {
    listen 80;
    server_name _;

    location / {
        add_header X-Served-By \$(hostname);
        # Other Nginx configuration directives can go here
    }
}
EOF

# Test Nginx configuration and reload if successful
if nginx -t; then
    systemctl reload nginx
    echo "Nginx configuration reloaded."
else
    echo "Nginx configuration test failed. Please check your configuration."
fi
