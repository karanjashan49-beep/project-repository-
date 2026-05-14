FROM amazonlinux:latest
RUN yum install httpd -y && yum clean all
RUN echo "Student finance Portal" >> /var/www/html/index.html
EXPOSE 87
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
