# Problem Statement

> **Portfolio version:** This SQL challenge has been adapted for public presentation. Company names, branding, and identifying information have been removed or generalized.

## Background

You are provided with several SAP tables containing purchase order information and historical change records.

The objective is to calculate the **total net value of a purchase order as of a specified date**, accounting for historical changes to item values and the addition of new items over time.

The current net order value is stored in the `EKPO` table. However, current data alone may not reflect the state of a purchase order on a historical date. The change-document tables must therefore be used to reconstruct historical values where necessary.

## Tasks

### 1. Database Setup

Create a database and import the provided CSV files into database tables.

The database should contain the supplied data from the following SAP tables:

- `EKPO`
- `EKKO`
- `CDHDR`
- `CDPOS`

### 2. Historical Net Order Value

Implement a reusable SQL macro, function, or equivalent solution that calculates the historical net value of a purchase order.

The solution should accept the following input parameters:

| Parameter | Description |
|---|---|
| `MANDT` | SAP client identifier |
| `EBELN` | Purchase order number |
| `D_DATE` | Reference date for the calculation |

A purchase order is uniquely identified by the composite key `MANDT` and `EBELN`.

The solution should return a single output value:

- `TOTAL_NETWR` — Total net value of the purchase order on the specified date.

## Data Sources

| Table | Description |
|---|---|
| `EKPO` | Purchasing Document Item — contains purchase order items and their net values |
| `EKKO` | Purchasing Document Header — contains purchase order header information |
| `CDHDR` | Change Document Header — contains information about recorded changes |
| `CDPOS` | Change Document Items — contains details of changed fields and their recorded values |

Additional information about SAP table structures can be found in the [LeanX SAP Table Reference](https://www.leanx.eu/en/sap/table/search).

## Requirements

The solution must address the following challenges:

### 1. Purchase Order Item Creation

Purchase order items may be added after an order is initially created. The calculation must account for which items existed on the specified reference date.

### 2. Historical Item Values

The current net value of an item (`EKPO.NETWR`) may differ from its value on the reference date.

Use `CDHDR` and `CDPOS` to identify relevant historical changes and reconstruct item values where necessary.

### 3. Reusability

The solution must accept the client, purchase order number, and reference date as input parameters so it can be executed for different purchase orders and dates.

### 4. Validation

Test the solution using multiple purchase orders and reference dates to check that it returns the expected output.

## Expected Output

The solution should return the total historical net order value (`TOTAL_NETWR`) for the specified SAP client, purchase order number, and reference date.

The calculation should reflect the purchase order's state on the requested date, accounting for both item creation and subsequent changes to item values.

## Software

Use any SQL tool to create the database, import the supplied data, explore the relevant tables, and implement and test the reusable solution.