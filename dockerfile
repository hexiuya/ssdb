FROM python:2.7

RUN mkdir /var/lib/ssdb
COPY ssdb-server ./
COPY ssdb.conf ./

ENV TZ Asia/Shanghai
EXPOSE 8884
VOLUME /var/lib/ssdb
ENTRYPOINT ["./ssdb-server", "ssdb.conf"]
