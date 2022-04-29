FROM maven:3-openjdk-8 AS test
WORKDIR /test
COPY . .
RUN mvn clean package


FROM tomcat:7.0.94 
COPY --from=test /test/target/*.war /usr/local/tomcat/webapps
