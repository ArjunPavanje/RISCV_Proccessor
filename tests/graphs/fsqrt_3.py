import matplotlib.pyplot as plt
import numpy as np

# =========================================
#  ACCURATE DIVISION ERROR DATA
# =========================================
accurate_data = {
    "0 NR (Exact Division)": {
        "Mean":   2.243487,
        "Median": 2.175587,
        "Worst":  3.394413
    },
    "1 NR (Exact Division)": {
        "Mean":   0.086995,
        "Median": 0.071506,
        "Worst":  0.174780
    },
    "2 NR (Exact Division)": {
        "Mean":   0.000167,
        "Median": 0.000083,
        "Worst":  0.000459
    }
}

# =========================================
#  APPROXIMATE DIVISION ERROR DATA
# =========================================
approx_data = {
    "0 NR (Approx Division)": {
        "Mean":   2.130737,
        "Median": 2.177044,
        "Worst":  3.396213
    },
    "1 NR (Approx Division)": {
        "Mean":   0.083932,
        "Median": 0.071605,
        "Worst":  0.174750
    },
    "2 NR (Approx Division)": {
        "Mean":   0.000161,
        "Median": 0.000189,
        "Worst":  0.000337
    }
}

# =========================================
# REQUIRED ORDER OF GROUPS
# =========================================
plot_order = [
    "0 NR (Approx Division)",
    "0 NR (Exact Division)",
    "1 NR (Approx Division)",
    "1 NR (Exact Division)",
    "2 NR (Approx Division)",
    "2 NR (Exact Division)"
]

# Fetch values in order
mean_errors = []
median_errors = []
worst_errors = []

for key in plot_order:
    if "Approx" in key:
        mean_errors.append(approx_data[key]["Mean"])
        median_errors.append(approx_data[key]["Median"])
        worst_errors.append(approx_data[key]["Worst"])
    else:
        mean_errors.append(accurate_data[key]["Mean"])
        median_errors.append(accurate_data[key]["Median"])
        worst_errors.append(accurate_data[key]["Worst"])

# X positions
x = np.arange(len(plot_order))
bar_width = 0.25

plt.figure(figsize=(14, 8))

# -------------------------
# PLOT 3 BARS PER GROUP
# -------------------------
plt.bar(x - bar_width, mean_errors, bar_width, label="Mean Error", color='#2E86AB')
plt.bar(x, median_errors, bar_width, label="Median Error", color='#A23B72')
plt.bar(x + bar_width, worst_errors, bar_width, label="Worst Error", color='#F18F01')

# Labels
plt.xticks(x, plot_order, rotation=20, ha='right', fontsize=9)
plt.ylabel("Percentage Error (%)", fontsize=12)
plt.title("Accurate vs Approximate FSQRT Error\nNewton-Raphson Iterations, Division (Double Precision)", fontsize=14, fontweight='bold')
plt.grid(axis='y', linestyle='--', alpha=0.3)
plt.legend(fontsize=10)

# Annotate bars
def label_bars(values, offset):
    for i, v in enumerate(values):
        plt.text(i + offset, v + max(values)*0.02, f"{v:.4f}%", fontsize=7, ha='center')

label_bars(mean_errors, -bar_width)
label_bars(median_errors, 0)
label_bars(worst_errors, bar_width)

plt.tight_layout()
plt.savefig("division_error_6x3_plot.png", dpi=300, bbox_inches='tight')
plt.show()

