#!/bin/bash

curl -H "x-classification: blue" observations-retriever:4001/observations/ | jq .