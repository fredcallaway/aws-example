# README

## Prerequisites
I assume you have a security group named fred-cluster-group and an AWS key pair named newfred. You will probably have different names for these. Simply replace all occurrences of those strings in this directory with your group and key name.

## Create master node.
1. Run `./create_master.sh`- download julia
2. Add an entry for the master node in your ~/.ssh/config file. It should look something like this, but with the HostName set to the public IP address printed by create_master.sh and the IdentifyFile to your AWS key file.
```
Host master
HostName 13.59.14.1
User ec2-user
IdentityFile ~/aws-example/newfred.pem
```
3. Copy this directory to the master node: `rsync -av ./ master:~/` (replace the IP address with the one that is printed by create_master.sh)
4. Copy your AWS credentials and configuration to the master node: `rsync -av ~/.aws/ master:~/.aws/`
5. SSH into the master node e.g. `ssh -i newfred.pem ec2-user@13.59.14.1`
6. Run `./setup_master`

All the steps below should be performed from the master node

## Create the cluster
`./create_workers.sh`.

## Stop the cluster
`./stop.sh`

## Restart the cluster
`./start.sh`