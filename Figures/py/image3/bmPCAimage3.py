# %%
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import seaborn as sns
import itertools
from adjustText import adjust_text
import pandas as pd
# %%
"""
Child
"""
# 3D画像の読み込み
scoreC_df = np.loadtxt('./score_c.txt', delimiter="\t", skiprows=1, dtype=str)
score_labels = pd.Series(scoreC_df[:, 0]).str[10]

# 3D画像の読み込み
loadingC_df = np.loadtxt('./loading_c.txt', delimiter="\t", skiprows=1, dtype=str)
loading_labels = loadingC_df[:, 0]  # 化合物名
# %%
replace_dict = {
  -2: 'PC1 (16.1%)', 
  -1: 'PC2 (6.2%)'
}
hues = scoreC_df[:, 0]
fig = plt.figure(
  figsize=(8,8)
)
ax = fig.add_subplot(111)
sns.scatterplot(
  x=scoreC_df[:, -2].astype(float),
  y=scoreC_df[:, -1].astype(float),
  hue=score_labels,
  hue_order=sorted(score_labels.unique()),
  palette='viridis',
  s=30,
  alpha=0.9,
  ax=ax
)
ax.set_xlabel(replace_dict[-2])
ax.set_ylabel(replace_dict[-1])
ax.legend(
  ncol=2,
)
plt.savefig(
  '../../fePCAc_Score.png',
  bbox_inches='tight',
  dpi=600,
)

# %%
fig = plt.figure(
  figsize=(8,8)
)
ax = fig.add_subplot(111)
sns.scatterplot(
  x=loadingC_df[:, -2].astype(float),
  y=loadingC_df[:, -1].astype(float),
  color="gray",
  legend=None,
  marker='o',
  ax=ax
)
ax.set_xlabel(replace_dict[-2])
ax.set_ylabel(replace_dict[-1])
# plt.colorbar(sc, ax=ax, label='Predictive VIP Score')

texts = []
threshold = 0.089 # ラベルを表示する閾値を設定
center = [
  (loadingC_df[:, -2].astype(float).max() - loadingC_df[:, -2].astype(float).min()) / 2 + loadingC_df[:, -2].astype(float).min(),
  (loadingC_df[:, -1].astype(float).max() - loadingC_df[:, -1].astype(float).min()) / 2 + loadingC_df[:, -1].astype(float).min()
]
for i in range(len(loadingC_df)):
  if (
    (loadingC_df[i, -2].astype(float) - center[0])**2 
    + (loadingC_df[i, -1].astype(float) - center[1])**2
  )**0.5 > threshold:
    texts.append(
      ax.text(
        loadingC_df[i, -2].astype(float),
        loadingC_df[i, -1].astype(float),
        loading_labels[i],
        size=8
      )
    )
adjust_text(texts, ax=ax)
  
plt.savefig(
  '../../fePCAc_Loading.png',
  bbox_inches='tight',
  dpi=600,
)
# %%
"""
Mother
"""
# 3D画像の読み込み
scoreM_df = np.loadtxt('./score_m.txt', delimiter="\t", skiprows=1, dtype=str)
score_labels = pd.Series(scoreM_df[:, 0]).str[10]

# 3D画像の読み込み
loadingM_df = np.loadtxt('./loading_m.txt', delimiter="\t", skiprows=1, dtype=str)
loading_labels = loadingM_df[:, 0]  # 化合物名
# %%
replace_dict = {
  -2: 'PC1 (10.7%)', 
  -1: 'PC2 (5.3%)'
}
hues = scoreM_df[:, 0]
fig = plt.figure(
  figsize=(8,8)
)
ax = fig.add_subplot(111)
sns.scatterplot(
  x=scoreM_df[:, -2].astype(float),
  y=scoreM_df[:, -1].astype(float),
  hue=score_labels,
  hue_order=sorted(score_labels.unique()),
  palette='viridis',
  s=30,
  alpha=0.9,
  ax=ax
)
ax.set_xlabel(replace_dict[-2])
ax.set_ylabel(replace_dict[-1])
ax.legend(
  ncol=2,
)
plt.savefig(
  '../../fePCAm_Score.png',
  bbox_inches='tight',
  dpi=600,
)

# %%
fig = plt.figure(
  figsize=(8,8)
)
ax = fig.add_subplot(111)
sns.scatterplot(
  x=loadingM_df[:, -2].astype(float),
  y=loadingM_df[:, -1].astype(float),
  color="gray",
  legend=None,
  marker='o',
  ax=ax
)
ax.set_xlabel(replace_dict[-2])
ax.set_ylabel(replace_dict[-1])
# plt.colorbar(sc, ax=ax, label='Predictive VIP Score')

texts = []
threshold = 0.075 # ラベルを表示する閾値を設定
center = [
  (loadingM_df[:, -2].astype(float).max() - loadingM_df[:, -2].astype(float).min()) / 2 + loadingM_df[:, -2].astype(float).min(),
  (loadingM_df[:, -1].astype(float).max() - loadingM_df[:, -1].astype(float).min()) / 2 + loadingM_df[:, -1].astype(float).min()
]
for i in range(len(loadingM_df)):
  if (
    (loadingM_df[i, -2].astype(float) - center[0])**2 
    + (loadingM_df[i, -1].astype(float) - center[1])**2
  )**0.5 > threshold:
    texts.append(
      ax.text(
        loadingM_df[i, -2].astype(float),
        loadingM_df[i, -1].astype(float),
        loading_labels[i],
        size=8
      )
    )
adjust_text(texts, ax=ax)
  
plt.savefig(
  '../../fePCAm_Loading.png',
  bbox_inches='tight',
  dpi=600,
)
# %%
