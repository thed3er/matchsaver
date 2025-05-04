# Použití oficiálního JDK 21 base image
FROM container-registry.oracle.com/graalvm/native-image:21 AS builder

WORKDIR /app

# Zkopírování pom.xml a zdrojových kódů do kontejneru
COPY . .

RUN ./mvnw clean package

FROM container-registry.oracle.com/graalvm/native-image:21 AS runner

WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

# Spuštění aplikace
ENTRYPOINT ["java", "-Dspring.profiles.active=prod", "-jar", "app.jar"]