FROM ubuntu

COPY ssdb-server /usr/bin/
COPY ssdb.conf /etc

RUN mkdir -p /var/lib/ssdb && \
  sed \
    -e 's@home.*@home /var/lib@' \
    -e 's/loglevel.*/loglevel info/' \
    -e 's@work_dir = .*@work_dir = /var/lib/ssdb@' \
    -e 's@pidfile = .*@pidfile = /run/ssdb.pid@' \
    -e 's@level:.*@level: info@' \
    -e 's@ip:.*@ip: 0.0.0.0@' \
    -i /etc/ssdb.conf

ENV TZ Asia/Shanghai
EXPOSE 8884
VOLUME /var/lib/ssdb
ENTRYPOINT /usr/bin/ssdb-server /etc/ssdb.conf
