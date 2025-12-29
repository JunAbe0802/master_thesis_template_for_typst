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
Child
"""
score_c_df = pd.read_csv(
  "./score_c.txt",
  delimiter="\t",
)
# %%
replace_dict = {
  -2: 'Predictive Axis (10.9%)', 
  -1: 'Orthogonal Axis (9.1%)'
}
hues = score_c_df["Primary ID"].str[10]
# %%
fig = plt.figure(
  # figsize=(8,8)
)
ax = fig.add_subplot(111)
sns.scatterplot(
  x=score_c_df.iloc[:, -2].astype(float),
  y=score_c_df.iloc[:, -1].astype(float),
  hue=hues,
  hue_order=sorted(hues.unique()),
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

norm = plt.Normalize(sline_c_z_fine.min(), sline_c_z_fine.max())
lc = LineCollection(
    segments,
    cmap='mako_r',
    norm=norm,
    alpha=0.8      # 透明度を0.8に設定
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
# %%
replace_dict = {
  -2: 'Predictive Axis (10.9%)', 
  -1: 'Orthogonal Axis (9.1%)'
}
hues = score_m_df["Primary ID"].str[10]
# %%
fig = plt.figure(
  # figsize=(8,8)
)
ax = fig.add_subplot(111)
sns.scatterplot(
  x=score_m_df.iloc[:, -2].astype(float),
  y=score_m_df.iloc[:, -1].astype(float),
  hue=hues,
  hue_order=sorted(hues.unique()),
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

norm = plt.Normalize(sline_m_z_fine.min(), sline_m_z_fine.max())
lc = LineCollection(
    segments,
    cmap='mako_r',
    norm=norm,
    alpha=0.8      # 透明度を0.8に設定
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
