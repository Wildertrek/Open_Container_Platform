#!/bin/bash

set -e #this means to fail out of script if any command fails
SECONDS=0

echo "checking crc version"
crc version

echo "checking crc status"
crc status

echo "install OpenDataHub Operator"
oc create -f operator-subscriptions/odh_subscription.yaml

sleep 10

echo "create aiops namespace/project"
oc create -f namespaces/aiops_namespace.yaml

sleep 10

echo "create odh kfdef instance"
oc create -f odh/kfdef.yaml




