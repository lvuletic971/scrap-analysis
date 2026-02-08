## BI & Visualization

This folder contains analytical dashboards created in Tableau for exploring manufacturing waste and production efficiency.

The visualizations are built on top of the data warehouse model and focus on identifying trends, root causes, and key performance indicators
related to production waste.

### Key Analytical Insights

The dashboards highlight several important findings:

- waste shows a strong increasing trend over the observed years, even when overall production slightly decreases

- certain products generate disproportionately high waste, indicating potential process or quality issues rather than production volume

- finished products produce more waste than semi-finished products, suggesting problems in the final production stages

- the dominant root cause of waste is related to technical factors and machinery, pointing to potential equipment maintenance or replacement needs

- the waste percentage exceeds the acceptable 1% threshold in later years, signaling declining production efficiency

### Purpose of the BI Layer

The BI layer enables:

- monitoring of waste trends over time

- identification of high-risk products and processes

- analysis of root causes of waste

- tracking of key production efficiency KPIs

These insights support data-driven operational and strategic decisions in manufacturing.

### Tool Used

Tableau for dashboard design and visualization



## Dashboard Highlights

### 1. Waste Trend Over Time

This visualization shows the relationship between total production and manufacturing waste across the observed years.

The chart reveals a **continuous increase in waste** despite stable or slightly declining production,
indicating **declining production efficiency**.

![Waste Trend](waste_trend.png)

---

### 2. Products With Highest Waste

This view identifies **products contributing the most to total waste**.

Some products generate **high waste despite low production volume**, which suggests **process or quality issues rather than scale effects**.

![Top Waste Products](top_products_waste.png)

---

### 3. Root Causes of Waste

This analysis highlights the **dominant technical and machinery-related causes** behind manufacturing waste.

The findings indicate potential need for **equipment maintenance or replacement**.

![Waste Causes](waste_causes.png)

---

### 4. Waste Percentage vs Acceptable Threshold

This KPI view compares the **actual waste percentage** with the **acceptable 1% production threshold**.

Later years clearly exceed the limit, signaling **reduced operational efficiency**.

![Waste KPI](waste_percentage_kpi.png)

