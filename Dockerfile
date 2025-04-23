# Use the official Nginx image from Docker Hub
FROM nginx:alpine

# Copy the HTML file to the default Nginx directory
COPY index.html /usr/share/nginx/html/index.html

# Optionally, copy other assets (e.g., CSS, JS files)
# COPY assets/ /usr/share/nginx/html/assets/

# Expose port 80 for the web server
EXPOSE 80

# Start Nginx in the foreground (default behavior)
CMD ["nginx", "-g", "daemon off;"]
