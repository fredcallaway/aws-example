#!/bin/bash
aws ec2 describe-instances \
    --filter "Name=tag:cluster,Values=test_cluster" \
    --query 'Reservations[*].Instances[*].[InstanceId,PrivateIpAddress,State.Name]' \
    --output text