#!/usr/bin/env bash

#Cleanup S3
aws s3 rm --recursive s3://$(python -m benchmark.config.config s3_root)/$(python -m benchmark.config.config s3_folder)ssh/

aws s3 rm --recursive s3://$(python -m benchmark.config.config s3_root)/$(python -m benchmark.config.config s3_folder)err/

aws s3 rm --recursive s3://$(python -m benchmark.config.config s3_root)/$(python -m benchmark.config.config s3_folder)out/
