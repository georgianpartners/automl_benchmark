#!/usr/bin/env bash

#Config matplotlib backend via matplotlibrc
export MATPLOTLIBRC=/root/automl_benchmark/benchmark/compute/baremetal/scripts

cd /root/
cd automl_benchmark
source automl_benchmark/bin/activate

timeout ${TIME} python -m benchmark.compute.baremetal.baremetal_wrapper

killall java
killall python

aws s3 cp /home/ec2-user/logs.out s3://${S3_BUCKET}/$(cat status)/$(date +%Y%m%d%H%M%S).log

cp /home/ec2-user/logs.out /home/ec2-user/${TASK}.log
rm /home/ec2-user/logs.out
