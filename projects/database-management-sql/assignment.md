# Problem Statement

> **Portfolio version:** This SQL challenge has been adapted for public presentation. Company names, branding, and identifying information have been removed or generalized.

## Background

You are given several SAP tables containing purchase order information and historical change records.

The objective is to calculate the **total net value of a purchase order as of a specified date**, accounting for changes to item values and the addition of new items over time.

The current net order value is stored in the `EKPO` table. However, the current data alone may not reflect the state of the purchase order on a historical date. Change-document tables must therefore be used to reconstruct historical item values where necessary.

---

## Task

Implement a reusable SQL query, function, or procedure that calculates the historical net value of a purchase order.

The solution should accept the following input parameters:

| **Parameter** | **Description** |
|---|---|
| `MANDT` | SAP client identifier |
| `EBELN` | Purchase order number |
| `D_DATE` | Reference date for the calculation |

A purchase order is uniquely identified by the composite key `MANDT` and `EBELN`.

The solution should return a single output value:

- `TOTAL_NETWR` — Total net value of the purchase order on the specified date.

## Data Sources

The following SAP tables are provided as potential data sources:

| **Table** | **Description** |
|---|---|
| `EKPO` | Purchasing Document Item — contains purchase order items and their net values |
| `EKKO` | Purchasing Document Header — contains purchase order header information |
| `CDHDR` | Change Document Header — contains information about recorded changes |
| `CDPOS` | Change Document Items — contains details of changed fields and their recorded values |
| `EBAN` | Purchase Requisition Items — contains purchase requisition information |
| `LFA1` | Vendor Master (General Section) — contains general supplier information |

Not all tables are necessarily required to solve the task.

Additional information about SAP table structures can be found at [LeanX — SAP Table Reference](https://www.leanx.eu/en/sap/table/search).

## Requirements

The solution must address the following challenges:

### 1. Purchase Order Item Creation

Purchase order items may be added after the initial creation of an order. The calculation must account for which items existed on the specified reference date.

### 2. Historical Item Values

The current net value of an item (`EKPO.NETWR`) may differ from its value on the reference date.

The change-document tables `CDHDR` and `CDPOS` must be used to identify historical changes and reconstruct item values where necessary.

## Expected Output

The solution should return the total historical net order value (`TOTAL_NETWR`) for the specified SAP client, purchase order number, and reference date.

The calculation should reflect the purchase order's state on the requested date, accounting for both item creation and subsequent changes to item values.

## Software

Any appropriate SQL environment may be used to implement the solution.