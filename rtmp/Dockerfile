FROM tiangolo/nginx-rtmp

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/

#Get SSL Certificates using Certbot
FROM certbot/certbot

# Replace 'example.com' with your domain(s)
RUN apt update
RUN apt-get install certbot -y
RUN apt-get install python3-certbot-nginx
RUN certbot --nginx --email alex.conover@salesforce.com -d conoverlabs.cloud

# Stage 3: Copy SSL Certificates to NGINX-RTMP container
FROM nginx-rtmp

COPY --from=1 /etc/letsencrypt/live/yourdomain.com/fullchain.pem /etc/nginx/certs/yourdomain.com.crt
COPY --from=1 /etc/letsencrypt/live/yourdomain.com/privkey.pem /etc/nginx/certs/yourdomain.com.key