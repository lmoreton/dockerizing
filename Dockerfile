### Official Ubuntu 14.04 as our base image:
### 
FROM ubuntu:14.04
#################
### Base image maintainer:
### 
MAINTAINER Lucas Moreton <lucaslmoreton@gmail.com>
##########
### Ports to be exposed:
### 
EXPOSE 22
EXPOSE 80
EXPOSE 443
EXPOSE 8080
###########
### Configuration steps to be run:
### 
RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty-backports main restricted" >> /etc/apt/sources.list
RUN echo "deb-src http://archive.ubuntu.com/ubuntu/ trusty-backports main restricted" >> /etc/apt/sources.list
RUN apt-get update
### ### 
        RUN apt-get install -y default-jdk
        RUN apt-get install -y man wget tomcat7
        RUN wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war; chmod 777 ./jenkins.war
        RUN mv ./jenkins.war /var/lib/tomcat7/webapps/jenkins.war
        RUN chown -R tomcat7:tomcat7 /var/lib/tomcat7/
        RUN chown -R tomcat7:tomcat7 /etc/tomcat7/
        RUN chown -R tomcat7:tomcat7 /usr/share/tomcat7/
###########
ADD https://raw.githubusercontent.com/lmoreton/dockerizing/master/run.sh /root/run.sh
RUN chmod +x /root/run.sh
CMD ["/root/run.sh"]
###########
### Environment variables should be defined here:
### 
### 
###########
