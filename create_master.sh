#!/bin/bash
aws ec2 run-instances \
    --image-id ami-0ebbf2179e615c338 \
    --instance-type t2.small \
    --key-name newfred \
    --security-group-ids fred-cluster-group

ip=`aws ec2 describe-instances --filter "Name=instance-state-name,Values=pending" --query "Reservations[*].Instances[*].[PublicIpAddress]" --output=text`
echo "Public IP address: $ip"
