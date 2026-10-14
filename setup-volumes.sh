#!/bin/bash

echo "Setting up PVs and PVCs."
# envsubst < volumes-local.yml | kubectl apply -f -
envsubst < pvs-local.yml | kubectl apply -f -
sleep 3
envsubst < pvcs-local.yml | kubectl apply -f -
echo "Done."