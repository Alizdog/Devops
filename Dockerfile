FROM centos:latest

RUN yum update; yum clean all
RUN yum -y install httpd php-gd
WORKDIR /var/www/html
RUN curl -O http://wordpress.org/latest.zip && \
    tar xzf latest.tar.gz; rm -rf latest.tar.gz && \
    mv wordpress/ ./; rmdir wordpress
WORKDIR /var/www/html/wp-content/uploads
RUN chown -R apache:apache /var/www/html/* && \
    cp wp-config-sample.php wp-config.php && \
    
EXPOSE 80
