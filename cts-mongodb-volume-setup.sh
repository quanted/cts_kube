#!/bin/bash
echo "Starting CTS MongoDB volume setup"

kubectl exec cts-mongodb-0 -- /bin/bash -c "mkdir /tmp/cts"

echo "Updating files from s3 bucket"
kubectl exec cts-mongodb-0 -- /bin/bash -c "aws s3 cp s3://qed-stg/cts /tmp/cts --recursive"
kubectl exec cts-mongodb-0 -- /bin/bash -c "ls /tmp/cts"
kubectl exec cts-mongodb-0 -- /bin/bash -c "unzip /tmp/cts/cts_mongodb.zip -d /mnt/cts_mongodb"
kubectl exec cts-mongodb-0 -- /bin/bash -c "rm -rf /cts/hms/"
kubectl exec cts-mongodb-0 -- /bin/bash -c "mongorestore -d cts /mnt/cts_mongodb"
kubectl exec cts-mongodb-0 -- /bin/bash -c "rm -rf /mnt/cts_mongodb"

echo "Completed updates from s3 bucket"
