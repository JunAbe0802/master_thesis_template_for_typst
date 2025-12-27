# %%
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import seaborn as sns
import itertools
from adjustText import adjust_text
# %%
# 3D画像の読み込み
score_df = np.loadtxt('./score.txt', delimiter="\t", skiprows=1, dtype=str)

# 3D画像の読み込み
loading_df = np.loadtxt('./loading.txt', delimiter="\t", skiprows=1, dtype=str)
labels = loading_df[:, 0]  # 化合物名
# %%
replace_dict = {
  -2: 'Predictive Axis (2.3%)', 
  -1: 'Orthogonal Axis (33.9%)'
}
fig = plt.figure()
ax = fig.add_subplot(111)
sns.scatterplot(
  x=score_df[:, -2].astype(float),
  y=score_df[:, -1].astype(float),
  hue=score_df[:, 1],
  s=30,
  alpha=0.6,
  ax=ax
)
ax.set_xlabel(replace_dict[-2])
ax.set_ylabel(replace_dict[-1])
plt.savefig(
  '../../bmPCA_secScore.png',
  bbox_inches='tight',
  dpi=600,
)

# %%
replace_dict = {
  1: 'Predictive Axis (2.3%)', 
  2: 'Orthogonal Axis (33.9%)'
}
fig = plt.figure(figsize=(8,10))
ax = fig.add_subplot(111)
sc = ax.scatter(
  x=loading_df[:, 1].astype(float),
  y=loading_df[:, 2].astype(float),
  c=loading_df[:, 3].astype(float),
  cmap="viridis",
  marker='o',
)
ax.set_xlabel(replace_dict[1])
ax.set_ylabel(replace_dict[2])
plt.colorbar(sc, ax=ax, label='Predictive VIP Score')

texts = []
for i in range(len(loading_df)):
  texts.append(
    ax.text(
      loading_df[i, 1].astype(float),
      loading_df[i, 2].astype(float),
      loading_df[i, 0],
      size=8
    )
  )
adjust_text(texts, ax=ax)
  
plt.savefig(
  '../../bmPCA_secLoading.png',
  bbox_inches='tight',
  dpi=600,
)
# %%
