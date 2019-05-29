#!/bin/bash

# wget https://julialang-s3.julialang.org/bin/linux/x64/1.1/julia-1.1.1-linux-x86_64.tar.gz
tar -xf julia-1.1.1-linux-x86_64.tar.gz
sudo ln -s /home/ec2-user/julia-1.1.1/bin/julia /usr/local/bin/julia