FROM openjdk:11.0.15-jre-slim

ENV OTEL_METRICS_EXPORTER prometheus
COPY FILENAME /usr/src/myapp/
RUN apt-get update && apt install -y curl
RUN curl -Lo /usr/src/myapp/opentelemetry-javaagent.jar https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v1.18.0/opentelemetry-javaagent.jar
WORKDIR /usr/src/myapp
EXPOSE PORTNUM
EXPOSE 9464
CMD ["java", "-javaagent:./opentelemetry-javaagent.jar", "-jar", "FILENAME"]