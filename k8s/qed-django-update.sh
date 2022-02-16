#!/bin/bash
echo "Starting QED django update"
echo "Updating qed-django"
#kubectl exec oms-shell -- bash -c "mkdir -p /tmp/git/qed_django/tmp"
#kubectl exec oms-shell -- bash -c "cd /tmp/git ; rm -rf qed_django; git clone -b dev --recurse-submodules https://github.com/quanted/qed_django.git ; cd qed_django ; git submodule foreach --recursive git checkout dev ; git submodule foreach --recursive git pull origin dev"
#kubectl exec oms-shell -- bash -c "rm -r /mnt/qed-django/* ; cp -rf /tmp/git/qed_django/. /mnt/qed-django/"
kubectl exec oms-shell -- bash -c "cd /mnt/qed-django ; git checkout dev ; git submodule foreach --recursive git checkout dev"
kubectl exec oms-shell -- bash -c "cd /mnt/qed-django ; git pull origin dev; git submodule foreach --recursive git pull origin dev"
kubectl scale deployment qed-django --replicas=0
kubectl scale deployment qed-django --replicas=1
echo "Completed qed-django update"
echo "Restarting dask"
kubectl scale deployment dask-worker --replicas=0
kubectl scale deployment dask-worker --replicas=1
echo "Completed dask restart"
echo "Completed QED django update"
