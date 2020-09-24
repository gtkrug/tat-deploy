FROM tomcat:8.5.13-jre8
COPY wait-for-it.sh wait-for-it.sh
ADD https://trustmarkinitiative.org/software/tat-1.0.rc1.war /tmp/tat.war
RUN unzip -d /usr/local/tomcat/webapps/tat /tmp/tat.war
COPY tat_config.properties /usr/local/tomcat/webapps/tat/WEB-INF/classes
COPY ./images/banner.png /usr/local/tomcat/webapps/tat/assets/tmi-header-56eb1cb69ffde28907e0a78527bbd88d.png
COPY ./images/favicon.ico /usr/local/tomcat/webapps/ROOT/
COPY ./images/favicon.ico /usr/local/tomcat/webapps/tat/
ENV JAVA_OPTS="-XX:+UseParallelGC"
CMD ["catalina.sh", "run"]

