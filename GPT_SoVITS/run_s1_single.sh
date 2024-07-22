## train : yue2kh_single
#sh /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/sc_pipeline_s1_sco_single.sh \
#    /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/configs/s1_yue2kh_single.yaml   \
#    /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/logs/yue2kh_single \
#    1 \
#    1988

### train : yue2kh_single_s8910
#sh /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/sc_pipeline_s1_sco_single.sh \
#    /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/configs/s1_yue2kh_single_s8910.yaml   \
#    /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/logs/yue2kh_single_s8910 \
#    1 \
#    1988


## fine tuning : yue2kh_singe  fine tuning 0100037
sh /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/sc_pipeline_s1_sco_single.sh \
    /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/configs/s1_yue2kh_single_ft_0100037.yaml  \
    /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/logs/0100037 \
    1 \
    1988

#/mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/GPT_single_weights/yue2kh-e8.ckpt 
