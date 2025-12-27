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
score_c = score_df[:, 0].tolist()
score_c = [i[10] for i in score_c]
palette = plt.get_cmap('Set1')
color_dict = {list(set(score_c))[i]: palette(i) for i in range(len(set(score_c)))}
score_c = [color_dict[i] for i in score_c]

# %%
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.scatter(
  score_x, score_y, score_z, 
  c=score_c, 
  marker='o'
)
ax.set_xlabel('PC1')
ax.set_ylabel('PC2')
ax.set_zlabel('PC3')

plt.show()
# %%
score_c = [i[10] for i in score_df[:, 0].tolist()]

replace_dict = {-1: 'PC3', -2: 'PC2', -3: 'PC1'}
for group in itertools.combinations([-3, -2, -1], 2):
  print(group)
  fig = plt.figure(figsize=(8,8))
  ax = fig.add_subplot(111)
  # ax.scatter(
  #   score_df[:, group[0]].astype(float),
  #   score_df[:, group[1]].astype(float),
  #   c=score_c,
  #   s=10,
  #   marker='o'
  # )
  sns.scatterplot(
    x=score_df[:, group[0]].astype(float),
    y=score_df[:, group[1]].astype(float),
    hue=score_c,
    palette="tab10",
    ax=ax
  )
  ax.set_xlabel(replace_dict[group[0]])
  ax.set_ylabel(replace_dict[group[1]])
  plt.show()



# %%
# 3D画像の読み込み
loading_df = np.loadtxt('./loading1.txt', delimiter="\t", skiprows=1, dtype=str)
loading_x = loading_df[:, -3].astype(float)
loading_y = loading_df[:, -2].astype(float)
loading_z = loading_df[:, -1].astype(float)
labels = loading_df[:, 0]  # 化合物名

# 色を各点ごとに割り当て
cmap = plt.get_cmap('')
colors = [cmap(i % 20) for i in range(len(loading_x))]
# %%

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.scatter(
  loading_x, loading_y, loading_z,
  c=colors,
  label=labels,
  s=10,
  marker='o'
)
ax.set_xlabel('PC1 (33.8%)')
ax.set_ylabel('PC2 (13.1%)')
ax.set_zlabel('PC3 (8.1%)')

# annotation
for i in range(len(loading_x)):
  ax.text(loading_x[i], loading_y[i], loading_z[i], labels[i], size=8)

plt.show()
# %%
score_c = [i[10] for i in score_df[:, 0].tolist()]
replace_dict = {
  -1: 'PC3 (8.1%)', 
  -2: 'PC2 (13.1%)', 
  -3: 'PC1 (33.8%)'
}

fig = plt.figure(figsize=(18,18))
gs = fig.add_gridspec(
  3, 3,
  wspace=0.25,
  hspace=0.25,
)
for group in itertools.combinations([-3, -2, -1], 2):
  # print(group)
  
  ax = fig.add_subplot(gs[(group[0]+len(replace_dict)), (group[1]+len(replace_dict))])
  # ax.scatter(
  #   loading_df[:, group[0]].astype(float),
  #   loading_df[:, group[1]].astype(float),
  #   s=10,
  #   marker='o'
  # )
  sns.scatterplot(
    x=loading_df[:, group[1]].astype(float),
    y=loading_df[:, group[0]].astype(float),
    s=40,
    marker='o',
    color='green',
    ax=ax
  )
  ax.set_xlabel(replace_dict[group[1]])
  ax.set_ylabel(replace_dict[group[0]])
  # ax.set_ylabel("")
  # ax.set_xlabel("")

  texts = []
  for i in range(len(loading_df)):
    texts.append(
      ax.text(
        loading_df[i, group[1]].astype(float),
        loading_df[i, group[0]].astype(float),
        loading_df[i, 0],
        size=8
      )
    )
  adjust_text(texts, ax=ax)
  
  ax = fig.add_subplot(gs[(group[1]+len(replace_dict)), (group[0]+len(replace_dict))])
  sns.scatterplot(
    x=score_df[:, group[0]].astype(float),
    y=score_df[:, group[1]].astype(float),
    hue=score_c,
    s=30,
    alpha=0.6,
    palette="jet_r",
    ax=ax
  )
  ax.legend_.remove()
  ax.set_xlabel(replace_dict[group[0]])
  ax.set_ylabel(replace_dict[group[1]])
  # ax.set_xlabel("")
  # ax.set_ylabel("")

for i in range(len(replace_dict)):
  ax = fig.add_subplot(gs[i, i])
  ax.text(
    0.5, 0.5, 
    replace_dict[i-len(replace_dict)], 
    ha='center', 
    va='center', 
    fontsize=30
  )
  ax.axis('off')

plt.savefig(
  '../bmPCA_timeCourse.png',
  bbox_inches='tight',
  dpi=600,
)
# %%
