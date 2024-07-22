#!/bin/bash
sleep 10

if [ $# -lt 4 ]; then
    echo ".sh split_file out_dir i logs_dir"
    exit -1
fi

split_file=$1
out_dir=$2
i=$3
logs_dir=$4

cd /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/ 

#/mnt/share_afs/software/anaconda3/envs/eng_punc/bin/python \
/mnt/share_afs/software/anaconda3/envs/frd/bin/python \
    1-get-text.py  \
    $split_file \
    $out_dir \
    $i \
    >${logs_dir}/$(basename $split_file) 2>&1


subfinish=$(printf "$logs_dir/a1-%03d.finish" "$i")
touch $subfinish


