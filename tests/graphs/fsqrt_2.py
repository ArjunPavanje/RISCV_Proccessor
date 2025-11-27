import matplotlib.pyplot as plt
import numpy as np

# Updated values from user:
data = {
    "No Newton-Raphson": {
        "Mean": 2.243487,
        "Median": 2.175587,
        "Worst": 3.394413
    },
    "1 Iteration Newton-Raphson": {
        "Mean": 0.086995,
        "Median": 0.071506,
        "Worst": 0.174780
    },
    "2 Iterations Newton-Raphson": {
        "Mean": 0.000167,
        "Median": 0.000083,
        "Worst": 0.000459
    }
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
plt.title("Floating-Point Square Root Error Analysis:\nNewton-Raphson Iteration Impact\n(Single Precision)", fontsize=14, fontweight='bold')
plt.legend(fontsize=10, loc='upper right')
plt.grid(axis='y', linestyle='--', alpha=0.4)

# Add value labels on top of bars
for i, (mean, median, worst) in enumerate(zip(mean_errors, median_errors, worst_errors)):
    plt.text(i - bar_width - bar_spacing, mean + (mean * 0.03 + 0.001),
             f'{mean:.4f}%', ha='center', fontsize=9)
    plt.text(i, median + (median * 0.03 + 0.001),
             f'{median:.4f}%', ha='center', fontsize=9)
    plt.text(i + bar_width + bar_spacing, worst + (worst * 0.03 + 0.001),
             f'{worst:.4f}%', ha='center', fontsize=9)

plt.ylim(0, max(worst_errors) * 1.20)
plt.tight_layout()

plt.savefig("newton_raphson_error_comparison.png", dpi=300, bbox_inches='tight')
plt.show()
