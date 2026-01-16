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
"""
Child
"""
# 3D画像の読み込み
scoreC_df = pd.read_csv('./score_c.txt', delimiter="\t")
scoreC_df["t"] = scoreC_df["M2.t[1]"]
scoreC_df["to"] = scoreC_df["M2.t[2]"]
scoreC_df["hue"] = scoreC_df["Primary ID"].str[10].map({
  "c": "Newborn",
  "d": "Aft. 1 mo.",
  "e": "Aft. 4-5 mos.",
  "f": "Aft. 8 mos.",
  "g": "Aft. 1.5 yrs.",
  "h": "Aft. 3 yrs.",
  "k": "Aft. 5 yrs.",
})
order = ["Newborn", "Aft. 1 mo.", "Aft. 4-5 mos.", "Aft. 8 mos.", "Aft. 1.5 yrs.", "Aft. 3 yrs.", "Aft. 5 yrs."]  
# 3D画像の読み込み
loadingC_df = pd.read_csv('./loading_c.txt', delimiter="\t")
loading_labels = loadingC_df.iloc[:, 0]  # 化合物名
# %%
replace_dict = {
  -2: 'PC1 (16.1%)', 
  -1: 'PC2 (6.2%)'
}
fig = plt.figure(
  figsize=(8,8)
)
ax = fig.add_subplot(111)
sns.scatterplot(
  data=scoreC_df,
  x="t",
  y="to",
  hue="hue",
  hue_order=order,
  palette='husl',
  s=40,
  alpha=0.9,
  ax=ax
)
# 楕円
for i in range(len(set(scoreC_df["hue"]))):
  palette = sns.color_palette("husl", n_colors=len(set(scoreC_df["hue"])))
  n_std = 2
  x = scoreC_df[scoreC_df["hue"]==order[i]]["t"].astype(float)
  y = scoreC_df[scoreC_df["hue"]==order[i]]["to"].astype(float)
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
    facecolor=palette[i],
    edgecolor=palette[i],
    linestyle='--',
    alpha=0.2,
  )
  scale_x = np.sqrt(cov[0,0]) * n_std
  mean_x = np.mean(x)
  scale_y = np.sqrt(cov[1,1]) * n_std
  mean_y = np.mean(y)

  transf = (transforms.Affine2D()
  .rotate_deg(45)
  .scale(scale_x, scale_y)
  .translate(mean_x, mean_y)
  )
  ellipse.set_transform(transf + ax.transData)
  ax.add_patch(ellipse)

ax.set_xlabel(replace_dict[-2])
ax.set_ylabel(replace_dict[-1])
ax.legend(
  ncol=2,
)
ax.set_ylim(-15, 25)
plt.savefig(
  '../../fePCAc_Score.svg',
  bbox_inches='tight',
  # dpi=600,
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
  '../../fePCAc_Loading.svg',
  bbox_inches='tight',
  # dpi=600,
)
# %%
"""
Mother
"""
# 3D画像の読み込み
scoreM_df = np.loadtxt('./score_m.txt', delimiter="\t", skiprows=1, dtype=str)
score_labels = pd.Series(scoreM_df[:, 0]).str[10].map({
  "b": "24 wks. pregnant",
  "c": "Postpartum",
  "d": "Aft. 1 mo.",
  "e": "Aft. 4-5 mos.",
})
order = ["24 wks. pregnant", "Postpartum", "Aft. 1 mo.", "Aft. 4-5 mos."]
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
# colorPalette = sns.color_palette("Spectral", l=0.5, s=1)
sns.scatterplot(
  x=scoreM_df[:, -2].astype(float),
  y=scoreM_df[:, -1].astype(float),
  hue=score_labels,
  hue_order=["24 wks. pregnant", "Postpartum", "Aft. 1 mo.", "Aft. 4-5 mos."],
  palette="husl",
  s=40,
  alpha=0.9,
  ax=ax
)
# 楕円
for i in range(len(set(score_labels))):
  paletteElipse = sns.color_palette("husl", n_colors=len(set(score_labels)))[i]
  n_std = 2
  x = scoreM_df[:, -2][np.array(score_labels)==order[i]].astype(float)
  y = scoreM_df[:, -1][np.array(score_labels)==order[i]].astype(float)
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
    facecolor=paletteElipse,
    edgecolor=paletteElipse,
    linestyle='--',
    alpha=0.2,
  )
  scale_x = np.sqrt(cov[0,0]) * n_std
  mean_x = np.mean(x)
  scale_y = np.sqrt(cov[1,1]) * n_std
  mean_y = np.mean(y)

  transf = (transforms.Affine2D()
  .rotate_deg(45)
  .scale(scale_x, scale_y)
  .translate(mean_x, mean_y)
  )
  ellipse.set_transform(transf + ax.transData)
  ax.add_patch(ellipse)

ax.set_xlabel(replace_dict[-2])
ax.set_ylabel(replace_dict[-1])
ax.legend(
  ncol=2,
)
ax.set_xlim(-17, 28)
plt.savefig(
  '../../fePCAm_Score.svg',
  bbox_inches='tight',
  # dpi=600,
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
  '../../fePCAm_Loading.svg',
  bbox_inches='tight',
  # dpi=600,
)
# %%
