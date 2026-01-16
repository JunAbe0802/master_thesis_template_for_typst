# %%
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection
from matplotlib.colors import ListedColormap, BoundaryNorm
import seaborn as sns
from adjustText import adjust_text
from scipy.interpolate import interp1d
from matplotlib.patches import Ellipse
from matplotlib import transforms
# %%
"""
Child
"""
score_c_df = pd.read_csv(
  "./score_c.txt",
  delimiter="\t",
)
score_c_df["t"] = score_c_df["M7.t[1]"]
score_c_df["to"] = score_c_df["M7.to[1]"]
# %%
replace_dict = {
  -2: 'Predictive Axis (10.9%)', 
  -1: 'Orthogonal Axis (9.1%)'
}
score_c_df["hue"] = score_c_df["Primary ID"].str[10].map({
  "c": "Newborn",
  "d": "Aft. 1 mo.",
  "e": "Aft. 4-5 mos.",
  "f": "Aft. 8 mos.",
  "g": "Aft. 1.5 yrs.",
  "h": "Aft. 3 yrs.",
  "k": "Aft. 5 yrs.",
})
# %%
fig = plt.figure(
  # figsize=(8,8)
)
ax = fig.add_subplot(111)
palette = sns.color_palette("husl", n_colors=len(set(score_c_df["hue"])))
order = ["Newborn", "Aft. 1 mo.", "Aft. 4-5 mos.", "Aft. 8 mos.", "Aft. 1.5 yrs.", "Aft. 3 yrs.", "Aft. 5 yrs."]
sns.scatterplot(
  data=score_c_df,
  x="t",
  y="to",
  hue="hue",
  hue_order=order,
  palette=palette,
  s=40,
  alpha=0.9,
  ax=ax
)
# 楕円
for i in range(len(score_c_df["hue"].unique())):
  n_std = 2
  x = score_c_df[score_c_df["hue"]==order[i]]["t"].astype(float)
  y = score_c_df[score_c_df["hue"]==order[i]]["to"].astype(float)
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
  handlelength=0.8,
  handletextpad=0.2,
  borderaxespad=0.2,
  borderpad=0.4,
  columnspacing=0.5,
)
ax.set_ylim(-20, 18)
plt.savefig(
  '../../feOPLSc_TimeCourseScore.svg',
  bbox_inches='tight',
  # dpi=600,
)
# %%
sline_c_df = pd.read_csv(
  "./sline_c.txt",
  delimiter="\t",
).dropna(axis=1)
sline_c_df
# %%
sline_c_x = sline_c_df["Primary ID"].to_numpy()
sline_c_y = sline_c_df.iloc[:, -2].to_numpy()
sline_c_z = sline_c_df.iloc[:, -1].abs().to_numpy()

# x, y, zの補間で細かくする
num_points = 5000  # 細かくしたい点数
sline_c_f_x = interp1d(np.arange(len(sline_c_x)), sline_c_x)
sline_c_f_y = interp1d(np.arange(len(sline_c_y)), sline_c_y)
sline_c_f_z = interp1d(np.arange(len(sline_c_z)), sline_c_z)

new_idx = np.linspace(0, len(sline_c_x)-1, num_points)
sline_c_x_fine = sline_c_f_x(new_idx)
sline_c_y_fine = sline_c_f_y(new_idx)
sline_c_z_fine = sline_c_f_z(new_idx)

points = np.array([sline_c_x_fine, sline_c_y_fine]).T.reshape(-1, 1, 2)
segments = np.concatenate([points[:-1], points[1:]], axis=1)

fig = plt.figure()
ax = fig.add_subplot(111)

norm = plt.Normalize(0, 1)
lc = LineCollection(
    segments,
    cmap='mako_r',
    norm=norm,
    alpha=0.7,   # 透明度を0.5に設定
    linewidth=5
)
lc.set_array(sline_c_z_fine[:-1])  # 各セグメントに色を割り当て
lc.set_linewidth(1)        # 線幅を細く（例: 1）
line = ax.add_collection(lc)
fig.colorbar(
  line, 
  label="abs(p(corr)[1])",
  ax=ax
)

