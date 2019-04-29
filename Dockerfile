FROM nimmis/apache 
MAINTAINER sany <sany@w3engineers.com>

RUN apt-get update && apt-get -y install php php-curl php-redis php-gd php-mcrypt php-mysqlnd php-pgsql libapache2-mod-php php-bcmath php-xml && apt-get clean
RUN a2enmod rewrite && a2enmod expires && phpenmod mcrypt
COPY apache2.conf /etc/apache2/apache2.conf	
EXPOSE 80 
EXPOSE  443
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"] 
