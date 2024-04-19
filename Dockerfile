# Use the official Nginx image as base
FROM nginx

# Copy the default Nginx configuration
COPY default.conf /etc/nginx/conf.d/default.conf

# Install supervisord
RUN apt-get update && apt-get install -y supervisor

# Copy supervisord configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose ports
EXPOSE 80

# Start supervisord when the container starts
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

