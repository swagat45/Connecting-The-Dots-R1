#!/usr/bin/env bash
set -e
docker build -t connectdots_r1 .
docker run -v $(pwd)/sample_docs:/in -v $(pwd)/out:/out connectdots_r1
echo "Round‑1 smoke OK"
