make
docker stop ssdb
docker rm ssdb
docker image rm ssdb:1.8.2
docker build . -t ssdb:1.8.2
docker run -it -d -p 8884:8884 --name ssdb --network crm-network --network-alias alias-ssdb --link webchat ssdb:1.8.2
