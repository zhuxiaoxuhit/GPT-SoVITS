#!/bin/bash
sleep 10

if [ $# -lt 5 ]; then
    echo ".sh split_file out_dir i logs_dir"
    exit -1
fi

split_file=$1
#wav_dir=$2
out_dir=$2
s2model_path=$3
i=$4
logs_dir=$5

cd /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/ 

#/mnt/share_afs/software/anaconda3/envs/eng_punc/bin/python \
/mnt/share_afs/software/anaconda3/envs/frd/bin/python \
    3-get-semantic.py  \
    $split_file \
    $out_dir \
    $s2model_path \
    $i \
    >${logs_dir}/$(basename $split_file) 2>&1


subfinish=$(printf "$logs_dir/c1-%03d.finish" "$i")
touch $subfinish


