FROM tomcat:9-jre9
MAINTAINER "venugopaldr2019@gmail.com"
COPY ./zomato.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8081