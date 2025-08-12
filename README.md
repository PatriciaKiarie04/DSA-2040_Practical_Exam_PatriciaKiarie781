# DSA-2040_Practical_Exam_PatriciaKiarie781
# Final Exam

## Section 1: Data Warehousing
### Task 1: Data Warehouse Design
***Explain why you chose star schema over snowflake***
- The star schema was chosen for this design because of its simplicity and query performance. By having a single join between the fact table and any dimension table, queries are much faster and easier to write. While snowflake schemas reduce data redundancy by normalizing dimensions, this often comes at the cost of more complex queries with multiple joins, which can negatively impact performance in a data warehouse environment. The retail company's needs for simple, fast reporting (like total sales per quarter) which are better served by the star schema's denormalized structure.