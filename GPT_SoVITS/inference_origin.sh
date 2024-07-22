python inference_cli.py \
    --gpt_model /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/pretrained_models/s1bert25hz-2kh-longer-epoch=68e-step=50232.ckpt \
    --sovits_model /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/pretrained_models/s2G488k.pth \
    --ref_audio /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/logs/yue2kh/5-wav32k/89b0da88-5bc5-5f9e-8866-d5a66b190995.wav \
    --ref_text refer.txt \
    --ref_language 英文\
    --target_text infer.txt \
    --target_language 英文\
    --output_path /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS

