#%%
import os
import numpy as np

# 対象path
path = './sampleNumber.csv'

# 文字列作成
df = np.loadtxt(path, delimiter=',', dtype=str)

sentence = []
for i in range(len(df)):
  row = df[i]
  sentence.append(f"{'],['.join(row)}")  # 各文字列を [] で囲む

# 文字列出力
sentence = '],\n['.join(sentence)
sentence = f'[{sentence}],'
print(sentence)  # 各行を改行で区切る
# %%
