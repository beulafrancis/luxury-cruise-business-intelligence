# Global Luxury Cruise Business, Operations & Weather Intelligence

## Project Overview

This project analyzes luxury cruise business operations using PostgreSQL, Python, Machine Learning, and Power BI.

It focuses on passenger bookings, onboard activities, food and beverage operations, port calls, route planning, weather conditions, and operational performance.

The project also includes a Machine Learning component to predict cruise activity booking cancellations.

## Business Objectives

- Analyze passenger bookings and cancellations.
- Evaluate onboard activity bookings and revenue.
- Monitor food and beverage inventory.
- Analyze port calls, route changes, and weather-related delays.
- Understand cruise operating costs and operational performance.
- Predict potentially cancelled activity bookings.
- Build interactive dashboards to support business decisions.

## Tools & Technologies

- **PostgreSQL** — Data storage, SQL queries, data validation, and analysis.
- **Python** — Data preprocessing, EDA, feature engineering, and Machine Learning.
- **Pandas & NumPy** — Data manipulation and analysis.
- **Scikit-learn** — Machine Learning model development and evaluation.
- **Power BI** — Interactive dashboards and business reporting.
- **Jupyter Notebook** — Python development and experimentation.
- **GitHub** — Project documentation and version control.

## Data & Database

The project uses a relational database with tables covering passenger information, activity bookings, food and beverage, ports, routes, weather, staff, and operational expenses.

**Note:** This portfolio project contains simulated cruise business data for analytical and demonstration purposes. It should not be interpreted as actual company operational data.

## Key Analysis Areas

1. Passenger & Booking Analysis
2. Activity Booking & Revenue Analysis
3. Food & Beverage Operations
4. Port Operations & Route Analysis
5. Weather & Operational Impact
6. Booking Cancellation Prediction

## Machine Learning – Booking Cancellation Prediction

A Logistic Regression model was developed to predict cruise activity booking cancellations.

**Dataset:**
- Total Records: 730,000
- Cancelled Bookings: 53,860 (7.38%)
- Non-Cancelled Bookings: 676,140 (92.62%)

**Model:** Logistic Regression with class balancing.

**Model Evaluation:**

| Metric | Score |
|---|---:|
| Accuracy | 54.45% |
| Precision (Cancelled) | 13.94% |
| Recall (Cancelled) | 100% |
| F1-score (Cancelled) | 24.47% |

**Key Observation:**

The model identified all cancelled bookings in the test dataset but also produced a high number of false positive predictions. Further model improvement is required before practical business use.

## Project Workflow

1. Created and organized relational database tables.
2. Loaded cruise-related data into PostgreSQL.
3. Validated records, identifiers, dates, and business rules.
4. Used SQL to clean and analyze the data.
5. Performed Python-based data preprocessing and EDA.
6. Developed a Logistic Regression cancellation prediction model.
7. Prepared data for business intelligence reporting.
8. Documented project files and SQL scripts in GitHub.

## Repository Structure

SQL scripts, Python notebooks, and supporting project documentation are organized in this repository.

## Future Improvements

- Develop interactive Power BI dashboards.
- Improve cancellation prediction model performance.
- Compare additional classification algorithms.
- Analyze actual versus predicted cancellation patterns.
- Expand route and weather impact reporting.
- Add further business KPIs and operational insights.

## Project Status

- PostgreSQL database development and SQL analysis: In progress / completed modules.
- Machine Learning cancellation prediction prototype: Completed.
- Power BI dashboard development: Planned.

## Author

Data Analytics Portfolio Project

