#!/bin/bash

filename=$1   # 输入文件名
out_dir=$2 # 输出路径
n=$3            # 分割数量

server=$4

if [ $server = "1986" ]; then
    echo "1986"
    export LOCAL_WORKSPACE_ID=bf74ad0d-219c-40eb-90fd-9b166d280214
    export LOCAL_PARTITION_ID=c2f4adfa-1aca-4204-b28c-1c726860906b
    export LOCAL_RESOURCE_TYPE=N1lS.Ib.I20.1
    export LOCAL_RESOURCE_DESC=1XV100-32GB
    export LOCAL_IMAGE_URL=registry.st-sh-01.sensecore.cn/ccr_speech/ljk-dev-sco:20240229-10h41m19s
    export LOCAL_STORAGE_MNT="1aabfd26-8423-11ee-95da-0aa21dd8da47:/mnt/share_afs,a9c4d16c-a559-11ee-9988-664fb1f07227:/mnt/afs"
elif [ $server = "1984" ]; then
    echo "1984"
    export LOCAL_WORKSPACE_ID=bf74ad0d-219c-40eb-90fd-9b166d280214
    export LOCAL_PARTITION_ID=aebc51aa-ac8f-4d0b-897f-1b5108472788
    export LOCAL_RESOURCE_TYPE=N1lS.Ia.I20.1
    export LOCAL_RESOURCE_DESC=1XV100-32GB
    export LOCAL_IMAGE_URL=registry.st-sh-01.sensecore.cn/ccr_speech/ljk-dev-sco:20240229-10h41m19s
    export LOCAL_STORAGE_MNT="1aabfd26-8423-11ee-95da-0aa21dd8da47:/mnt/share_afs,a9c4d16c-a559-11ee-9988-664fb1f07227:/mnt/afs"
elif [ $server = "1988" ]; then
    echo "1988"
    export LOCAL_WORKSPACE_ID=bf74ad0d-219c-40eb-90fd-9b166d280214
    export LOCAL_PARTITION_ID=speech-1988
    export LOCAL_RESOURCE_TYPE=N1lS.Ib.I20.1
    export LOCAL_RESOURCE_DESC=1XV100-32GB
    export LOCAL_IMAGE_URL=registry.st-sh-01.sensecore.cn/ccr_speech/ljk-dev-sco:20240229-10h41m19s
    export LOCAL_STORAGE_MNT="1aabfd26-8423-11ee-95da-0aa21dd8da47:/mnt/share_afs,a9c4d16c-a559-11ee-9988-664fb1f07227:/mnt/afs"
elif [ $server = "alm10" ]; then
    echo "alm10"
    export LOCAL_WORKSPACE_ID=bf74ad0d-219c-40eb-90fd-9b166d280214
    export LOCAL_PARTITION_ID=alm10
    export LOCAL_RESOURCE_TYPE=N1lS.Ib.I20.1
    export LOCAL_RESOURCE_DESC=1XV100-32GB
    export LOCAL_IMAGE_URL=registry.st-sh-01.sensecore.cn/ccr_speech/ljk-dev-sco:20240229-10h41m19s
    export LOCAL_STORAGE_MNT="1aabfd26-8423-11ee-95da-0aa21dd8da47:/mnt/share_afs,a9c4d16c-a559-11ee-9988-664fb1f07227:/mnt/afs"
else
    echo "unknown server"
    exit -2
fi


lsts_dir=$out_dir/lsts
logs_dir=$out_dir/logs

prefix=$lsts_dir/a1-

# STEP: a1

echo "a1 start ..."

if [[ ! -d ${out_dir} ]]; then
       mkdir -p ${out_dir} 
fi

if [[ ! -d ${lsts_dir} ]]; then
       mkdir -p ${lsts_dir} 
fi

if [[ ! -d ${logs_dir} ]]; then
       mkdir -p ${logs_dir} 
fi

#if [[ ! -d ${out_json_dir} ]]; then
#       mkdir -p ${out_json_dir} 
#fi



#echo "$filename"

total_lines=$(wc -l < "$filename")  # 获取文件总行数
#lines_per_file=$((total_lines/n))   # 每个文件应包含的行数
lines_per_file=$(awk -v total_lines="$total_lines" -v n="$n" 'BEGIN { rounded = total_lines / n; print int(rounded+(rounded>int(rounded))) }')


split -l $lines_per_file --numeric-suffixes=0 -d --suffix-length=3 "$filename" "$prefix"

n=0
while [ $(($n * $lines_per_file)) -lt $total_lines ]; do
    n=$((n+1))
done

#for i in `seq 0 $((ntask_split-1))`; do
for ((i=0; i<=n-1; i++))
do
    subfinish=$(printf "$logs_dir/1c-%03d.finish" "$i")
    rm -f $subfinish
done

for ((i=0; i<=n-1; i++))
do
    split_file="${prefix}$(printf '%03d' "$i")"
    echo "文件名：$split_file"
    #nohup srun -p speech -n 1 --gpus-per-task 1 --cpus-per-task 5 --quotatype=spot  python process_tts_pipline.py  --start 0 --end -1 --input_text_dir $split_txts_dir --input_lst $split_file --input_wav_dir ${wav_prefix} --out_fold $a1_res_dir >${logs_dir}/$(basename $split_file) 2>&1 &
       
    #/usr/bin/expect /mnt/afs/.auto-check.sh 
    
    sco acp jobs create \
        --workspace-name=$LOCAL_WORKSPACE_ID \
        --aec2-name=$LOCAL_PARTITION_ID \
        --priority=NORMAL \
        --training-framework=pytorch \
        --worker-nodes=1 \
        --worker-spec=$LOCAL_RESOURCE_DESC \
        --container-image-url $LOCAL_IMAGE_URL \
        --storage-mount=$LOCAL_STORAGE_MNT \
        --job-name=a1-$i \
        --command="\
			/usr/bin/bash `pwd`/sc_a1_sco.sh  \
			$split_file \
			${out_dir} \
			$i \
            ${logs_dir} \
            " 

	#>${logs_dir}/$(basename $split_file) 2>&1 \
    
    #srun --workspace-id=$LOCAL_WORKSPACE_ID -p $LOCAL_PARTITION_ID \
    #-f pt -r $LOCAL_RESOURCE_TYPE \
    #-j a1-$i \
    #/usr/bin/bash `pwd`/sc_a1.sh  $split_txts_dir $split_file  ${wav_prefix} $a1_res_dir $i >${logs_dir}/$(basename $split_file) 2>&1 & 
 
    
    sleep 1
done


#wait
for ((i=0; i<=n-1; i++))
do
    subfinish=$(printf "$logs_dir/a1-%03d.finish" "$i")
    printed=0
    while [ ! -f $subfinish ]; do
        if [ $printed -eq 0 ]; then
            echo "wait for $subfinish"
            printed=1
        fi
        sleep 5
    done
done


#find ${out_dir} -type f  -name "*.json" > $a1_res_dir/out.list

