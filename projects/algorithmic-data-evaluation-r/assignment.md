# Problem Statement

> **Portfolio version:** This interview assignment has been adapted and translated into English for public presentation. Company names, branding, and identifying information have been removed or generalized.

## Context

Imagine working with data from an application that tracks user activity. Based on a user's current state and several characteristics, the system must automatically determine the appropriate next action.

The task is to develop an **R algorithm** that assigns an action to every user record.

The input data is provided in:

`algorithmic_task_dataset.csv`

## Variables

| Variable              | Description                                   |
| --------------------- | --------------------------------------------- |
| `user_id`             | Unique user identifier                        |
| `age`                 | User's age                                    |
| `score`               | User's current score                          |
| `answer_a`            | Response to question A (`YES` / `NO`)         |
| `answer_b`            | Response to question B (`YES` / `NO`)         |
| `days_since_activity` | Number of days since the user's last activity |
| `status`              | User status (`active` / `inactive`)           |

## Objective

Create an R script that assigns each user one of the following actions:

* `URGENT`
* `REVIEW`
* `CONTACT`
* `REMINDER`
* `STANDARD`
* `NO_ACTION`

The algorithm must also provide a **reason explaining why the action was selected**.

## Decision Rules

### 1. NO_ACTION

If the user is `inactive`, no further action should be performed.

**Action:** `NO_ACTION`

This rule has the **highest priority**.

### 2. REVIEW

An active user should be flagged for manual review if:

* any value required for the decision is missing; or
* any value is outside its expected range.

Valid values are:

| Variable              | Valid range / values |
| --------------------- | -------------------- |
| `age`                 | 18–100               |
| `score`               | 0–100                |
| `days_since_activity` | 0 or greater         |
| `answer_a`            | `YES` / `NO`         |
| `answer_b`            | `YES` / `NO`         |

**Action:** `REVIEW`

`REVIEW` has higher priority than all remaining actions.

### 3. URGENT

An active, valid user should receive `URGENT` if at least one of the following conditions is satisfied:

* `score >= 90` **and** `answer_b == "YES"`
* `score >= 80` **and** `age >= 65`

**Action:** `URGENT`

### 4. CONTACT

If the user does not belong to any previous category and at least one of the following conditions is satisfied:

* `score >= 70`
* `answer_a == "YES"` **and** `days_since_activity > 30`

**Action:** `CONTACT`

### 5. REMINDER

If the user does not belong to any previous category and:

* `days_since_activity > 30`

**Action:** `REMINDER`

### 6. STANDARD

All remaining valid cases should receive:

**Action:** `STANDARD`

## Rule Priority

If multiple rules are satisfied simultaneously, the rule with the highest priority must be applied.

Priority from highest to lowest:

```text
NO_ACTION
    ↓
REVIEW
    ↓
URGENT
    ↓
CONTACT
    ↓
REMINDER
    ↓
STANDARD
```

## Required Output

The R script should:

1. Process the input dataset.
2. Validate the relevant input values.
3. Apply the decision rules in the specified priority order.
4. Produce a result for every user.
5. Include at least the following columns:

| Column    | Description                         |
| --------- | ----------------------------------- |
| `user_id` | User identifier                     |
| `action`  | Assigned action                     |
| `reason`  | Explanation for the assigned action |

Any ambiguous, problematic, or potentially inconsistent aspects of the input data or decision rules should also be documented.

## Deliverables

The completed project should contain:

1. An R script implementing the algorithmic evaluation.
2. A resulting table containing user IDs, assigned actions, and reasons.
3. A short report documenting the data assessment, code structure, and algorithm logic.

## Expected Skills

The assignment evaluates practical skills in:

* R programming
* Data validation
* Conditional logic and rule-based algorithms
* Data processing
* Functional and modular programming
* Handling missing and invalid values
* Reproducible analytical scripting
* Communicating algorithmic decisions clearly
