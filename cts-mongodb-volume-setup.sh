#!/bin/bash
echo "Starting CTS MongoDB volume setup"

kubectl exec deploy/oms-shell -- /bin/bash -c "mkdir /tmp/cts"

echo "Updating files from s3 bucket"
kubectl exec deploy/oms-shell -- /bin/bash -c "aws s3 cp s3://qed-stg/cts /tmp/cts --recursive"
kubectl exec deploy/oms-shell -- /bin/bash -c "ls /tmp/cts"
kubectl exec deploy/oms-shell -- /bin/bash -c "unzip /tmp/cts/cts_mongodb.zip -d /mnt/cts_mongodb"
kubectl exec deploy/oms-shell -- /bin/bash -c "rm -rf /cts/hms/"

echo "Completed updates from s3 bucket"
