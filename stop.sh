#!/bin/bash
instances=`aws ec2 describe-instances --filters "Name=tag:cluster,Values=test_cluster" --query 'Reservations[*].Instances[*].[InstanceId]' --output text`
aws ec2 stop-instances --instance-ids $instances