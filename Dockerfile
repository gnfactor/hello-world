#FROM tomcat:9.0.97-jre17
FROM tomcat:9.0.48-jdk11-openjdk-slim
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
COPY ./*.war /usr/local/tomcat/webapps


# build image
# docker build -t demotomcat:v1 .

# run container
# docker run -d -p 8085:8080 --name demotomcat-v1 demotomcat:v1

