FROM ubuntu:22.04
RUN apt-get update -y 
RUN apt-get install -y nginx zip curl
RUN echo "daemon off;" >>/etc/nginx/nginx.config
RUN curl -o /var/www/html/master.zip -L https://codeload.github.com/gabrielecirulli/2048/zip/master
RUN cd /var/www/html/ && unzip master.zip && mv 2048-master/* . && rm -rf 2048-master msater.zip 
EXPOSE 80
CMD ["/usr/sbin/nginx", "-c" "/etc/nginx/nginx.conf"]
