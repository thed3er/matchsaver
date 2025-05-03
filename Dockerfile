# Použití oficiálního JDK 21 base image
FROM amazoncorretto:21

EXPOSE 8080

COPY ./build/libs/matchsaver-1.0.jar /usr/app/

WORKDIR /usr/app

# Spuštění aplikace
ENTRYPOINT ["java", "-Dspring.profiles.active=prod", "-jar", "matchsaver-1.0.jar"]