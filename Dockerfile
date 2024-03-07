# Use the official Nginx image as the base images
FROM nginx:latest

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy the custom configuration file from the current directory to the container
COPY nginx.conf /etc/nginx/conf.d/

# Expose port 80 to the Docker host, so we can access Nginx
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]

