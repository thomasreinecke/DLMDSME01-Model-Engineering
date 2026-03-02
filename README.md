# DLMDSME01: Model Engineering — Case Study

This repository contains the technical implementation for the **DLMDSME01 Case Study: Detecting Fraudulent Credit Card Transactions**. 

The project focuses on building robust, leakage-safe machine learning pipelines to handle extreme class imbalance (0.173% fraud rate). It evaluates a linear benchmark (Logistic Regression) against an ensemble challenger (XGBoost), utilizing synthetic oversampling (SMOTE) and threshold-moving techniques to optimize business-relevant metrics.

## 🚀 Quick Start

This project uses a `Makefile` to ensure a transparent and reproducible environment setup.

### 1. Setup the Environment
Run the following command to create a virtual environment (`.venv`) and install all required dependencies (including `scikit-learn`, `imblearn`, and `xgboost`):
```bash
make install
```

### 2. Run the Analysis
To start the Jupyter Notebook server and explore the implementation:
```bash
make run-jupyter
```
*Note: The notebook is configured to automatically download the ULB dataset from OpenML on the first run.*

## Repository Structure

*   `notebook.ipynb`: The primary Jupyter Notebook containing data ingestion, EDA, leakage-safe pipeline construction, hyperparameter optimization, and threshold analysis.
*   `Makefile`: Automation script for environment setup and execution.
*   `requirements.txt`: Python package dependencies.
*   `references.bib`: BibTeX file containing all academic sources cited in the report.
*   `images/`: Directory containing exported visualizations used in the final report:
    *   `confusion_matrix.png`: Log-scaled matrix for the optimal model.
    *   `pr_curve.png`: Precision-Recall curve highlighting the AP score.
*   `model_results.csv`: Exported metrics from the cross-validation and test phases.

## Key Methodology
*   **Leakage Prevention:** Use of `imblearn` pipelines to ensure that SMOTE oversampling is applied strictly within cross-validation training folds.
*   **Metrics:** Focused on Precision-Recall trade-offs rather than Accuracy, given the 0.173% fraud incidence.
*   **Threshold-Moving:** Quantitative analysis of how shifting decision boundaries affects operational costs (False Positives vs. False Negatives).
