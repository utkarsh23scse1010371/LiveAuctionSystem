FROM tomcat:9.0

COPY target/LiveAuctionSystem.war /usr/local/tomcat/webapps/LiveAuctionSystem.war

EXPOSE 8080

CMD ["catalina.sh", "run"]