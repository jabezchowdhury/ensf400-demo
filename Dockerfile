# Use official Tomcat image
FROM tomcat:9.0

# Set working directory
WORKDIR /usr/local/tomcat/webapps/

# Copy WAR file into Tomcat webapps directory
COPY build/libs/ensf400-demo-1.0.0.war demo.war

# Expose default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
