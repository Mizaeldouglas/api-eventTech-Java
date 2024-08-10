FROM ubuntu:latest AS builder

RUN apt-get update
RUN apt-get install openjdk-21-jdk -y
COPY . .

RUN apt-get install maven -y
RUN mvn clean install

FROM openjdk:21-jre-slim

EXPOSE 8080

COPY --from=builder /target/*.jar /app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]

