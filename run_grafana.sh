
docker container stop grafana || true
docker run -d --name=grafana -p 3000:3000 grafana/grafana