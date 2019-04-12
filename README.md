# Monitoring

## Docker

build own docker container for test prometheus
```shell
sudo docker build . -t prometheus

sudo docker run -p 9090:9090 prometheus
```
