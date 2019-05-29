#!/bin/bash
count=2

aws ec2 run-instances \
    --image-id ami-0ebbf2179e615c338 \
    --count $count \
    --instance-type t2.micro \
    --key-name newfred \
    --security-group-ids fred-cluster-group \
    --tag-specifications "ResourceType=instance,Tags=[{Key=cluster,Value=test_cluster}]"

aws ec2 describe-instances --filter "Name=tag:cluster,Values=test_cluster" --query "Reservations[*].Instances[*].[PublicIpAddress]" --output=text > ips.txt
aws ec2 describe-instances --filters "Name=tag:cluster,Values=test_cluster" --query 'Reservations[*].Instances[*].[InstanceId]' --output text > instances.txt

while read p; do
    scp -o "StrictHostKeyChecking=no" ~/julia-1.1.1-linux-x86_64.tar.gz ${p}:~/
    # scp setup.sh ec2-user@${p}:~/setup.sh
    ssh ec2-user@${p} "bash -s" < ./install_julia.sh &
done < instances.txt

