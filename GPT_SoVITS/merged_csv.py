import os
import pandas as pd

def merge_tsv_files(input_directory, output_file):
    # Initialize an empty DataFrame to store the merged data
    merged_data = pd.DataFrame()

    # Traverse the directory and read each TSV file
    for filename in os.listdir(input_directory):
        if filename.endswith(".tsv"):
            file_path = os.path.join(input_directory, filename)
            # Read the TSV file into a DataFrame
            df = pd.read_csv(file_path, delimiter='\t', header=None)
            # Append the data to the merged_data DataFrame
            merged_data = pd.concat([merged_data, df], ignore_index=True)

    # Write the merged data to the output TSV file
    merged_data.to_csv(output_file, sep='\t', index=False, header=False)

# Specify the input directory and output file name
input_directory = '/mnt/share_afs/share-workspace/zhuxiaoxu/code/GPT-SoVITS/GPT_SoVITS/logs/yue2kh_single_s8910'  # 替换为你的目录路径
output_file = os.path.join(input_directory, '6-name2semantic.tsv')

# Call the function to merge the TSV files
merge_tsv_files(input_directory, output_file)

