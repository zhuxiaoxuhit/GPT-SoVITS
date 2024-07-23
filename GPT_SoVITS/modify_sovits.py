import torch
#dict2 = torch.load("/mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/pretrained_models/s2G488k.pth",map_location=torch.device('cpu'))
#print(dict2["weight"]["enc_p.text_embedding.weight"].shape) # [322, 192]
#first_part = dict2["weight"]["enc_p.text_embedding.weight"][:,:]
#new_weight = torch.cat([first_part, torch.zeros(322,192)],dim=0) # [644, 192]
#dict2["weight"]["enc_p.text_embedding.weight"] = new_weight
#torch.save(dict2, "/mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/pretrained_models/s2G488k_Emb644.pth")


dict2 = torch.load("/mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/pretrained_models/s2G488k_Emb644.pth",map_location=torch.device('cpu'))
print(dict2["weight"]["enc_p.text_embedding.weight"].shape) # [322, 192]
