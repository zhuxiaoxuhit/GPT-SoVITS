#!/bin/bash
sleep 10

if [ $# -lt 1 ]; then
    echo ".sh config_path"
    exit -1
fi

config_path=$1
logs_dir=$2

cd /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/ 

/mnt/share_afs/software/anaconda3/envs/frd/bin/python \
    s2_train.py  --config $config_path >$logs_dir/s2.log 2>&1 


