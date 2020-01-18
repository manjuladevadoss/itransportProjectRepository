FROM openjdk:8-jdk-alpine
ADD bis-services-0.0.1-SNAPSHOT.war bis-services-0.0.1-SNAPSHOT.war
ADD bis.itpt.its.com-chain.cert.pem bis.itpt.its.com-chain.cert.pem
RUN keytool -import -trustcacerts -file bis.itpt.its.com-chain.cert.pem -alias bis.itpt.its.com -keystore "/usr/lib/jvm/java-1.8-openjdk/jre/lib/security/cacerts" -storepass changeit -noprompt
CMD ["java", "-jar", "bis-services-0.0.1-SNAPSHOT.war"]