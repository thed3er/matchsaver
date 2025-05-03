# Použití oficiálního JDK 21 base image
FROM amazoncorretto:21

WORKDIR /app

COPY /app/target/matchsaver-1.0.jar /app/matchsaver-1.0.jar


# Spuštění aplikace
ENTRYPOINT ["java", "-Dspring.profiles.active=dev", "-jar", "matchsaver-1.0.jar"]