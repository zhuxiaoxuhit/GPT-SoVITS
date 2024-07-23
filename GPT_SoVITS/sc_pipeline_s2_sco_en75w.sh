#!/bin/bash

config_path=$1
world_size=$2 
server=$3

if [ $server = "1988" ]; then
    echo "1988"
    export LOCAL_WORKSPACE_ID=bf74ad0d-219c-40eb-90fd-9b166d280214
    export LOCAL_PARTITION_ID=speech-1988
    export LOCAL_RESOURCE_TYPE=N1lS.Ib.I20.4
    export LOCAL_RESOURCE_DESC=4XV100-32GB
    export LOCAL_IMAGE_URL=registry.st-sh-01.sensecore.cn/ccr_speech/ljk-dev-sco:20240229-10h41m19s
    export LOCAL_STORAGE_MNT="1aabfd26-8423-11ee-95da-0aa21dd8da47:/mnt/share_afs,a9c4d16c-a559-11ee-9988-664fb1f07227:/mnt/afs"
elif [ $server = "alm10" ]; then
    echo "alm10"
    export LOCAL_WORKSPACE_ID=bf74ad0d-219c-40eb-90fd-9b166d280214
    export LOCAL_PARTITION_ID=alm10
    export LOCAL_RESOURCE_TYPE=N1lS.Ib.I20.4
    export LOCAL_RESOURCE_DESC=4XV100-32GB
    export LOCAL_IMAGE_URL=registry.st-sh-01.sensecore.cn/ccr_speech/ljk-dev-sco:20240229-10h41m19s
    export LOCAL_STORAGE_MNT="1aabfd26-8423-11ee-95da-0aa21dd8da47:/mnt/share_afs,a9c4d16c-a559-11ee-9988-664fb1f07227:/mnt/afs"
else
    echo "unknown server"
    exit -2
fi

srun -j s2ddp -p $LOCAL_PARTITION_ID  --workspace-id $LOCAL_WORKSPACE_ID -y -f pt -r N1lS.Ib.I20.8 -N $world_size -d Allreduce sh /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/sc_s2_sco_ddp_en75w.sh $config_path


#        #/usr/bin/bash `pwd`/sc_s2_sco.sh  \
#sco acp jobs create \
#    --workspace-name=$LOCAL_WORKSPACE_ID \
#    --aec2-name=$LOCAL_PARTITION_ID \
#    --priority=NORMAL \
#    --training-framework=pytorch \
#    --worker-nodes=$n \
#    --worker-spec=$LOCAL_RESOURCE_DESC \
#    --container-image-url $LOCAL_IMAGE_URL \
#    --storage-mount=$LOCAL_STORAGE_MNT \
#    --job-name=s2-train \
#    --command="\
#		/usr/bin/bash `pwd`/sc_s2_sco_ddp.sh  \
#		$config_path \
#        $logs_dir
#        "
# 
