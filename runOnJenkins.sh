make
docker stop ssdb
docker rm ssdb
docker image rm ssdb:1.8.2
docker build . -t ssdb:1.8.2

