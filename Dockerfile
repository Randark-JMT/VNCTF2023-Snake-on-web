FROM ubuntu:20.04

LABEL auther="Randark_JMT"

RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/mirrors.ustc.edu.cn/g" /etc/apt/sources.list && \
    sed -i "s/http:\/\/security.ubuntu.com/http:\/\/mirrors.ustc.edu.cn/g" /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y clang lld gcc python3

COPY ./src/static/ /app
COPY ./src/bin /app/bin

COPY ./service/docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh 

EXPOSE 8080
ENTRYPOINT [ "/bin/sh","/docker-entrypoint.sh" ]