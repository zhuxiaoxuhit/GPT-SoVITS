python inference_cli_yue_s2.py \
    --gpt_model /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/GPT_single_weights/yue2kh-e8.ckpt \
    --sovits_model /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/logs/s2G488k_Emb644_ft_ca208w+en75w/SoVITS_weights/s2G488k_Emb644_ft_ca208w+en75w_e3_s2616.pth \
    --ref_audio /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/test/X42NUMNvZlE_segment31.wav \
    --ref_text test/s2_refer_en.txt \
    --ref_language 英文\
    --target_text test/s2_infer_en.txt \
    --target_language 英文\
    --output_path /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS

#--sovits_model /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/logs/s2G488k_Emb644_ft_ca208w+en75w/SoVITS_weights/s2G488k_Emb644_ft_ca208w+en75w_e3_s2616.pth \
