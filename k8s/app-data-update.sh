#!/bin/bash
echo "Starting QED app-data update/upload"
echo "Uploading ~/data-upload/app-data to oms-shell"
kubectl cp ~/data-upload/app-data pod/oms-shell:/tmp/upload
kubectl exec oms-shell -- bash -c "apt install unzip -y"
kubectl exec oms-shell -- bash -c "cp -R /tmp/upload/app-data /mnt/app-data"
kubectl exec oms-shell -- bash -c "cd /mnt/app-data/hms ; unzip App_data.zip"
echo "Uploading ~/data-upload/django-secrets to oms-shell"
kubectl cp ~/data-upload/django-secrets pod/oms-shell:/tmp/upload
kubectl exec oms-shell --bash -c "cp -R /tmp/upload/django-secrets /mnt/django-secrets"
echo "Uploading ~/data-upload/nginx-certs to oms-shell"
kubectl cp ~/data-upload/nginx-certs pod/oms-shell:/tmp/upload
kubectl exec oms-shell --bash -c "cp -R /tmp/upload/nginx-certs /mnt/nginx-certs"
echo "Uploads Complete"

