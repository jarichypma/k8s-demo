FROM openjdk:18-jdk-buster as dev

# Create a non-root user
RUN addgroup -S spring && adduser -S spring -G spring
# Execute as non-root
USER spring:spring

WORKDIR /work

COPY mvnw /work/mvnw
COPY .mvn /work/.mvn
COPY pom.xml /work/pom.xml

RUN ./mvnw dependency:go-offline

# Build jar inside container
COPY . /work/
RUN ./mvnw install
RUN chmod +x /work/target/k8sdemo-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java","-jar","/work/target/k8sdemo-0.0.1-SNAPSHOT.jar"]