FROM nginx:latest
RUN sed -i 's/nginx/malek/g' /usr/share/nginx/html/index.html
EXPOSE 8080

