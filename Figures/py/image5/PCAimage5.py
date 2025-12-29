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
"""
colostrum
"""
score1_df = pd.read_csv(
  "./score_1.txt",
  delimiter="\t",
)
# %%
replace_dict = {
  -2: 'Predictive Axis (3.3%)', 
  -1: 'Orthogonal Axis (13.0%)'
}
hues = score1_df["Class"].replace(
  {
    1: 'Se+',
    2: 'Se-',
  }
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
  palette='viridis',
  s=30,
  alpha=0.9,
  ax=ax
)
ax.set_xlabel(replace_dict[-2])
ax.set_ylabel(replace_dict[-1])
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
lc.set_linewidth(1)        # 線幅を細く（例: 1）
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
# %%
replace_dict = {
  -2: 'Predictive Axis (2.1%)', 
  -1: 'Orthogonal Axis (20.9%)'
}
hues = score2_df["Class"].replace(
  {
    1: 'Se+',
    2: 'Se-',
  }
)
# %%
fig = plt.figure(
  # figsize=(8,8)
)
ax = fig.add_subplot(111)
sns.scatterplot(
  x=score2_df.iloc[:, -2].astype(float),
  y=score2_df.iloc[:, -1].astype(float),
  hue=hues,
  hue_order=sorted(hues.unique()),
  palette='viridis',
  s=30,
  alpha=0.9,
  ax=ax
)
ax.set_xlabel(replace_dict[-2])
ax.set_ylabel(replace_dict[-1])
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
lc.set_linewidth(1)        # 線幅を細く（例: 1）
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
# %%
replace_dict = {
  -2: 'Predictive Axis (1.9%)', 
  -1: 'Orthogonal Axis (10.8%)'
}
hues = score3_df["Class"].replace(
  {
    1: 'Se+',
    2: 'Se-',
  }
)
# %%
fig = plt.figure(
  # figsize=(8,8)
)
ax = fig.add_subplot(111)
sns.scatterplot(
  x=score3_df.iloc[:, -2].astype(float),
  y=score3_df.iloc[:, -1].astype(float),
  hue=hues,
  hue_order=sorted(hues.unique()),
  palette='viridis',
  s=30,
  alpha=0.9,
  ax=ax
)
ax.set_xlabel(replace_dict[-2])
ax.set_ylabel(replace_dict[-1])
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
lc.set_linewidth(1)        # 線幅を細く（例: 1）
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
