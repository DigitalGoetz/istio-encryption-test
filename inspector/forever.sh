#!/bin/bash

echo "Loading Observation to DB"
curl -X 'POST' \
  'http://observations-retriever.traffic:4001/observations/' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "classification": "blue",
  "observed_object_id": 1,
  "observed_object_name": "something",
  "observer_id": 0,
  "observer_type": "string",
  "observer_name": "string",
  "data_source": "string",
  "observer_location_elevation": 0,
  "observer_location_latitude": 0,
  "observer_location_longitude": 0,
  "observation_time": "2022-11-10T20:37:23.720Z",
  "publication_time": "2022-11-10T20:37:23.720Z",
  "range_km": 0,
  "range_rate": 0,
  "los_azimuth": 0,
  "los_elevation": 0,
  "los_declination": 0,
  "los_ra": 0,
  "observed_magnitude": 0,
  "solar_angle": 0,
  "lunar_angle": 0
}'

echo "Observation loaded"
while [[ true ]]; do sleep 5; done