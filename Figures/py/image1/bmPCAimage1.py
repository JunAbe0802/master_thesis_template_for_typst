# %%
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import seaborn as sns
import itertools
from adjustText import adjust_text
# %%
# 3D画像の読み込み
score_df = np.loadtxt('./score1.txt', delimiter="\t", skiprows=1, dtype=str)
score_x = score_df[:, -3].astype(float)
score_y = score_df[:, -2].astype(float)
score_z = score_df[:, -1].astype(float)
# %%
# 3D画像の読み込み
loading_df = np.loadtxt('./loading1.txt', delimiter="\t", skiprows=1, dtype=str)
loading_x = loading_df[:, -3].astype(float)
loading_y = loading_df[:, -2].astype(float)
loading_z = loading_df[:, -1].astype(float)
# %%
score_c = [i[10] for i in score_df[:, 0].tolist()]
replace_dict = {
  -1: 'PC3 (8.1%)', 
  -2: 'PC2 (13.1%)', 
  -3: 'PC1 (33.8%)'
}

fig = plt.figure(figsize=(14,16))
gs = fig.add_gridspec(
  3, 2,
  # height_ratios=[4,2],
  wspace=0.2,
  hspace=0.3,
)
groups = list(itertools.combinations([-3, -2, -1], 2))
for i in range(len(groups)):
  group = groups[i]

  ax = fig.add_subplot(gs[i, 0])
  sns.scatterplot(
    x=score_df[:, group[0]].astype(float),
    y=score_df[:, group[1]].astype(float),
    hue=score_c,
    s=20,
    alpha=0.7,
    palette="mako",
    ax=ax
  )
  ax.set_xlabel(replace_dict[group[0]])
  ax.set_ylabel(replace_dict[group[1]])
  # ax.set_xlabel("")
  # ax.set_ylabel("")
  handler, label = ax.get_legend_handles_labels()
  ax.legend(
    handler, 
    ["Postpartum", "After 1 month", "After 4-5 months"],
  )
  if i!=0:
    ax.legend_.remove()
  
  ax = fig.add_subplot(gs[i, 1])
  sns.scatterplot(
    x=loading_df[:, group[1]].astype(float),
    y=loading_df[:, group[0]].astype(float),
    s=30,
    marker='o',
    color='gray',
    ax=ax
  )
  ax.set_xlabel(replace_dict[group[1]])
  ax.set_ylabel(replace_dict[group[0]])
  # ax.set_ylabel("")
  # ax.set_xlabel("")

  texts = []
  for j in range(len(loading_df)):
    texts.append(
      ax.text(
        loading_df[j, group[1]].astype(float),
        loading_df[j, group[0]].astype(float),
        loading_df[j, 0],
        size=8
      )
    )
  adjust_text(texts, ax=ax)

plt.savefig(
  '../../bmPCA_timeCourse.svg',
  bbox_inches='tight',
  # dpi=600,
)
# %%
