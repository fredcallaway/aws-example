#!/bin/bash
instances=`aws ec2 describe-instances --filters "Name=tag:cluster,Values=test_cluster" --query 'Reservations[*].Instances[*].[InstanceId]' --output text`
aws ec2 start-instances --instance-ids $instances

# Write ips.txt
aws ec2 describe-instances \
    --filters "Name=tag:cluster,Values=test_cluster" \
    --query 'Reservations[*].Instances[*].[PrivateIpAddress]' \
    --output text > ips.txt

# ssh into each instance to add it to recognized
while read p; do
    # this is actually slower for some reason...
    #   ssh-keygen -R $p
    #   ssh-keyscan $p >> ~/.ssh/known_hosts
    ssh -o "StrictHostKeyChecking=no" $p "pwd" > /dev/null &
done < ips.txt

