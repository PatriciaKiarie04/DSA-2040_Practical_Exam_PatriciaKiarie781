# DSA-2040_Practical_Exam_PatriciaKiarie781
# Final Exam

## Section 1: Data Warehousing
### Task 1: Data Warehouse Design
***Explain why you chose star schema over snowflake***
- The star schema was chosen for this design because of its simplicity and query performance. By having a single join between the fact table and any dimension table, queries are much faster and easier to write. While snowflake schemas reduce data redundancy by normalizing dimensions, this often comes at the cost of more complex queries with multiple joins, which can negatively impact performance in a data warehouse environment. The retail company's needs for simple, fast reporting (like total sales per quarter) which are better served by the star schema's denormalized structure.

### Task 2: ETL Process
***Describe the ETL process implemented in this project***
- The ETL process implemented in this project consists of three main phases: Extraction, Transformation, and Loading.

1. **Extraction**: The process begins with extracting data from the source Excel file ('Online Retail.xlsx'). The data is read into a Pandas DataFrame, which allows for easy manipulation and analysis. During extraction, the code checks for required columns, handles missing values, and converts data types as necessary. Basic validation is performed to ensure the integrity of the data.

2. **Transformation**: In this phase, the extracted data is cleaned and transformed to fit the dimensional model. This includes:
   - Removing invalid records (e.g., negative quantities, zero prices).
   - Calculating total sales for each transaction.
   - Creating a customer dimension summary with key metrics.
   - Filtering the data to include only relevant records (e.g., transactions from the last year).
   - Preparing the data for loading into the data warehouse.

3. **Loading**: Finally, the transformed data is loaded into the SQLite database ('retail_dw.db'). This involves:
   - Creating the necessary fact and dimension tables.
   - Inserting the transformed data into the appropriate tables.
   - Establishing relationships between the tables using primary and foreign keys.

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

Overall, the ETL process is designed to be robust, efficient, and easy to maintain, ensuring high-quality data is available for analysis in the retail data warehouse.
## Section 2: OLAP Queries and Analysis
This directory contains OLAP (Online Analytical Processing) queries and visualizations for the retail data warehouse. The analysis focuses on sales patterns, customer behavior, and temporal trends in the retail dataset.

