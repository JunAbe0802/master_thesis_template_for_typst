# %%
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import seaborn as sns
import itertools
from adjustText import adjust_text
import pandas as pd
from matplotlib.patches import Ellipse
from matplotlib import transforms
# %%
# 3D画像の読み込み
# score_df = np.loadtxt('./score.txt', delimiter="\t", skiprows=1, dtype=str)
score_df = pd.read_csv('./score.txt', delimiter="\t")
score_df["t"] = score_df["M3.t[1]"]
score_df["to"] = score_df["M3.to[1]"]
# %%
# 3D画像の読み込み
loading_df = np.loadtxt('./loading.txt', delimiter="\t", skiprows=1, dtype=str)
labels = loading_df[:, 0]  # 化合物名
# %%
replace_dict = {
  -2: 'Predictive Axis (2.3%)', 
  -1: 'Orthogonal Axis (33.9%)'
}
order = score_df["Sec"].unique()
fig = plt.figure()
ax = fig.add_subplot(111)
sns.scatterplot(
  data=score_df,
  x="t",
  y="to",
  hue="Sec",
  hue_order=order,
  s=30,
  alpha=0.9,
  ax=ax
)
# 楕円
palette = sns.color_palette(n_colors=len(order))
for i in range(len(order)):
  n_std = 2
  x = score_df[score_df["Sec"]==order[i]]["t"].astype(float)
  y = score_df[score_df["Sec"]==order[i]]["to"].astype(float)
  cov = np.cov(
    x, y
  )
  pearson = cov[0, 1] / np.sqrt(cov[0, 0] * cov[1, 1])
  ell_radius_x = np.sqrt(1 + pearson)
  ell_radius_y = np.sqrt(1 - pearson)
  ellipse = Ellipse(
    (0,0),
    width=ell_radius_x*2,
    height=ell_radius_y*2,
    edgecolor=palette[i],
    facecolor=palette[i],
    linestyle='--',
    alpha=0.2,
  )
  scale_x = np.sqrt(cov[0,0]) * n_std
  scale_y = np.sqrt(cov[1,1]) * n_std
  transf = (transforms.Affine2D()
  .rotate_deg(45)
  .scale(scale_x, scale_y)
  .translate(np.mean(x), np.mean(y))
  )
  ellipse.set_transform(transf + ax.transData)
  ax.add_patch(ellipse)
ax.set_xlabel(replace_dict[-2])
ax.set_ylabel(replace_dict[-1])
ax.legend(title=None,)
ax.set_ylim(-10, 31)
plt.savefig(
  '../../bmOPLSDA_secScore.svg',
  bbox_inches='tight',
  # dpi=600,
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
  cmap="mako_r",
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
  '../../bmOPLSDA_secLoading.svg',
  bbox_inches='tight',
  # dpi=600,
)
# %%
