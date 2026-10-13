# Recipe Site Traffic — Task Assignment

> **Portfolio version:** This assignment has been adapted and translated into English for public presentation. Original company branding and identifying information have been removed or generalized.

## Problem Statement

A recipe website wants to increase website traffic by selecting recipes that are likely to attract visitors when featured on its homepage. The objective is to develop a binary classification model that predicts whether a recipe will generate high traffic based on its available characteristics.

The primary goal is to **identify at least 80% of all recipes that would generate high traffic (recall ≥ 80%)**. Subject to this constraint, the model should **maximize precision**, minimizing the number of recipes predicted to generate high traffic that do not actually do so. This approach aims to capture most high-traffic opportunities while avoiding unnecessary homepage placements.

## Objectives

- Validate and clean the dataset, documenting data quality issues and preprocessing decisions.
- Perform exploratory data analysis to investigate recipe characteristics and their relationship with website traffic.
- Prepare the data for binary classification modeling.
- Develop a baseline logistic regression model and a comparison model using XGBoost.
- Evaluate and compare model performance using appropriate classification metrics.
- Select a classification threshold using validation data to achieve **at least 80% recall while maximizing precision**.
- Evaluate the selected models and thresholds on a held-out test set.
- Define a business metric for monitoring the effectiveness of homepage recipe selection and provide recommendations based on the results.

## Dataset

The dataset contains recipe-level information and an indicator of whether a recipe generated high website traffic when featured on the homepage.

| Variable | Description |
|---|---|
| `recipe` | Unique numeric identifier of the recipe |
| `calories` | Number of calories |
| `carbohydrate` | Amount of carbohydrates in grams |
| `sugar` | Amount of sugar in grams |
| `protein` | Amount of protein in grams |
| `category` | Recipe category |
| `servings` | Number of servings |
| `high_traffic` | Indicates whether the recipe generated high website traffic |

## Deliverables

- **Python source code:** Data validation, preprocessing, exploratory analysis, model development, threshold selection, and model evaluation.
- **Business presentation:** A concise presentation summarizing the business problem, key findings, model performance, business KPI, and recommendations for homepage recipe selection.