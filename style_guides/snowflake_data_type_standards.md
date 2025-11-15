# Snowflake Data Type Standards

## 1. Purpose

To define a simple, consistent standard for selecting Snowflake data types across all projects.

---

## TL;DR — Data Types

- **Numeric:** use `NUMBER`
- **String:** use `VARCHAR`
- **Date/Time:** use `TIMESTAMP_NTZ` (stored in UTC)
- **Date (only):** use `DATE` when time-of-day is not being captured
- **Timezone-specific Date/Time:** use `TIMESTAMP_TZ` only when the original timezone must be preserved

---

## 2. Standard Snowflake Data Types — Additional Context

This section provides clarification on *why* each data type is preferred.

| Category        | Reason                                                   | Usage Notes |
|-----------------|----------------------------------------------------------|-------------|
| **NUMBER**      | `DECIMAL` and `NUMERIC` are synonyms of `NUMBER`.        | Use explicit precision/scale only when needed (e.g., financial data). |
| **VARCHAR**     | `STRING` and `TEXT` are synonyms of `VARCHAR`.           | Large max lengths are fine; choose smaller lengths only for clarity. |
| **TIMESTAMP_NTZ** | `DATETIME` and `TIMESTAMP` default to NTZ.             | Store timestamps in UTC. |
| **DATE**        | Represents a date without time-of-day.                   | Use only when time-of-day is irrelevant. |
| **TIMESTAMP_TZ** | Required only when timezone must be preserved.          | Use when original timezone is meaningful (e.g., audit fields). |

---

## 3. References

- [Snowflake Data Types](https://docs.snowflake.com/en/sql-reference/intro-summary-data-types)
- [Snowflake Table Design Considerations](https://docs.snowflake.com/en/user-guide/table-considerations)
