# %%
import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
# %%
all_df = pd.read_csv(
  "./formulaOrBreastMilk.csv", 
)
sampleList = pd.read_csv(
  "./MC_thesis_sampleList.csv",
  index_col=None,
  header=0,
)
sampleList = sampleList.drop_duplicates().reset_index(drop=True)
mc_df = all_df.merge(
  sampleList,
  left_on="cohortID",
  right_on="cohortID",
  how="inner",
)
mc_df["secretor"] = mc_df["secretor"].map(
  {"sec": "Se+", "non-sec": "Se-"}
)
mc_df = all_df.merge(
  sampleList,
  left_on="cohortID",
  right_on="cohortID",
  how="inner",
)
mc_df = mc_df[
  (mc_df["month"] == 0) |
  (mc_df["month"] == 1) |
  (mc_df["month"] == 4) |
  (mc_df["month"] == 8)
].reset_index(drop=True)
mc_df["secretor"] = mc_df["secretor"].map(
  {"sec": "Se+", "non-sec": "Se-"}
)
mc_df["type"] = mc_df["type"].map(
  {
    "breastMilk": "Breast Milk", 
    "formula": "Formula",
    "both": "Combination",
    "other": "Other",
  }
)
# %%
sns.set_context("notebook")
fig = plt.figure(figsize=(8, 5))
ax1 = fig.add_subplot(121)
sns.countplot(
  data=mc_df[mc_df['secretor'] == "Se+"],
  x='month',
  hue='type',
  ax=ax1,
)
ax1.set_title(f'Secretor type: Se+')
ax1.set_xlabel('Month')
ax1.set_ylabel('Count')
ax1.legend(
  loc="upper right",
  # bbox_to_anchor=(0, -0.3),
  handlelength=0.8,
  handletextpad=0.2,
  borderaxespad=0.2,
  borderpad=0.4,
  columnspacing=0.5,
)

ax2 = fig.add_subplot(122)
sns.countplot(
  data=mc_df[mc_df['secretor'] == "Se-"],
  x='month',
  hue='type',
  ax=ax2,
)
ax2.set_title(f'Secretor type: Se-')
ax2.set_xlabel('Month')
ax2.set_ylabel('Count')
ax2.legend_.remove()
plt.tight_layout()
plt.savefig(
  "../../nutrients.svg",
)
# %%
