FROM nginx:alpine

# Remove default Nginx site
RUN rm /etc/nginx/conf.d/default.conf

# Copy our Nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy all project files into Nginx html directory
COPY . /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