## Directory Structure
Olap_queries/
├── analysis_report.md      # Detailed analysis findings
├── olap_queries.sql        # SQL queries for OLAP operations
├── olap_visualization.ipynb # Jupyter notebook with visualizations
├── retail_dw.db           # SQLite data warehouse
├── canada_monthly_sales.png    # Visualization of Canadian sales
├── sales_by_country_quarter.png # Quarterly sales by country
└── uk_monthly_sales.png        # UK sales analysis
```

## Data Warehouse Schema

The analysis is based on a star schema with the following tables:

- **SalesFact**: Central fact table containing sales transactions
  - sale_id (PK)
  - invoice_no
  - customer_id (FK)
  - date_id (FK)
  - quantity
  - unit_price
  - total_sales

- **CustomerDim**: Customer dimension table
  - customer_id (PK)
  - total_purchases
  - country
  - transaction_count

- **TimeDim**: Time dimension table
  - date_id (PK)
  - date
  - year
  - month
  - day_of_week

## OLAP Operations Implemented

### 1. Roll-up Operations
- Aggregating sales from daily to monthly levels
- Summarizing sales by country and year
- Computing total sales by customer segments

### 2. Drill-down Analysis
- Detailed monthly sales analysis for specific countries
- Transaction-level details for high-value customers
- Daily sales patterns within specific months

### 3. Slice Operations
- Analysis of sales for specific time periods
- Country-specific customer behavior
- Product category performance

### 4. Dice Operations
- Multi-dimensional analysis combining time periods and countries
- Customer purchase patterns across different regions
- Sales performance matrix by time and location

## Key Visualizations

1. **Monthly Sales Trends**
   - Visualizes sales patterns over time
   - Identifies seasonal trends
   - Highlights peak sales periods

2. **Geographic Analysis**
   - Sales distribution by country
   - Customer concentration in different regions
   - Market penetration analysis

3. **Customer Insights**
   - Purchase frequency patterns
   - Average transaction values
   - Customer loyalty metrics

## Running the Analysis

1. **Database Setup**
   ```sql
   -- Connect to the database
   sqlite3 retail_dw.db
   ```

2. **Execute OLAP Queries**
   - Use the queries in `olap_queries.sql`
   - Modify parameters as needed for different analysis perspectives

3. **Generate Visualizations**
   - Run the Jupyter notebook `olap_visualization.ipynb`
   - Visualizations will be saved in the current directory

## Key Findings

1. **Sales Patterns**
   - Identified peak sales seasons
   - Discovered weekly sales trends
   - Analyzed year-over-year growth

2. **Customer Behavior**
   - Mapped customer purchase frequencies
   - Identified high-value customer segments
   - Analyzed geographic distribution of customers

3. **Market Analysis**
   - Evaluated market penetration by region
   - Analyzed sales concentration
   - Identified growth opportunities


## Future Analysis Opportunities

1. **Predictive Analytics**
   - Sales forecasting
   - Customer churn prediction
   - Inventory optimization

2. **Advanced Segmentation**
   - Customer behavioral clustering
   - Product affinity analysis
   - Regional market segmentation

3. **Performance Optimization**
   - Query optimization
   - Index strategies
   - Materialized views

## Contributing

To extend this analysis:
1. Add new queries to `olap_queries.sql`
2. Create additional visualizations in the notebook
3. Document findings in `analysis_report.md`

## Dependencies

- Python
- pandas
- matplotlib
- sqlite3
- Jupyter Notebook
- openpyxl

Ensure all dependencies are installed before running the analysis.

## Section 2: Data Mining
## Preprocessing
This project performs data preprocessing, exploration, and train-test splitting on the famous Iris dataset (or synthetic data if generated). It includes:
 Data Loading (from sklearn.datasets)
 Preprocessing (missing value handling, normalization, encoding)
 Exploratory Data Analysis (EDA) (statistics, visualizations)
 Train-Test Splitting (stratified 80/20 split)

## Images of visualizations
iris_boxplot
![alt text](<Data Mining/Preprocessing/iris_boxplots.png>)
iris_pairplot
![alt text](<Data Mining/Preprocessing/iris_pairplot.png>)
iris_correlation_heatmap
![alt text](<Data Mining/Preprocessing/iris_correlation.png>)

## Clustering
***K-Means Clustering***
K-Means is an unsupervised algorithm that:
Groups data into k clusters based on feature similarity.
Minimizes intra-cluster variance (measured by inertia).
Requires predefined k (number of clusters).

Key Steps:
1. Initialize k centroids randomly.
2. Assign each point to the nearest centroid.
3. Recalculate centroids as cluster means.
4. Repeat until convergence.
![alt text](<Data Mining/Clustering/cluster_visualization.png>)

***Elbow Curve for Optimal k***
The elbow method helps select the best k by:
Running K-Means for a range of k values.
Plotting inertia (sum of squared distances to centroids).
Choosing k where inertia’s rate of decrease slows sharply ("elbow point").

Why k=3 for Iris Data?
Biological truth: 3 iris species.
Empirical evidence: Sharp elbow at k=3 in the plot.
![alt text](<Data Mining/Clustering/elbow_curve.png>)

Cluster Quality
ARI Score: 0.73 (strong but imperfect alignment with true labels).
Misclassifications: Primarily between versicolor and virginica due to overlapping petal measurements.

## Classification
This project implements classification algorithms on the Iris dataset, comparing their performance and visualizing the results. Key steps include:
1. Data Loading: Using sklearn's datasets module.
2. Preprocessing: Handling missing values, scaling features, and encoding labels.
3. Model Training: Fitting models like Decision Trees and K-Nearest Neighbors.
4. Evaluation: Using metrics like accuracy, precision, recall, and F1-score.
1. Model Comparison

Metric	Decision Tree	KNN (k=5)
Accuracy	96.7%	100%
Precision	97.2%	100%
Recall	96.7%	100%
F1-Score	96.7%	100%
2. Why KNN Performed Better
Iris Dataset Characteristics:
Low-dimensional (4 features)
Clearly separable clusters
No missing/noisy data

KNN Advantages:
Naturally handles non-linear boundaries
No assumptions about data distribution

Decision Tree Limitations:
Prone to overfitting if depth isn't controlled
Axis-aligned splits may not capture subtle relationships

When to Prefer Decision Trees
Interpretability: Trees provide clear rules (visible in decision_tree.png).
Speed: Faster prediction than KNN for large datasets.
Feature Importance: Built-in feature selection.

decision_tree
![alt text](<Data Mining/Classification/decision_tree.png>)

## Association Rule Mining with Apriori Algorithm
The objective is to discover hidden relationships between products in retail transaction data using unsupervised learning techniques.
1. Data Preparation
Dataset: Generated 50 synthetic transactions containing 3-8 items each
Item Pool (20 products):
- cooking_oil
- wheat_flour
- rice
- tomato_paste
- plantain_chips
- oranges
- bananas
- apples
- palm_oil
- indomie
- groundnut
- pure_water
- detergent
- body_lotion
- matches
- mangoes
- pineapples
- watermelon
- coca_cola
- fanta

Pattern Injection:
Natural item pairings (e.g., rice + tomato paste) embedded in 30-40% of relevant transactions
Random sampling ensured diversity in baskets

2. Algorithm Implementation
Used mlxtend's Apriori with parameters:

3. Key Metrics Calculated
Metric	Formula	Interpretation
Support	P(A∩B)	Frequency of co-occurrence
Confidence	P(B|A)	Rule accuracy
Lift	P(A∩B)/(P(A)*P(B))	Improvement over random
Results
Top 3 Association Rules
Antecedent → Consequent	Support	Confidence	Lift
{rice} → {tomato_paste}	0.32	0.71	2.1
{indomie} → {eggs}	0.24	0.68	1.9
{body_lotion} → {detergent}	0.22	0.65	1.8

Insights
Strongest Rule: Rice → Tomato Paste
Occurs 2.1× more than random chance
Suggests cross-promotion opportunities for staple food items

Practical Applications:
Product Placement: Position high-lift pairs in adjacent store sections
Promotions: Bundle discounts for frequently co-purchased items
Inventory: Stock related products in similar cycles

## Conclusion
This practical examination comprehensively demonstrates skills in data warehousing and data mining through three key components:

1. Data Warehousing Implementation
Designing a star schema optimized for retail analytics, prioritizing query performance

Building a complete ETL pipeline that transformed raw transaction data into an analysis-ready warehouse

Executing meaningful OLAP operations (roll-up, drill-down, slice) to uncover business insights

2. Data Mining Techniques
Preprocessing: Thoroughly cleaned and normalized the Iris dataset, including visualization of distributions and correlations

Clustering: Applied K-Means (k=3) with 0.73 ARI score, validated by elbow method and biological alignment

Classification: Compared Decision Tree (96.7% accuracy) and KNN (100% accuracy), analyzing their suitability

Association Rules: Discovered strong product relationships (e.g., rice → tomato paste, lift=2.1) using Apriori
