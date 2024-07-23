#!/bin/bash

echo original PATH=$PATH
# change below PATH with yours (echo $PATH and replace below )
export PATH=/mnt/share_afs/software/anaconda3/envs/frd/bin:/mnt/share_afs/software/anaconda3/bin:/mnt/share_afs/share-workspace/gcloud/google-cloud-sdk/bin:/mnt/share_afs/software/anaconda3/bin:/root/.sco/bin:/usr/local/lib/miniconda3/condabin:/root/.scc/bin:/usr/local/lib/miniconda3/bin:/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

#go to work directory
cd /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS 

echo WORLD_SIZE=$WORLD_SIZE
echo RANK=$RANK
echo MASTER_ADDR=$MASTER_ADDR
echo MASTER_PORT=$MASTER_PORT

config_path=$1
#logs_dir=$2


#python -m torch.distributed.launch --nnodes $WORLD_SIZE --node_rank $RANK --master_addr $MASTER_ADDR --nproc_per_node 8 --master_port $MASTER_PORT  s2_train_ddp.py


# python 3.8
#python -m launch --nnodes $WORLD_SIZE --node_rank $RANK --master_addr $MASTER_ADDR --nproc_per_node 8 --master_port $MASTER_PORT s2_train_ddp.py
python -m launch --nnodes $WORLD_SIZE --node_rank $RANK --master_addr $MASTER_ADDR --nproc_per_node 8 --master_port $MASTER_PORT s2_train_ddp1_en75w.py 
#$config_path 

#>$logs_dir/s2.log 2>&1 

#lauch your train.py
#python -m torch.distributed.launch --nnodes $WORLD_SIZE --node_rank $RANK --master_addr $MASTER_ADDR --nproc_per_node 8 --master_port $MASTER_PORT    test.py
#python -m torch.distributed.launch --nnodes 1 --node_rank 0 --master_addr 127.0.0.1 --nproc_per_node 4 --master_port 29500    test.py

#python  test.py
