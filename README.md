# README

## Create master node.
- download julia
- configure aws
- copy identify file

Now you can do everything else on the master node.

## Create the cluster
Create a cluster with `./create.sh`. Note, you will need to change the `--key-name` and `--security-group-ids` arguments.

## Stop the cluster
`./stop.sh`

## Restart the cluster
`./start.sh`