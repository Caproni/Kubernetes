#!/bin/bash

# Check if the .env file path is provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path_to_env_file>"
    exit 1
fi

ENV_FILE_PATH=$1

# Check if the provided .env file exists
if [ ! -f "$ENV_FILE_PATH" ]; then
    echo "Error: File '$ENV_FILE_PATH' not found!"
    exit 1
fi

# Create the ConfigMap in the 'financial' namespace
kubectl create configmap financial-config \
    --from-env-file="$ENV_FILE_PATH" \
    --namespace=financial \
    --dry-run=client -o yaml | kubectl apply -f -

echo "ConfigMap 'financial-config' created successfully in the 'financial' namespace."
