FROM bitnami/tomcat:latest

COPY target/my-app-1.0-SNAPSHOT.jar /bitnami/tomcat/data/
