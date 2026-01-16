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
colostrum
"""
score1_df = pd.read_csv(
  "./score_1.txt",
  delimiter="\t",
)
score1_df["t"] = score1_df["M12.t[1]"].astype(float)
score1_df["to"] = score1_df["M12.to[1]"].astype(float)
score1_df["class"] = score1_df["Class"].replace(
  {
    1: 'Se+',
    2: 'Se-',
  }
)
order = score1_df["class"].unique()
# %%
replace_dict = {
  -2: 'Predictive Axis (3.3%)', 
  -1: 'Orthogonal Axis (13.0%)'
}

# %%
fig = plt.figure(
  # figsize=(8,8)
)
ax = fig.add_subplot(111)
sns.scatterplot(
  data=score1_df,
  x="t",
  y="to",
  hue="class",
  hue_order=order,
  # palette='deep',
  s=70,
  alpha=0.9,
  ax=ax
)
# 楕円
palette = sns.color_palette(n_colors=len(score1_df["class"].unique()))
for i in range(len(score1_df["class"].unique())):
  n_std = 2
  x = score1_df[score1_df["class"]==order[i]]["t"]
  y = score1_df[score1_df["class"]==order[i]]["to"]
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
  title=None,
)
plt.savefig(
  '../../feOPLSc_sec1Score.svg',
  bbox_inches='tight',
  # dpi=600,
)
# %%
sline_1_df = pd.read_csv(
  "./sline_1.txt",
  delimiter="\t",
).dropna(axis=1)
sline_1_df
# %%
sline_1_x = sline_1_df["Primary ID"].to_numpy()
sline_1_y = sline_1_df.iloc[:, -2].to_numpy()
sline_1_z = sline_1_df.iloc[:, -1].abs().to_numpy()

# x, y, zの補間で細かくする
num_points = 5000  # 細かくしたい点数
sline_1_f_x = interp1d(np.arange(len(sline_1_x)), sline_1_x)
sline_1_f_y = interp1d(np.arange(len(sline_1_y)), sline_1_y)
sline_1_f_z = interp1d(np.arange(len(sline_1_z)), sline_1_z)

new_idx = np.linspace(0, len(sline_1_x)-1, num_points)
sline_1_x_fine = sline_1_f_x(new_idx)
sline_1_y_fine = sline_1_f_y(new_idx)
sline_1_z_fine = sline_1_f_z(new_idx)

points = np.array([sline_1_x_fine, sline_1_y_fine]).T.reshape(-1, 1, 2)
segments = np.concatenate([points[:-1], points[1:]], axis=1)

fig = plt.figure()
ax = fig.add_subplot(111)

# norm = plt.Normalize(sline_1_z_fine.min(), sline_1_z_fine.max())
norm = plt.Normalize(0, 1)

lc = LineCollection(
    segments,
    cmap='mako_r',
    norm=norm,
)
lc.set_array(sline_1_z_fine[:-1])  # 各セグメントに色を割り当て
lc.set_linewidth(2)        # 線幅を細く（例: 1）
lc.set_alpha(0.7)
line = ax.add_collection(lc)
fig.colorbar(
  line, 
  label="abs(p(corr)[1])",
  ax=ax
)

ax.set_xlim(sline_1_x_fine.min(), sline_1_x_fine.max())
ax.set_ylim(sline_1_y_fine.min()*1.05, sline_1_y_fine.max()*1.05)
ax.set_xlabel("$^1$H Chemical Shift (ppm)")
ax.set_ylabel("p(ctr)[1]")
ax.invert_xaxis()

plt.savefig(
  "../../feOPLSc_sec1SLine.svg", 
  bbox_inches='tight',
)

# %%
"""
1 month
"""
# %%
score2_df = pd.read_csv(
  "./score_2.txt",
  delimiter="\t",
)
score2_df["t"] = score2_df["M13.t[1]"].astype(float)
score2_df["to"] = score2_df["M13.to[1]"].astype(float)
# %%
replace_dict = {
  -2: 'Predictive Axis (2.1%)', 
  -1: 'Orthogonal Axis (20.9%)'
}
score2_df["Class"] = score2_df["Class"].replace(
  {
    1: 'Se+',
    2: 'Se-',
  }
)
order = score2_df["Class"].unique()
# %%
fig = plt.figure(
  # figsize=(8,8)
)
ax = fig.add_subplot(111)
sns.scatterplot(
  data=score2_df,
  x="t",
  y="to",
  hue="Class",
  hue_order=sorted(order),
  # palette='viridis',
  s=70,
  alpha=0.9,
  ax=ax
)
# 楕円
palette = sns.color_palette(n_colors=len(score2_df["Class"].unique()))
for i in range(len(score2_df["Class"].unique())):
  n_std = 2
  x = score2_df[score2_df["Class"]==order[i]]["t"]
  y = score2_df[score2_df["Class"]==order[i]]["to"]
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
ax.legend_.remove()
plt.savefig(
  '../../feOPLSc_sec2Score.svg',
  bbox_inches='tight',
  # dpi=600,
)
# %%
sline_2_df = pd.read_csv(
  "./sline_2.txt",
  delimiter="\t",
).dropna(axis=1)
sline_2_df
# %%
sline_2_x = sline_2_df["Primary ID"].to_numpy()
sline_2_y = sline_2_df.iloc[:, -2].to_numpy()
sline_2_z = sline_2_df.iloc[:, -1].abs().to_numpy()

# x, y, zの補間で細かくする
num_points = 5000  # 細かくしたい点数
sline_2_f_x = interp1d(np.arange(len(sline_2_x)), sline_2_x)
sline_2_f_y = interp1d(np.arange(len(sline_2_y)), sline_2_y)
sline_2_f_z = interp1d(np.arange(len(sline_2_z)), sline_2_z)

new_idx = np.linspace(0, len(sline_2_x)-1, num_points)
sline_2_x_fine = sline_2_f_x(new_idx)
sline_2_y_fine = sline_2_f_y(new_idx)
sline_2_z_fine = sline_2_f_z(new_idx)

points = np.array([sline_2_x_fine, sline_2_y_fine]).T.reshape(-1, 1, 2)
segments = np.concatenate([points[:-1], points[1:]], axis=1)

fig = plt.figure()
ax = fig.add_subplot(111)

# norm = plt.Normalize(sline_2_z_fine.min(), sline_2_z_fine.max())
norm = plt.Normalize(0, 1)

lc = LineCollection(
    segments,
    cmap='mako_r',
    norm=norm,
)
lc.set_array(sline_2_z_fine[:-1])  # 各セグメントに色を割り当て
lc.set_linewidth(2)        # 線幅を細く（例: 1）
lc.set_alpha(0.7)
line = ax.add_collection(lc)
fig.colorbar(
  line, 
  label="abs(p(corr)[1])",
  ax=ax
)

ax.set_xlim(sline_2_x_fine.min(), sline_2_x_fine.max())
ax.set_ylim(sline_2_y_fine.min()*1.05, sline_2_y_fine.max()*1.05)
ax.set_xlabel("$^1$H Chemical Shift (ppm)")
ax.set_ylabel("p(ctr)[1]")
ax.invert_xaxis()

plt.savefig(
  "../../feOPLSc_sec2SLine.svg", 
  bbox_inches='tight',
)
# %%
"""
4-5 months
"""
# %%
score3_df = pd.read_csv(
  "./score_3.txt",
  delimiter="\t",
)
score3_df["t"] = score3_df["M14.t[1]"].astype(float)
score3_df["to"] = score3_df["M14.to[1]"].astype(float)
# %%
replace_dict = {
  -2: 'Predictive Axis (1.9%)', 
  -1: 'Orthogonal Axis (10.8%)'
}
score3_df["Class"] = score3_df["Class"].replace(
  {
    1: 'Se+',
    2: 'Se-',
  }
)
order = score3_df["Class"].unique()
# %%
fig = plt.figure(
  # figsize=(8,8)
)
ax = fig.add_subplot(111)
sns.scatterplot(
  data=score3_df,
  x="t",
  y="to",
  hue=score3_df["Class"],
  hue_order=order,
  # palette='viridis',
  s=70,
  alpha=0.9,
  ax=ax
)
# 楕円
palette = sns.color_palette(n_colors=len(score3_df["Class"].unique()))
for i in range(len(score3_df["Class"].unique())):
  n_std = 2
  x = score3_df[score3_df["Class"]==order[i]]["t"]
  y = score3_df[score3_df["Class"]==order[i]]["to"]
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
ax.legend_.remove()
plt.savefig(
  '../../feOPLSc_sec3Score.svg',
  bbox_inches='tight',
  # dpi=600,
)
# %%
sline_3_df = pd.read_csv(
  "./sline_3.txt",
  delimiter="\t",
).dropna(axis=1)
sline_3_df
# %%
sline_3_x = sline_3_df["Primary ID"].to_numpy()
sline_3_y = sline_3_df.iloc[:, -2].to_numpy()
sline_3_z = sline_3_df.iloc[:, -1].abs().to_numpy()

# x, y, zの補間で細かくする
num_points = 5000  # 細かくしたい点数
sline_3_f_x = interp1d(np.arange(len(sline_3_x)), sline_3_x)
sline_3_f_y = interp1d(np.arange(len(sline_3_y)), sline_3_y)
sline_3_f_z = interp1d(np.arange(len(sline_3_z)), sline_3_z)

new_idx = np.linspace(0, len(sline_3_x)-1, num_points)
sline_3_x_fine = sline_3_f_x(new_idx)
sline_3_y_fine = sline_3_f_y(new_idx)
sline_3_z_fine = sline_3_f_z(new_idx)

points = np.array([sline_3_x_fine, sline_3_y_fine]).T.reshape(-1, 1, 2)
segments = np.concatenate([points[:-1], points[1:]], axis=1)

fig = plt.figure()
ax = fig.add_subplot(111)

# norm = plt.Normalize(sline_3_z_fine.min(), sline_3_z_fine.max())
norm = plt.Normalize(0, 1)

lc = LineCollection(
    segments,
    cmap='mako_r',
    norm=norm,
)
lc.set_array(sline_3_z_fine[:-1])  # 各セグメントに色を割り当て
lc.set_linewidth(2)        # 線幅を細く（例: 1）
lc.set_alpha(0.7)
line = ax.add_collection(lc)
fig.colorbar(
  line, 
  label="abs(p(corr)[1])",
  ax=ax
)

ax.set_xlim(sline_3_x_fine.min(), sline_3_x_fine.max())
ax.set_ylim(sline_3_y_fine.min()*1.05, sline_3_y_fine.max()*1.05)
ax.set_xlabel("$^1$H Chemical Shift (ppm)")
ax.set_ylabel("p(ctr)[1]")
ax.invert_xaxis()

plt.savefig(
  "../../feOPLSc_sec3SLine.svg", 
  bbox_inches='tight',
)

# %%
