python inference_cli_yue.py \
    --gpt_model /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/logs/0100037/GPT_weights/32799-e2.ckpt \
    --sovits_model /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/logs/0100037/SoVITS_weights/0100037_e25_s2175.pth \
    --ref_audio /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/test/01000370001.wav \
    --ref_text test/0100037_refer.txt \
    --ref_language 英文\
    --target_text test/0100037_infer.txt \
    --target_language 英文\
    --output_path /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS

