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
x = np.linspace(0, 3 * np.pi, 500)
y = np.sin(x)
dydx = np.cos(0.5 * (x[:-1] + x[1:]))  # first derivative

# Create a set of line segments so that we can color them individually
# This creates the points as a N x 1 x 2 array so that we can stack points
# together easily to get the segments. The segments array for line collection
# needs to be (numlines) x (points per line) x 2 (for x and y)
points = np.array([x, y]).T.reshape(-1, 1, 2)
segments = np.concatenate([points[:-1], points[1:]], axis=1)

fig, axs = plt.subplots(2, 1, sharex=True, sharey=True)

# Create a continuous norm to map from data points to colors
norm = plt.Normalize(dydx.min(), dydx.max())
lc = LineCollection(segments, cmap='viridis', norm=norm)
# Set the values used for colormapping
lc.set_array(dydx)
lc.set_linewidth(2)
line = axs[0].add_collection(lc)
fig.colorbar(line, ax=axs[0])

# Use a boundary norm instead
cmap = ListedColormap(['r', 'g', 'b'])
norm = BoundaryNorm([-1, -0.5, 0.5, 1], cmap.N)
lc = LineCollection(segments, cmap=cmap, norm=norm)
lc.set_array(dydx)
lc.set_linewidth(2)
line = axs[1].add_collection(lc)
fig.colorbar(line, ax=axs[1])

axs[0].set_xlim(x.min(), x.max())
axs[0].set_ylim(-1.1, 1.1)
plt.show()
"""
# %%
df = pd.read_csv(
  "./General List.txt",
  delimiter="\t",
).dropna(axis=1)
df
# %%
x = df["Primary ID"].to_numpy()
y = df["M18.p(ctr)[1]"].to_numpy()
z = df["M18.p(corr)[1]"].abs().to_numpy()

# x, y, zの補間で細かくする
num_points = 1000  # 細かくしたい点数
f_x = interp1d(np.arange(len(x)), x)
f_y = interp1d(np.arange(len(y)), y)
f_z = interp1d(np.arange(len(z)), z)

new_idx = np.linspace(0, len(x)-1, num_points)
x_fine = f_x(new_idx)
y_fine = f_y(new_idx)
z_fine = f_z(new_idx)

points = np.array([x_fine, y_fine]).T.reshape(-1, 1, 2)
segments = np.concatenate([points[:-1], points[1:]], axis=1)

fig = plt.figure()
ax = fig.add_subplot(111)

norm = plt.Normalize(z_fine.min(), z_fine.max())
lc = LineCollection(
    segments,
    cmap='turbo',
    norm=norm,
    alpha=0.8      # 透明度を0.8に設定
)
lc.set_array(z_fine[:-1])  # 各セグメントに色を割り当て
lc.set_linewidth(1)        # 線幅を細く（例: 1）
line = ax.add_collection(lc)
fig.colorbar(
  line, 
  label="abs(p(corr)[1])",
  ax=ax
)

ax.set_xlim(x_fine.min(), x_fine.max())
ax.set_ylim(y_fine.min(), y_fine.max())
ax.set_xlabel("$^1$H Chemical Shift (ppm)")
ax.set_ylabel("p(ctr)[1]")
ax.invert_xaxis()

plt.show()
# %%
