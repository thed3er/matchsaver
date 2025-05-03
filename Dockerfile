# Použití oficiálního JDK 21 base image
FROM amazoncorretto:21

# Nastavení pracovního adresáře
WORKDIR /app

# Kopírování JAR souboru aplikace
COPY app.jar .

# Exponování portu aplikace
EXPOSE 8080

# Spuštění aplikace
ENTRYPOINT ["java", "-jar", "app.jar"]