
# data process and train

## process step1 : g2p(需要保留标点)
> 原始处理脚本（不支持混合输入）,参数在脚本中用环境变量获取。
> 输出 2-name2text.txt, 纯中文输出 3-bert目录。
> 输出形式为[音频路径、音素、未知参数、原始文本]：F01012005015.wav  n u3 l i4 g ai3 zh eng4 ?   [2, 2, 2, 2, 1] 努力改正?
```
python GPT_SoVITS/prepare_datasets/1-get-text.py
```

## process step2 : SSL自监督特征提取
> 输出 4-cnhubert 和 5-wav32k。

```
python GPT_SoVITS/prepare_datasets/2-get-hubert-wav32k.py
python GPT_SoVITS/2-get-hubert-wav32k.py
```



## train step1 : train So-VITS
> 学习率调整
> symbols调整为新语言方案
```
python GPT_SoVITS/s2_train.py --config configs/s2_example.json
```
## process step3 : 语义token提取 
> 输出6-name2semantic.tsv

```
python GPT_SoVITS/3-get-semantic.py
python GPT_SoVITS/merged_csv.py
```

## train step2 : train GPT
```
python GPT_SoVITS/s1_train.py --config_file configs/s1_example.yaml

```


