
# 🛒 Zepto Product Analysis – SQL EDA (MySQL)

## 📌 Project Overview

This project performs **Exploratory Data Analysis (EDA)** on a Zepto product dataset using **MySQL**.
The goal is to analyze product pricing, discounts, inventory availability, and category-wise performance to answer **real business questions**.

The analysis covers:

* Data exploration & cleaning
* Pricing normalization (paise → rupees)
* Inventory & stock analysis
* Revenue estimation
* Discount & value-for-money insights

---

## 🧹 Data Cleaning Steps

* Renamed incorrectly encoded column names
* Removed products with **zero MRP**
* Converted **prices from paise to rupees**
* Checked and filtered **null values**
* Ensured consistency in stock and pricing fields

---

## 🔍 Key Business Questions Answered

### 1️⃣ Top 10 Best Value Products

Identified products offering the **highest discount percentage**, helping highlight strong promotional deals.

### 2️⃣ High-Value Products That Are Out of Stock

Found expensive products (MRP > ₹300) that are unavailable, indicating **lost revenue opportunities**.

### 3️⃣ Estimated Revenue by Category

Calculated category-wise revenue using:

```
Discounted Price × Available Quantity
```

Useful for **category performance analysis**.

### 4️⃣ Premium Products with Low Discounts

Identified products priced above ₹500 with discounts under 10%, helping assess **pricing strategy gaps**.

### 5️⃣ Categories with Highest Average Discounts

Determined the **top 5 most discount-heavy categories**, useful for promotion planning.

### 6️⃣ Best Value Products by Price per Gram

Calculated **price per gram** for products above 100g to identify value-for-money items.

### 7️⃣ Weight-Based Product Segmentation

Grouped products into:

* Low
* Medium
* Bulk

Helps with **inventory and logistics planning**.

### 8️⃣ Total Inventory Weight per Category

Calculated total weight held per category to understand **warehouse load distribution**.

---

## 📈 Business Insights

* Some high-MRP products are frequently out of stock, indicating demand-supply mismatch
* Certain categories consistently offer higher discounts, possibly impacting margins
* Bulk products contribute significantly to inventory weight, affecting logistics costs

---

