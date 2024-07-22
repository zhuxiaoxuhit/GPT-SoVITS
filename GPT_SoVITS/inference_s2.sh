python inference_cli_yue.py \
    --gpt_model /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/GPT_single_weights/yue2kh-e8.ckpt \
    --sovits_model /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/SoVITS_weights/yue2kh_e16_s7920.pth \
    --ref_audio /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/test/396af51f-0505-5b9e-8532-a097c63404bb.wav \
    --ref_text test/s2_refer.txt \
    --ref_language 英文\
    --target_text test/s2_infer.txt \
    --target_language 英文\
    --output_path /mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS

