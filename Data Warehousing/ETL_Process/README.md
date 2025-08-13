# Retail Data Warehouse ETL Process

This project implements an Extract, Transform, Load (ETL) pipeline for retail sales data, creating a data warehouse using SQLite. The process handles online retail transaction data and creates a dimensional model suitable for business analytics.

## Project Structure

```
ETL_Process/
├── etl_retail.ipynb    # Main ETL process notebook
├── retail_dw.db        # SQLite database (created during execution)
└── raw/
    └── Online Retail.xlsx  # Source data file
```

## Requirements

- Python 3.x
- Required packages:
  - pandas
  - openpyxl (for Excel file handling)
  - sqlite3 (included in Python standard library)

## Data Model

The data warehouse follows a star schema with the following structure:

### Fact Table: SalesFact
- sale_id (Primary Key)
- invoice_no
- customer_id (Foreign Key to CustomerDim)
- date_id (Foreign Key to TimeDim)
- quantity
- unit_price
- total_sales

### Dimension Tables:

#### CustomerDim
- customer_id (Primary Key)
- total_purchases
- country
- transaction_count

#### TimeDim
- date_id (Primary Key)
- date
- year
- month
- day_of_week

## ETL Process Details

### 1. Extraction
- Reads data from 'Online Retail.xlsx'
- Validates required columns
- Handles missing values
- Converts data types
- Performs basic data validation

### 2. Transformation
- Removes invalid records (negative quantities, zero prices)
- Calculates total sales
- Creates customer dimension summary
- Filters data for the last year (from August 12, 2025)
- Prepares dimensional model structure

### 3. Loading
- Creates SQLite database (retail_dw.db)
- Implements star schema
- Loads transformed data into fact and dimension tables
- Establishes proper relationships between tables
- Ensures data integrity with primary and foreign keys

## How to Run

1. Ensure all requirements are installed:
```python
pip install pandas openpyxl
```

2. Place your 'Online Retail.xlsx' file in the raw/ directory

3. Open and run etl_retail.ipynb in sequential order:
   - Run installation cell
   - Execute extraction function
   - Execute transformation function
   - Execute loading function
   - Run the complete ETL process

## Data Validation

The ETL process includes several validation steps:
- Checks for required columns
- Removes records with missing CustomerID
- Validates numeric values (Quantity, UnitPrice)
- Ensures proper data types
- Handles outliers and invalid data

## Output

After successful execution:
- Creates retail_dw.db SQLite database
- Generates three tables: SalesFact, CustomerDim, TimeDim
- Provides execution summary with row counts
- Displays data quality metrics

## Error Handling

The process includes comprehensive error handling:
- File not found errors
- Data validation errors
- Database connection errors
- Transaction rollback on failures
- Detailed error messages

## Notes

- The ETL process is idempotent (can be run multiple times)
- Existing tables are dropped and recreated on each run
- Data is filtered for the last year from August 12, 2025
- All database operations use transactions for data integrity

## Query Examples

After loading the data, you can run analyses such as:

```sql
-- Total sales by country
SELECT 
    c.country,
    COUNT(DISTINCT s.customer_id) as num_customers,
    SUM(s.total_sales) as total_sales
FROM SalesFact s
JOIN CustomerDim c ON s.customer_id = c.customer_id
GROUP BY c.country
ORDER BY total_sales DESC;

-- Sales trends by month
SELECT 
    t.month,
    SUM(s.total_sales) as monthly_sales
FROM SalesFact s
JOIN TimeDim t ON s.date_id = t.date_id
GROUP BY t.month, t.year
ORDER BY t.year, t.date;
```
