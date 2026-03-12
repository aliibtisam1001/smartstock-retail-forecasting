# SmartStock: Retail Demand Forecasting & Inventory Decision Support

## Dataset Link
Kaggle dataset: [Store Sales - Time Series Forecasting](https://www.kaggle.com/competitions/store-sales-time-series-forecasting) :contentReference[oaicite:0]{index=0}

## Overview
SmartStock is an end-to-end retail analytics project designed to help small and medium retailers make better inventory decisions. The system combines demand forecasting, stockout-risk analysis, and reorder recommendation logic using historical retail sales data.

This project demonstrates how data science can support real business operations by turning raw sales, promotions, transactions, and time-series patterns into practical inventory actions.

---

## Business Problem
Retail businesses often struggle with inventory planning. Poor forecasting and weak inventory visibility can lead to:

- stockouts
- overstocking
- lost revenue
- waste
- inefficient replenishment decisions

SmartStock was built to answer practical business questions such as:

- Which product families are likely to sell more in the near future?
- Which store-family combinations are at risk of stockout?
- What should be reordered now or soon?
- Which products appear overstocked?

---

## Dataset
This project uses the Kaggle **Store Sales - Time Series Forecasting** dataset. :contentReference[oaicite:1]{index=1}

Main files used:
- `train.csv`
- `stores.csv`
- `transactions.csv`
- `oil.csv`
- `holidays_events.csv`

The dataset includes daily retail sales, store information, transactions, promotions, holidays, and oil prices.

---

## Tools and Technologies
- Python
- SQL (SQLite)
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Scikit-learn
- Power BI
- Git / GitHub

---

## Project Workflow
The project was completed in the following stages:

1. Data loading and understanding  
2. SQL database setup  
3. SQL business analysis  
4. Data merging and cleaning  
5. Feature engineering  
6. Exploratory data analysis (EDA)  
7. Demand forecasting model  
8. Stockout-risk classification model  
9. Decision layer and recommendation engine  
10. Power BI dashboard development  

---

## SQL Analysis
SQL queries were used to explore:

- top-selling product families
- top-performing stores
- monthly sales trends
- promotion effects
- sales by store type
- weekday demand patterns

This step helped frame the business problem before modeling.

---

## Feature Engineering
Several time-series and operational features were created, including:

### Time Features
- `year`
- `month`
- `day`
- `day_of_week`
- `week_of_year`
- `is_weekend`
- `quarter`

### Demand History Features
- `lag_1`
- `lag_7`
- `lag_14`
- `rolling_mean_7`
- `rolling_mean_14`
- `rolling_mean_28`
- `rolling_std_7`
- `rolling_std_28`

### Promotion and Calendar Features
- `has_promotion`
- `is_holiday`

### Simulated Inventory Features
- `avg_daily_sales_7`
- `avg_daily_sales_14`
- `supplier_lead_time`
- `simulated_stock_on_hand`
- `reorder_point`
- `days_until_stockout`
- `stockout_risk_flag`
- `reorder_urgency_score`

---

## Exploratory Data Analysis
EDA showed several important retail patterns:

- Grocery and beverage families dominated total sales
- Promotions were associated with significantly higher average sales
- Sales showed strong weekly seasonality, especially on weekends
- Sales were highly right-skewed
- Transactions were positively related to sales
- Demand patterns varied across time and categories

---

## Forecasting Model
The forecasting task aimed to predict daily sales at the store-family-date level.

### Models Compared
- Baseline (`lag_1`)
- Linear Regression
- Random Forest Regressor

### Forecasting Results
| Model | MAE | RMSE | R² |
|------|------:|------:|------:|
| Baseline (`lag_1`) | 135.77 | 528.25 | 0.8481 |
| Linear Regression | 97.67 | 342.72 | 0.9360 |
| Random Forest | 72.69 | 279.05 | 0.9576 |

### Best Model
The **Random Forest Regressor** achieved the best forecasting performance.

### Top Forecasting Features
- `rolling_mean_7`
- `lag_7`
- `lag_14`
- `lag_1`
- `transactions`

These results show that recent demand history is highly predictive of future retail sales.

---

## Stockout-Risk Classification
A stockout-risk classifier was developed using simulated inventory logic.

### Target Balance
- No risk: **97.49%**
- Risk: **2.51%**

### Important Classification Features
- `days_until_stockout`
- `lag_14`
- `rolling_mean_7`
- `avg_daily_sales_7`
- `rolling_mean_28`

This layer demonstrates how predictive analytics can support operational decision-making.

---

## Decision Layer
A rule-based recommendation engine translated model and inventory signals into business actions:

- `Reorder now`
- `Reorder soon`
- `Safe`
- `Overstock risk`

A priority scoring system was also used to rank the most urgent replenishment needs.

---

## Dashboard
A Power BI dashboard was built with four pages:

1. **Executive Overview**
2. **Demand Patterns**
3. **Inventory Decisions**
4. **Reorder Focus**

The dashboard highlights:
- total sales and average sales
- top product families
- promotion impact
- demand trends
- stockout-risk monitoring
- reorder recommendations
- overstock visibility

---

## Key Insights
- Grocery and beverage categories contribute the largest share of sales
- Promotions strongly increase average sales
- Sales patterns show both weekly and monthly seasonality
- Recent demand history is the strongest predictor of future sales
- Most store-family combinations are safe, while a smaller subset requires urgent replenishment attention

---

## Limitations
- Real inventory data was not available, so inventory-related features were simulated
- The stockout-risk target was engineered from simulated inventory logic
- Some classification predictors are closely tied to the target definition, so the stockout classifier should be viewed as a portfolio prototype rather than a production-ready system

---

## Future Improvements
- Add encoded categorical features such as family and store type to the forecasting model
- Use more advanced models such as XGBoost or LightGBM
- Improve inventory simulation with replenishment events and supplier variability
- Add safety stock and service-level optimization
- Deploy the project as an interactive application

---

## Repository Structure
smartstock-retail-forecasting/
├── notebooks/
├── sql/
├── dashboard/
├── data/
│   └── processed/
├── outputs/
│   └── dashboard_screenshots/
├── README.md
└── .gitignore