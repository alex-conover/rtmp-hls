FROM tiangolo/nginx-rtmp

# Install Certbot and other required packages
RUN apt update && apt-get install certbot -y python3-certbot-nginx

# Copy Nginx configuration
# COPY nginx.conf /etc/nginx/nginx.conf

# Run Certbot command on container startup
CMD certbot --nginx --email alex.conover@outlook.com --agree-tos --no-eff-email -d conoverlabs.cloud && nginx -g "daemon off;"
