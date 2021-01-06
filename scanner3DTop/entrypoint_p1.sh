#!/bin/bash

python3 gen_files_list.py 2020-01-15_sub RAW_DATA_PATH __Top-heading-east_0_g.png > raw_data_files.json
python3 gen_bundles_list.py raw_data_files.json bundle_list.json 1
mkdir -p bundle/
python3 split_bundle_list.py bundle_list.json bundle/
/home/u31/emmanuelgonzalez/cctools-7.1.6-x86_64-centos7/bin/jx2json main_workflow_phase1.jx -a bundle_list.json > main_workflow_phase1.json
#/home/u31/emmanuelgonzalez/cctools-7.1.6-x86_64-centos7/bin/makeflow -T wq --json main_workflow_phase1.json -a -M phyto_oracle-atmo -p 9123 -dall -o dall.log $@
/home/u31/emmanuelgonzalez/cctools-7.1.6-x86_64-centos7/bin/makeflow -T wq --json main_workflow_phase1.json -a -N phytooracle -p 9123 -dall -o dall.log $@

