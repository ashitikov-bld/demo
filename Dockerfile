FROM amazoncorretto:11.0.8-alpine

EXPOSE 8080

COPY build/libs/demo-0.0.1-SNAPSHOT.jar /opt/demo.jar

ENTRYPOINT ["sh", "-c", "java -jar tilaka.jar"]
