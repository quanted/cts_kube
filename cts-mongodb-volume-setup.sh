#!/bin/bash
echo "Starting CTS MongoDB volume setup"

kubectl exec deploy/oms-shell -- /bin/bash -c "mkdir /tmp/cts"

echo "Updating files from s3 bucket"
kubectl exec deploy/oms-shell -- /bin/bash -c "aws s3 cp s3://qed-stg/cts /tmp/cts --recursive"
kubectl exec deploy/oms-shell -- /bin/bash -c "ls /tmp/cts"
kubectl exec deploy/oms-shell -- /bin/bash -c "unzip /tmp/cts/cts_mongodb.zip -d /mnt/cts-mongodb"
kubectl exec deploy/oms-shell -- /bin/bash -c "rm -rf /tmp/cts/"
echo "Listing /mnt"
kubectl exec cts-mongodb-0 -- /bin/bash -c "ls /mnt"
echo "Listing /data/db/cts"
kubectl exec cts-mongodb-0 -- /bin/bash -c "ls /data/db/cts"
kubectl exec cts-mongodb-0 -- /bin/bash -c "mongorestore -d cts /data/db/cts/cts-mongodb"
kubectl exec cts-mongodb-0 -- /bin/bash -c "rm -rf /data/db/cts/cts-mongodb"

echo "Completed updates from s3 bucket"
