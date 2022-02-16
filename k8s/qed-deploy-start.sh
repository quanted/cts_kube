#!/bin/bash
# QED Deployment/StatefulSet Start Script

# OMS shell
kubectl create -f oms-shell-deployment.yml

# Databases
kubectl create -f redis-deployment.yml
kubectl create -f mongodb-statefulset.yml
kubectl create -f postgres-statefulset.yml

# CTS
kubectl create -f cts-worker-deployment.yml
kubectl create -f cts-manager-deployment.yml
kubectl create -f cts-nodejs-deployment.yml

# FLASK/CELERY
kubectl create -f qed-celery-deployment-aws.yml
# kubectl create -f celery-flower-deployment.yml
kubectl create -f qed-flask-deployment-aws.yml

# HMS
kubectl create -f hms-dotnetcore-deployment-aws.yml

# Django
kubectl create -f qed-django-deployment-aws.yml

# Nginx
kubectl create -f qed-nginx-deployment-aws.yml

# Tomcat
kubectl create -f qed-tomcat-deployment-aws.yml

# Dask
kubectl create -f dask-scheduler-deployment.yml
kubectl create -f dask-worker-deployment-aws.yml
