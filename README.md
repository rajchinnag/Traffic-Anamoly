# SmartSQL Traffic Anomaly Detection 🚦

An advanced SQL project that uses real-time traffic simulation and PostgreSQL analytics to detect congestion, delay hotspots, and recommend optimal routes.

---

## 📁 Features

- Traffic data simulation across 3 cities (Hyd, Blr, Che)
- Delay & congestion scoring by segment
- Route mapping & scoring using SQL analytics
- Window functions, views, and ranking logic
- Anomaly refresh logs via stored procedure

---

## 🛠 Tech Stack

- **PostgreSQL**
- **PL/pgSQL**
- **SQL Window Functions**
- **TomTom Traffic APIs (for optional real-time data)**

---

## 🧱 Setup

```sql
-- Step 1: Create Tables
\i schema.sql

-- Step 2: Insert Dummy Data
\i seed_data.sql

-- Step 3: Create Views
\i anomaly_detection.sql
\i route_scoring.sql
\i best_route_view.sql

-- Step 4: Create Stored Procedure
\i stored_procedure.sql
```

---

## 📊 Usage

```sql
-- View current anomalies
SELECT * FROM traffic_anomalies WHERE latest_rank = 1;

-- View route scores
SELECT * FROM route_scores;

-- Get best route
SELECT * FROM best_route;

-- Log anomalies
SELECT log_anomaly_refresh();
```

---

## 🧠 Advanced SQL Features

- Window functions (`ROW_NUMBER`, `RANK`)
- Dynamic scoring logic
- Data seeding with `generate_series`
- Stored procedure to refresh logs
