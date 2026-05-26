FROM maven:3.9.6-eclipse-temurin-24 AS build

WORKDIR /app

COPY . .

RUN mvn clean package

FROM tomcat:9.0

COPY --from=build /app/target/LiveAuctionSystem.war /usr/local/tomcat/webapps/LiveAuctionSystem.war

EXPOSE 8080

CMD ["catalina.sh", "run"]