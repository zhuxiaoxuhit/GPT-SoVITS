
# data process

## step1 : g2p(需要保留标点)
> 原始处理脚本（不支持混合输入）,参数在脚本中用环境变量获取。
> 输出 2-name2text.txt, 纯中文输出 3-bert目录。
> 输出形式为[音频路径、音素、未知参数、原始文本]：F01012005015.wav  n u3 l i4 g ai3 zh eng4 ?   [2, 2, 2, 2, 1] 努力改正?
```
python GPT_SoVITS/prepare_datasets/1-get-text.py
```

## step2 : SSL自监督特征提取
> 输出 4-cnhubert 和 5-wav32k。

```
python GPT_SoVITS/prepare_datasets/2-get-hubert-wav32k.py
```

## step3 : 语义token提取 
> 输出6-name2semantic.tsv

```
python GPT_SoVITS/prepare_datasets/3-get-semantic.py
```



# train process

## step1 : train So-VITS
```
python GPT_SoVITS/s2_train.py --config configs/s2_example.json
```

## step2 : train GPT
```
python GPT_SoVITS/s1_train.py --config_file configs/s1_example.yaml
```
