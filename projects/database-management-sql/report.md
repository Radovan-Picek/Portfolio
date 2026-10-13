# Historical Purchase Order Valuation — SQL Case Study

## Overview

This project implements a SQL-based solution for reconstructing the historical net value of a purchase order using SAP purchasing data in DuckDB.

The solution combines current purchase order item data from `EKPO` with historical change records from `CDHDR` and `CDPOS` to calculate the net order value for a specified date.

## Files

- `database.duckdb` — DuckDB database containing the imported data.
- `01_create_database.sql` — Creates the database tables and imports the source CSV files.
- `02_exploratory_data_analysis.sql` — Exploratory queries used to inspect table structures, investigate relationships, and examine historical changes.
- `03_solution.sql` — Implements the `net_order_value()` macro and includes example calls.
- `data/` — Contains the original CSV files provided for the assignment and the database.

## Usage

The main function is:

`net_order_value(MANDT, EBELN, D_TIME)`

| Parameter | Description |
|---|---|
| `MANDT` | SAP client identifier |
| `EBELN` | Purchase order number |
| `D_TIME` | Reference date for the historical valuation |

The function returns the reconstructed total net order value for the specified purchase order and date.

## Approach

The solution follows three main steps:

1. **Database setup:** Create a DuckDB database, import the provided SAP tables, and inspect their structure.
2. **Historical reconstruction:** Join `CDHDR` and `CDPOS` to identify changes to `EKPO.NETWR` and retrieve relevant historical values for each purchase order item.
3. **Aggregation:** Sum the reconstructed item values to calculate the historical purchase order value.

When a matching historical value is unavailable, the solution falls back to the current `EKPO.NETWR` value.

## Data Quality and Limitations

The analysis identified inconsistencies between the current `EKPO` snapshot and the historical change records:

- A duplicate `(MANDT, EBELN, EBELP)` key was identified in `EKPO`. The duplicate record was inconsistent with the available change history and was treated as an anomalous record.
- Some item keys appeared in the change history but were absent from the current `EKPO` snapshot.
- Current item values and historical change records were not always consistent.

For historical reconstruction, available matching change-history records are treated as the primary source, with current item values used as a fallback when relevant history is unavailable. Unmatched item keys are not mapped using assumptions.

These limitations may affect the completeness of the reconstructed historical order value.