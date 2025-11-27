import matplotlib.pyplot as plt
import numpy as np

# Data extracted from the three images:
# Image 1 (0 NR iterations): Mean 1.828147%, Median 1.688748%, Worst 3.677767%
# Image 2 (1 NR iteration): Mean 2.170038%, Median 2.185847%, Worst 3.479993%
# Image 3 (2 NR iterations): Mean 2.130737%, Median 2.177044%, Worst 3.396213%

data = {
    "No Newton-Raphson": {"Mean": 2.697894, "Median": 3.288947, "Worst": 3.416908},
    "1 Iteration Newton-Raphson": {"Mean": 0.121895, "Median": 0.164036 , "Worst":  0.174913},
    "2 Iterations Newton-Raphson": {"Mean": 0.000275, "Median": 0.000473, "Worst": 0.000459}
}

configurations = list(data.keys())
mean_errors = [data[c]["Mean"] for c in configurations]
median_errors = [data[c]["Median"] for c in configurations]
worst_errors = [data[c]["Worst"] for c in configurations]

x = np.arange(len(configurations))

# Settings
bar_width = 0.25
bar_spacing = 0.03  # extra gap between bars

plt.figure(figsize=(12, 7))

# Plot bars with gaps + slight transparency
plt.bar(x - bar_width - bar_spacing, mean_errors, bar_width, alpha=0.8,
        label="Mean Absolute Error", color='#2E86AB')
plt.bar(x, median_errors, bar_width, alpha=0.8,
        label="Median Absolute Error", color='#A23B72')
plt.bar(x + bar_width + bar_spacing, worst_errors, bar_width, alpha=0.8,
        label="Worst Case Error", color='#F18F01')

# Labels & style
plt.xticks(x, configurations, fontsize=10)
plt.ylabel("Percentage Error (%)", fontsize=12)
plt.xlabel("Newton-Raphson Configuration", fontsize=12)
plt.title("Optimized Division Error Analysis:\nNewton-Raphson Iteration Impact", fontsize=14, fontweight='bold')
plt.legend(fontsize=10, loc='upper right')
plt.grid(axis='y', linestyle='--', alpha=0.4)

# Add value labels on top of bars
for i, (mean, median, worst) in enumerate(zip(mean_errors, median_errors, worst_errors)):
    plt.text(i - bar_width - bar_spacing, mean + 0.08, f'{mean:.4f}%',
             ha='center', va='bottom', fontsize=9)
    plt.text(i, median + 0.08, f'{median:.4f}%',
             ha='center', va='bottom', fontsize=9)
    plt.text(i + bar_width + bar_spacing, worst + 0.08, f'{worst:.4f}%',
             ha='center', va='bottom', fontsize=9)

plt.ylim(0, max(worst_errors) * 1.15)
plt.tight_layout()

plt.savefig("newton_raphson_error_comparison.png", dpi=300, bbox_inches='tight')
plt.show()

