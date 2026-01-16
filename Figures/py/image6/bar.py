#%%
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
# %%
data = pd.read_csv(
  "./hbm_profile.csv",
  delimiter=",",
)
df = data.melt(
  id_vars=["PK"],
  value_vars=data.columns[5:],
  var_name="Metabolite",
  value_name="Concentration",
)
df["Concentration"] = df["Concentration"]*1000  # mM -> uM
# %%
metabolites = data.iloc[:,5:].mean(axis=0).sort_values(ascending=True)

# %%
fig = plt.figure(figsize=(9,6))
fig.subplots_adjust(wspace=1.2)
ax1 = fig.add_subplot(133)
ax1.barh(
  y=metabolites.index[:metabolites.size//3],
  width=metabolites.values[:metabolites.size//3],
  color="gray",
)
ax1.set_xscale('log')
ax1.set_xlim(0.001, 1000)
ax2 = fig.add_subplot(132)
ax2.barh(
  y=metabolites.index[metabolites.size//3:2*metabolites.size//3],
  width=metabolites.values[metabolites.size//3:2*metabolites.size//3],
  color="gray",
)
ax2.set_xscale('log')
ax2.set_xlim(0.001, 1000)
ax2.set_xlabel("Mean of concentration (mM)")
ax3 = fig.add_subplot(131)
ax3.barh(
  y=metabolites.index[2*metabolites.size//3:],
  width=metabolites.values[2*metabolites.size//3:],
  color="gray",
)
ax3.set_xscale('log')
ax3.set_xlim(0.001, 1000)
plt.savefig(
  "../../mean_concentration_barplot.svg",
  bbox_inches='tight',
  # dpi=600,
)
# %%
