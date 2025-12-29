# %%
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection
from matplotlib.colors import ListedColormap, BoundaryNorm
import seaborn as sns
from adjustText import adjust_text
from scipy.interpolate import interp1d
# %%
score1_df = pd.read_csv(
  "./score.txt",
  delimiter="\t",
)
# %%
replace_dict = {
  -2: 'PC1 (47.0%)', 
  -1: 'PC2 (27.5%)'
}
hues = score1_df["Primary ID"].str[:7]
labels = score1_df["person"].replace(
  {'s': 1, 'a': 2, 'b': 3, 'k': 4, 'h': 5}
)
# %%
fig = plt.figure(
  # figsize=(8,8)
)
ax = fig.add_subplot(111)
sns.scatterplot(
  x=score1_df.iloc[:, -2].astype(float),
  y=score1_df.iloc[:, -1].astype(float),
  hue=hues,
  hue_order=sorted(hues.unique()),
  # palette='viridis',
  s=30,
  alpha=0.9,
  ax=ax
)

texts = []
for i in range(len(score1_df["person"])):
  texts.append(
    ax.text(
      score1_df.iloc[:, -2].astype(float)[i],
      score1_df.iloc[:, -1].astype(float)[i],
      labels[i],
      size=8
    )
  )
adjust_text(texts, ax=ax)

ax.set_xlabel(replace_dict[-2])
ax.set_ylabel(replace_dict[-1])

ax.legend_.remove()

plt.savefig(
  '../../bmPCAmanual_Score.svg',
  bbox_inches='tight',
  # dpi=600,
)

# %%
