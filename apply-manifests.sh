#!/bin/sh

export $(grep -v '^#' .env | xargs)  # sets env vars with .env

# Applys manifests with env vars:
envsubst < k8s/cts-configmap.yml | kubectl apply -f -
envsubst < k8s/cts-biotransformer-deployment.yml | kubectl apply -f -
envsubst < k8s/cts-biotransformer-service.yml | kubectl apply -f -
envsubst < k8s/cts-celery-deployment.yml | kubectl apply -f -
envsubst < k8s/cts-django-deployment.yml | kubectl apply -f -
envsubst < k8s/cts-django-service.yml | kubectl apply -f -
envsubst < k8s/cts-envipath-deployment.yml | kubectl apply -f -
envsubst < k8s/cts-envipath-service.yml | kubectl apply -f -
envsubst < k8s/cts-mongodb-service.yml | kubectl apply -f -
envsubst < k8s/cts-mongodb-statefulset.yml | kubectl apply -f -
envsubst < k8s/cts-nginx-deployment.yml | kubectl apply -f -
envsubst < k8s/cts-nginx-service.yml | kubectl apply -f -
envsubst < k8s/cts-nodejs-deployment.yml | kubectl apply -f -
envsubst < k8s/cts-nodejs-service.yml | kubectl apply -f -
envsubst < k8s/cts-operaws-deployment.yml | kubectl apply -f -
envsubst < k8s/cts-operaws-service.yml | kubectl apply -f -
envsubst < k8s/cts-redis-deployment.yml | kubectl apply -f -
envsubst < k8s/cts-redis-service.yml | kubectl apply -f -
envsubst < k8s/cts-tomcat-deployment.yml | kubectl apply -f -
envsubst < k8s/cts-tomcat-service.yml | kubectl apply -f -