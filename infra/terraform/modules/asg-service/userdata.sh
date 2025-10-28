#!/bin/bash
set -euxo pipefail

# Install nginx (works on AL2023/Amazon Linux/Ubuntu)
if command -v dnf >/dev/null 2>&1; then
  dnf -y update
  dnf -y install nginx
elif command -v yum >/dev/null 2>&1; then
  yum -y update
  yum -y install nginx
else
  apt-get update -y
  apt-get install -y nginx
fi

# Simple pages
echo "OK" > /usr/share/nginx/html/index.html
echo "OK" > /usr/share/nginx/html/health

# Start & enable service
systemctl enable nginx
systemctl restart nginx
