FROM tiangolo/nginx-rtmp

# Install Certbot and other required packages
RUN apt-get update && apt-get install -y certbot python3-certbot-nginx

# Set environment variables
ENV EMAIL=alex.conover@outlook.com
ENV DOMAIN=conoverlabs.cloud

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Run Certbot command on container startup
CMD certbot certonly --standalone --email $EMAIL --agree-tos --no-eff-email -d $DOMAIN && nginx -g "daemon off;"
