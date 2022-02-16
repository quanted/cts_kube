#!/bin/bash
echo "Starting QED templates and static files update"
echo "Updating templates-qed"
#kubectl exec oms-shell -- bash -c "apt update && apt install git -y"
#kubectl exec oms-shell -- bash -c "mkdir -p /tmp/git/templates_qed/tmp" 
#kubectl exec oms-shell -- bash -c "cd /tmp/git/ ; rm -rf templates_qed"
#kubectl exec oms-shell -- bash -c "cd /tmp/git/ ; git clone -b dev https://github.com/quanted/templates_qed.git"
#kubectl exec oms-shell -- bash -c "rm -r /mnt/qed-templates/* ; cd /mnt/qed-templates ; cp -rf /tmp/git/templates_qed/* . "
kubectl exec oms-shell -- bash -c "cd /mnt/qed-templates ; git checkout dev"
kubectl exec oms-shell -- bash -c "cd /mnt/qed-templates ; git pull origin dev"
echo "Completed templates-qed update"
echo "Updating static-qed"
#kubectl exec oms-shell -- bash -c "mkdir -p /tmp/git/static_qed/tmp" 
#kubectl exec oms-shell -- bash -c "cd /tmp/git/ ; rm -rf static_qed"
#kubectl exec oms-shell -- bash -c "cd /tmp/git/ ; git clone -b dev https://github.com/quanted/static_qed.git"
#kubectl exec oms-shell -- bash -c "rm -r /mnt/qed-static/* ; cd /mnt/qed-static ; cp -rf /tmp/git/static_qed/* . 
kubectl exec oms-shell -- bash -c "cd /mnt/qed-static ; git checkout dev"
kubectl exec oms-shell -- bash -c "cd /mnt/qed-static ; git pull origin dev"
echo "Completed static-qed update"
#echo "Completed QED templates and static files update"
