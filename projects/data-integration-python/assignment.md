# Problem Statement

> **Portfolio version:** This assignment has been adapted for public presentation. Company names, branding, and identifying information have been removed or generalized.

A health and wellness company collects data from wearable devices, health applications, supplement usage records, experiments, and user profiles.

The data is stored across several separate datasets. The goal of this task is to clean and integrate these data sources into a single dataset that provides a comprehensive view of users' daily health metrics and supplement usage.

## Task

Four datasets containing approximately four months of data are provided:

* `user_health_data.csv` — daily health metrics, habits, and wearable-device measurements.
* `supplement_usage.csv` — supplement intake records for individual users.
* `experiments.csv` — metadata about experiments associated with supplement usage.
* `user_profiles.csv` — demographic and contact information for users.

The task is to implement a Python function that cleans and merges these datasets into a single pandas DataFrame.

The function should be called as follows:

```python
merge_all_data(
    'user_health_data.csv',
    'supplement_usage.csv',
    'experiments.csv',
    'user_profiles.csv'
)
```

The function must return a DataFrame containing one row for each daily entry, combining health metrics and supplement usage where available.

## Data Requirements

The resulting DataFrame must contain the following columns:

| Column               | Description                                                                                                                                              |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `user_id`            | Unique identifier for each user. Must not contain missing values.                                                                                        |
| `date`               | Date of the health record or supplement intake. Must not contain missing values.                                                                         |
| `email`              | Contact email of the user. Must not contain missing values.                                                                                              |
| `user_age_group`     | User's age group: `Under 18`, `18-25`, `26-35`, `36-45`, `46-55`, `56-65`, `Over 65`, or `Unknown` when age is missing.                                  |
| `experiment_name`    | Name of the experiment associated with the supplement usage. Missing values are permitted when only health data is available.                            |
| `supplement_name`    | Name of the supplement taken on that day. Multiple entries are permitted. Days without supplement intake should be represented as `No intake`.           |
| `dosage_grams`       | Supplement dosage in grams. Dosages recorded in milligrams must be converted to grams. Missing values are permitted when there was no supplement intake. |
| `is_placebo`         | Boolean indicator showing whether the supplement was a placebo. Missing values are permitted when there was no supplement intake.                        |
| `average_heart_rate` | Average heart rate recorded by the wearable device.                                                                                                      |
| `average_glucose`    | Average glucose level recorded by the wearable device.                                                                                                   |
| `sleep_hours`        | Total sleep duration in hours for the night preceding the daily record.                                                                                  |
| `activity_level`     | Activity level score between 0 and 100.                                                                                                                  |

Missing values should use the default Python/pandas representation unless otherwise specified.

## Expected Output

The completed function should return a single pandas DataFrame containing the integrated and cleaned data from all four source datasets.

The final output should:

* contain the required columns with the specified names;
* correctly merge the available user, health, supplement, and experiment information;
* apply the required data transformations and type conversions;
* preserve daily health records, including days without supplement intake.
