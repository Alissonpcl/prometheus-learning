# Prometheus Learning

## Running Prometheus
Use the utility shell [```run_prometheus.sh```](run_prometheus.sh) to run Prometheus in a Docker container .

## Running Grafana
Use the utility shell [```run_grafana.sh```](run_grafana.sh) to run Grafana in a Docker container .

## Running with Docker Compose
In the [docker](docker) folder there is a docker-compose.yml with the required configuration to run Prometheus and Grafana using Docker Compose.

Is important to note that it created external volumes to make data persistent.

## Example application

The directory [**app**](app) contains a simple Node application used to delivery metrics to Prometheus.

## Node Exporter

Node Exporter exports metrics from the Operational System. To run it use the commando below:

```./node-exporter/node_exporter.sh```

It is important to note that on MacOS it can ask for permission since it is not developed by Apple neither downloaded from Apple Store.

## PromQL

Examples of how to create queries can be found in https://prometheus.io/docs/prometheus/latest/querying/basics/.

Instant Vector
#api_requests_total[1m](@31/12/2019 23:58:00)
Shows all samples matching the name api_requests_total tracked in the exact time 23:58:00.

Range Vector
#api_requests_total[1m](@31/12/2019 23:58:00)
Shows all samples matching the name api_requests_total tracked in the range of 1 minute ending in 23:58:00.

#api_requests_total[4m:1m](@31/12/2019 23:58:00)
The same as above but will show all samples in the 4 minutes before 23:58 grouping in an interval of 1 minute.

Filtering by label

All labels  
```api_request_total```

Code equals 200  
```api_request_total{code = "200"}```

Code not equals 200  
```api_request_total{code != "200"}```

Regular Expression  
```api_request_total{method =~ "GET|POST"}```

Combined  
```api_request_total{method =~ "GET|POST", code = "200"}```

Filtering counters

Returns the average by second in a range of 10 minutes  
```rate(go_memstats_frees_total[10m])```

Returns how much the metric increased by minute  
```increase(go_memstats_frees_total[1m])```

Aggregators
Sums the samples grouping by status code  
```sum(app_request_total) by (statusCode)```