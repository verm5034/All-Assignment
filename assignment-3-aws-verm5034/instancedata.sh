#!/bin/bash

#  *****Retrieves and stores the meta-data in the metadata.txt file*****

cd scripts
touch metadata.txt
curl http://169.254.169.254/latest/meta-data/hostname > metadata.txt
curl http://169.254.169.254/latest/meta-data/iam/info >> metadata.txt
curl http://169.254.169.254/latest/meta-data/security-groups >> metadata.txt


