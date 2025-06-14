FROM maven:3.8.4-openjdk-11-slim AS build
WORKDIR /app
COPY . /app
RUN mvn clean package -DskipTests

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/aeroapps-backend-jar-with-dependencies.jar /app/app.jar
EXPOSE 5000
CMD ["java", "-jar", "/app/app.jar"]
