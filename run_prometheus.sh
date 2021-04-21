
docker container stop prometheus || true
docker run --name prometheus -d -v ${PWD}/prometheus.yml:/etc/prometheus/prometheus.yml -p 9090:9090 prom/prometheus