ax.set_xlim(sline_c_x_fine.min(), sline_c_x_fine.max())
ax.set_ylim(sline_c_y_fine.min(), sline_c_y_fine.max())
ax.set_xlabel("$^1$H Chemical Shift (ppm)")
ax.set_ylabel("p(ctr)[1]")
ax.invert_xaxis()

plt.savefig(
  "../../feOPLSc_TimecourseSLine.svg", 
  bbox_inches='tight',
)
# %%
"""
Mother
"""
score_m_df = pd.read_csv(
  "./score_m.txt",
  delimiter="\t",
)
score_m_df["t"] = score_m_df["M18.t[1]"]
score_m_df["to"] = score_m_df["M18.to[1]"]
# %%
replace_dict = {
  -2: 'Predictive Axis (10.9%)', 
  -1: 'Orthogonal Axis (9.1%)'
}
score_m_df["hue"] = score_m_df["Primary ID"].str[10].map({
  "b": "24 wks. pregnant",
  "c": "Postpartum",
  "d": "Aft. 1 mo.",
  "e": "Aft. 4-5 mos.",
})
# %%
fig = plt.figure(
  # figsize=(8,8)
)
ax = fig.add_subplot(111)
order = [
  "24 wks. pregnant",
  "Postpartum",
  "Aft. 1 mo.",
  "Aft. 4-5 mos."
]
sns.scatterplot(
  data=score_m_df,
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
for i in range(len(score_m_df["hue"].unique())):
  n_std = 2
  x = score_m_df[score_m_df["hue"]==order[i]]["t"].astype(float)
  y = score_m_df[score_m_df["hue"]==order[i]]["to"].astype(float)
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
    facecolor=sns.color_palette("husl", n_colors=len(score_m_df["hue"].unique()))[i],
    edgecolor=sns.color_palette("husl", n_colors=len(score_m_df["hue"].unique()))[i],
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
  handlelength=0.8,
  handletextpad=0.2,
  borderaxespad=0.2,
  borderpad=0.4,
  columnspacing=0.5,
)
plt.savefig(
  '../../feOPLSm_TimeCourseScore.svg',
  bbox_inches='tight',
  # dpi=600,
)
# %%
sline_m_df = pd.read_csv(
  "./sline_m.txt",
  delimiter="\t",
).dropna(axis=1)
sline_m_df
# %%
sline_m_x = sline_m_df["Primary ID"].to_numpy()
sline_m_y = sline_m_df.iloc[:, -2].to_numpy()
sline_m_z = sline_m_df.iloc[:, -1].abs().to_numpy()

# x, y, zの補間で細かくする
num_points = 5000  # 細かくしたい点数
sline_m_f_x = interp1d(np.arange(len(sline_m_x)), sline_m_x)
sline_m_f_y = interp1d(np.arange(len(sline_m_y)), sline_m_y)
sline_m_f_z = interp1d(np.arange(len(sline_m_z)), sline_m_z)

new_idx = np.linspace(0, len(sline_m_x)-1, num_points)
sline_m_x_fine = sline_m_f_x(new_idx)
sline_m_y_fine = sline_m_f_y(new_idx)
sline_m_z_fine = sline_m_f_z(new_idx)

points = np.array([sline_m_x_fine, sline_m_y_fine]).T.reshape(-1, 1, 2)
segments = np.concatenate([points[:-1], points[1:]], axis=1)

fig = plt.figure()
ax = fig.add_subplot(111)

norm = plt.Normalize(0, 1)
lc = LineCollection(
    segments,
    cmap='mako_r',
    norm=norm,
    alpha=0.7,      # 透明度を0.8に設定
    linewidth=5
)
lc.set_array(sline_m_z_fine[:-1])  # 各セグメントに色を割り当て
lc.set_linewidth(1)        # 線幅を細く（例: 1）
line = ax.add_collection(lc)
fig.colorbar(
  line, 
  label="abs(p(corr)[1])",
  ax=ax
)

ax.set_xlim(sline_m_x_fine.min(), sline_m_x_fine.max())
ax.set_ylim(sline_m_y_fine.min(), sline_m_y_fine.max())
ax.set_xlabel("$^1$H Chemical Shift (ppm)")
ax.set_ylabel("p(ctr)[1]")
ax.invert_xaxis()

plt.savefig(
  "../../feOPLSm_TimecourseSLine.svg", 
  bbox_inches='tight',
)
# %%
