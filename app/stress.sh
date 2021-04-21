#!/bin/bash

# Util para gerar randomicamente varias metricas
for i in {1..1000}; do
  curl localhost:3030
  sleep 0.8
done
