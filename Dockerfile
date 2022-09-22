FROM openjdk:11.0.15-jre-slim
COPY FILENAME /usr/src/myapp/
WORKDIR /usr/src/myapp
EXPOSE PORTNUM
CMD ["java", "-jar", "FILENAME"]
