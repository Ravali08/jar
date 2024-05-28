FROM maven:3-amazoncorretto-17-debian as build

WORKDIR /app

COPY . .

RUN mvn clean package

FROM openjdk:23-slim-bullseye

WORKDIR /app

COPY --from=build /app/target/*.jar .

CMD ["java", "-jar",".jar"]
