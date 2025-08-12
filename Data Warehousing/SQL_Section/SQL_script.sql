-- Dimension Tables

CREATE TABLE Time_Dim (
    time_key INTEGER PRIMARY KEY,
    date TEXT NOT NULL,
    day_of_week TEXT,
    month INTEGER,
    quarter INTEGER,
    year INTEGER NOT NULL
);

CREATE TABLE Customer_Dim (
    customer_id TEXT NOT NULL UNIQUE,
    customer_name TEXT,
    customer_address TEXT,
    city TEXT,
    country TEXT,
    demographics TEXT
);

CREATE TABLE Product_Dim (
    product_id TEXT NOT NULL UNIQUE,
    product_name TEXT,
    product_category TEXT,
    brand TEXT
);

-- Fact Table

CREATE TABLE Sales_Fact (
    product_key INTEGER,
    customer_key INTEGER,
    time_key INTEGER,
    sales_amount REAL NOT NULL,
    quantity_sold INTEGER NOT NULL,
    FOREIGN KEY (product_key) REFERENCES Product_Dim(product_key),
    FOREIGN KEY (customer_key) REFERENCES Customer_Dim(customer_key),
    FOREIGN KEY (time_key) REFERENCES Time_Dim(time_key),
);    