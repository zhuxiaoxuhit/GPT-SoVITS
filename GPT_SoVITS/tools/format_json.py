import json
import sys

# 读取一行 JSON 数据
#with open('../tmp_s2.json', 'r', encoding='utf-8') as file:
with open(sys.argv[1], 'r', encoding='utf-8') as file:
    one_line_json = file.read()

# 将 JSON 数据解析为 Python 对象
parsed_json = json.loads(one_line_json)

# 将 Python 对象转换为格式化的 JSON 字符串
formatted_json = json.dumps(parsed_json, indent=4, ensure_ascii=False)

# 将格式化后的 JSON 字符串写入新的文件
#with open('s2_example.json', 'w', encoding='utf-8') as file:
with open(sys.argv[2], 'w', encoding='utf-8') as file:
    file.write(formatted_json)

print("JSON 文件已经格式化并保存为 'formatted_file.json'")

