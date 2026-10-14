# Forecasting Electricity Grid System Imbalance

## Problem Statement

> **Portfolio version:** This forecasting assignment has been adapted and translated into English for public presentation. Company names, branding, and identifying information have been removed or generalized.

## Background

You are provided with historical time-series data describing electricity grid system imbalance, recorded at 15-minute intervals.

The objective is to develop a suitable statistical forecasting model capable of predicting whether the system imbalance will be positive or negative at two forecast horizons: one and two time steps ahead.

The task involves preparing and exploring the data, using appropriate visualizations to identify relevant temporal patterns, investigating and comparing candidate forecasting models, and selecting a model that achieves good predictive performance.

## Requirements

The analysis should preserve the chronological order of observations and use a time-based train-test split. Model development and selection should be performed using the training data, with the test data reserved for out-of-sample evaluation.

Model performance should be assessed primarily using sign prediction accuracy, reflecting the proportion of forecasts that correctly predict whether the system imbalance is positive or negative. The final results should be interpreted, including the limitations of the selected model and potential opportunities for improvement.

## Data Source

The dataset is provided in `grid_data.xlsx` and contains 8,833 observations of system imbalance.

| Variable | Description |
|---|---|
| Day | Day associated with the observation |
| Time | Time of the observation |
| System imbalance (MWh) | Recorded electricity grid system imbalance |

The observations are recorded at 15-minute intervals, corresponding to 96 observations per day.

## Expected Output

A documented forecasting solution that includes relevant data exploration and visualizations, model selection, out-of-sample evaluation for both forecast horizons, and a discussion of the results and potential improvements.

## Software

Use an appropriate statistical programming environment and relevant libraries for time-series analysis, forecasting, and visualization.