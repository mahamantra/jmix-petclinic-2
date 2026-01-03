FROM gradle:jdk21 as build
WORKDIR /app
COPY . /app
RUN gradle build --no-daemon

FROM eclipse-temurin:21-jre-alpine
COPY build/libs/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app.jar"]