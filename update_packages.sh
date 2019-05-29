#!/bin/bash

while read p; do
    rsync -a ~/.julia/ ${p}:~/.julia/
done < ips.txt
