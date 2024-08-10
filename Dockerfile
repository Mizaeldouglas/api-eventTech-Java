# Etapa de construção
FROM ubuntu:latest AS builder

RUN apt-get update && \
    apt-get install -y wget unzip

# Baixe e instale o OpenJDK 21
RUN wget https://download.oracle.com/java/21/latest/jdk-21_linux-aarch64_bin.tar.gz && \
    tar xvf jdk-21_linux-aarch64_bin.tar.gz && \
    mv jdk-21 /usr/lib/jvm

ENV JAVA_HOME=/usr/lib/jvm/jdk-21
ENV PATH=$JAVA_HOME/bin:$PATH

COPY . .

RUN apt-get install maven -y
RUN mvn clean install

# Etapa de execução
FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y wget unzip

# Baixe e instale o OpenJDK 21
RUN wget https://download.oracle.com/java/21/latest/jdk-21_linux-aarch64_bin.tar.gz && \
    tar xvf jdk-21_linux-aarch64_bin.tar.gz && \
    mv jdk-21 /usr/lib/jvm

ENV JAVA_HOME=/usr/lib/jvm/jdk-21
ENV PATH=$JAVA_HOME/bin:$PATH

EXPOSE 8080

COPY --from=builder /target/*.jar /app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]
