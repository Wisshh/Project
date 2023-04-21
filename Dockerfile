FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page290/maria-ferrero.zip /var/www/html
WORKDIR /var/www/html
RUN unzip maria-ferrero.zip
RUN rm -rf maria-ferrero.zip &&\
 cp -rf One-Page-Portfolio-Template-master/* . &&\
 rm -rf One-Page-Portfolio-Template-master 
EXPOSE 80
CMD ["usr/sbin/httpd", "-D", "FOREGROUND"]
