# ☕ Monday Coffee Data Analysis (SQL Project)

![SQL Banner](https://capsule-render.vercel.app/api?type=waving&color=0:1e3c72,100:2a5298&height=200&section=header&text=Monday%20Coffee%20Analysis&fontSize=40&fontColor=ffffff)

---

## 📌 Project Overview

This project analyzes the sales data of **Monday Coffee**, a company operating in multiple cities since 2023.

The objective is to extract actionable insights using SQL to support **business expansion, customer understanding, and revenue optimization**.

---

## 🎯 Business Objective

- Identify top-performing cities for expansion  
- Analyze customer behavior and demand  
- Evaluate product performance  
- Track revenue trends and growth  
- Discover high-potential markets  

---

## 🗂️ Database Schema

The analysis is based on the following relational tables:

- 🏙️ `city` → City details (population, estimated rent, ranking)  
- 👥 `customers` → Customer demographics  
- ☕ `products` → Product details and pricing  
- 🧾 `sales` → Transaction-level sales data  

---

## 🛠️ Tools & Technologies

![SQL](https://img.shields.io/badge/SQL-MySQL-blue?style=for-the-badge&logo=mysql)
![Data Analysis](https://img.shields.io/badge/Data%20Analysis-SQL-green?style=for-the-badge)
![Database](https://img.shields.io/badge/Database-Relational-orange?style=for-the-badge)

---

# 📊 Key Business Questions & Analysis

---

## 🔹 1. Customer Distribution by City
- Counted total customers in each city  
- Helps understand market size and reach  

---

## 🔹 2. Most Expensive Products
- Identified top 3 highest-priced products  
- Useful for premium pricing strategy  

---

## 🔹 3. Coffee Consumers Estimation
- Estimated coffee consumers as **25% of city population**  
- Helps forecast demand  

---

## 🔹 4. Revenue Analysis (Q4 2023)
- Calculated total revenue across cities  
- Identified high-revenue markets  

---

## 🔹 5. Product Sales Performance
- Measured number of units sold per product  
- Identified best-selling products  

---

## 🔹 6. Average Customer Spending
- Calculated average sales per customer in each city  
- Helps evaluate customer value  

---

## 🔹 7. City Population vs Customers
- Compared population with actual customers  
- Estimated market penetration  

---

## 🔹 8. Top Selling Products by City
- Used **DENSE_RANK() Window Function**  
- Identified top 3 products in each city  

---

## 🔹 9. Customer Segmentation
- Counted unique customers purchasing coffee  
- Helps in targeted marketing strategies  

---

## 🔹 10. Sales vs Rent Analysis
- Compared average customer spending with rent  
- Helps assess profitability of each city  

---

## 🔹 11. Monthly Sales Growth
- Used **LAG() function**  
- Calculated month-over-month growth trends  

---

## 🔹 12. Market Potential Analysis
- Identified top 3 cities based on:
  - Total sales  
  - Total customers  
  - Estimated coffee consumers  
  - Rent  

---

# 🏆 Final Business Recommendations

Based on the analysis, the top 3 cities for expansion are:

---

## 🥇 Pune
- Highest total revenue  
- Strong average customer spending  
- Low rent per customer  

---

## 🥈 Delhi
- Highest estimated coffee consumers  
- Large customer base  
- Moderate rent with high demand  

---

## 🥉 Jaipur
- High number of customers  
- Very low rent  
- Good average sales per customer  

---

## 🧠 SQL Concepts Used

- ✅ INNER JOIN  
- ✅ GROUP BY & Aggregations  
- ✅ Window Functions (DENSE_RANK, LAG)  
- ✅ Common Table Expressions (CTE)  
- ✅ Date Functions (YEAR, MONTH, QUARTER)  
- ✅ Filtering & Sorting  

---

## 📈 Key Insights

✔ High population cities ≠ highest revenue  
✔ Customer spending varies significantly across cities  
✔ Some cities offer **low rent but high returns**  
✔ Product demand varies by location  

---

## 🚀 Conclusion

This project demonstrates how SQL can be used to:

- Convert raw data into meaningful insights  
- Support business decision-making  
- Identify growth opportunities  

---

## 🧑‍💻 Author

**Vedant Jamdade**  
Aspiring Data Analyst | SQL Developer  

---

## ⭐ Support

If you found this project helpful:

⭐ Star this repository  
📢 Share with others  
💼 Use it as portfolio inspiration  
