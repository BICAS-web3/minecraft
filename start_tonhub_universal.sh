#!/bin/bash

npm install

# Parsing named arguments
while [[ $# -gt 0 ]]; do
  case $1 in
      --gpu)
      gpu="$2"
      shift # past argument
      shift # past value
      ;;
    *)    # unknown option
      shift # past argument
      ;;
  esac
done

while true; do
  node send_universal.js --api tonhub --bin ./pow-miner-cuda --givers 1000 --gpu $gpu --timeout 5
  sleep 1;
done;
