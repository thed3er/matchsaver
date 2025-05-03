# Použití oficiálního JDK 21 base image
FROM amazoncorretto:21

WORKDIR /usr/app

COPY ./target/matchsaver-1.0.jar ./matchsaver-1.0.jar

EXPOSE 8080

# Spuštění aplikace
ENTRYPOINT ["java", "-Dspring.profiles.active=prod", "-jar", "matchsaver-1.0.jar"]