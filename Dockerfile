# Použití oficiálního JDK 21 base image
FROM amazoncorretto:21

# Nastavení pracovního adresáře
WORKDIR /app

# Kopírování JAR souboru aplikace
COPY target/matchsaver-1.0.jar .

# Exponování portu aplikace
EXPOSE 8080

# Spuštění aplikace
ENTRYPOINT ["java", "-Dspring.profiles.active=prod", "-jar", "matchsaver-1.0.jar"]