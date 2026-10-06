# Problem Statement

> **Portfolio version:** This case study has been anonymized for public
> presentation. Company names, branding, and identifying information
> have been removed or generalized.

## Background

You are given a dataset containing characteristics and delinquency
information for **5,960 home-equity loans**.

A home-equity loan is a loan where the borrower's home equity is used
as collateral for the loan.

The objective is to develop a **Probability of Default (PD) scorecard**
for predicting loan default or serious delinquency.

---

## Dataset

The dataset contains the following variables:

| Variable | Description |
|---|---|
| `BAD` | Target variable: `1` = applicant defaulted or was seriously delinquent; `0` = applicant paid the loan |
| `LOAN` | Amount of the loan request |
| `MORTDUE` | Amount due on the existing mortgage |
| `VALUE` | Current property value |
| `REASON` | Reason for the loan: `DebtCon` = debt consolidation; `HomeImp` = home improvement |
| `JOB` | Occupational category |
| `YOJ` | Years at present job |
| `DEROG` | Number of major derogatory reports |
| `DELINQ` | Number of delinquent credit lines |
| `CLAGE` | Age of the oldest credit line, in months |
| `NINQ` | Number of recent credit inquiries |
| `CLNO` | Number of credit lines |
| `DEBTINC` | Debt-to-income ratio |

---

## Objectives

The analysis should address the following:

### 1. Variable Analysis

Analyze the explanatory power of the individual variables.

- Perform an initial assessment of the available variables.
- Identify potentially relevant predictors.
- Perform univariate analysis.
- Select a shortlist of candidate variables for further modelling.

### 2. Variable Selection

Propose an appropriate selection of variables for the final
Probability of Default scorecard.

The selection should consider the statistical and practical
relevance of the candidate predictors.

### 3. Categorical Variables

Analyze the categorical variables and their individual categories.

Where appropriate:

- merge similar categories;
- replace categorical values with meaningful numerical representations;
- investigate the relationship between categories and default risk.

### 4. Scorecard Development

Develop an optimal scoring function for predicting the probability
of default.

The primary modelling approach should be based on a statistical
scoring methodology suitable for credit-risk modelling.

### 5. Alternative Approaches

Optionally, alternative modelling approaches may be investigated,
including machine-learning methods.

Alternative models can be used to compare predictive performance
with the primary scorecard approach.

### 6. Model Performance

Evaluate the performance of the resulting scoring function.

The performance evaluation should provide an unbiased estimate of
out-of-sample predictive performance.

To achieve this, use an appropriate validation methodology, such as:

- a training and validation split; or
- cross-validation.

---

## Deliverable

Summarize the analysis and results in a final report.

The report should begin with an **executive summary** and then
provide details of the model development process.

The report should cover, as appropriate:

- data quality and exploratory analysis;
- variable selection;
- univariate analysis;
- treatment of categorical variables;
- model development;
- model performance;
- conclusions and key findings.

---

## Software

Any appropriate statistical or programming software may be used
for the analysis.