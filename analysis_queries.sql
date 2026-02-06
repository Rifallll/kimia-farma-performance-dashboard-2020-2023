SELECT 
  EXTRACT(YEAR FROM date) AS year,
  SUM(nett_sales) AS total_sales
FROM `rakamin-kf-analytics.kimia_farma.kf_analisa`
GROUP BY year
ORDER BY year;

SELECT 
  provinsi,
  SUM(nett_sales) AS total_sales
FROM `rakamin-kf-analytics.kimia_farma.kf_analisa`
GROUP BY provinsi
ORDER BY total_sales DESC
LIMIT 10;

SELECT 
  branch_name,
  SUM(nett_profit) AS total_profit
FROM `rakamin-kf-analytics.kimia_farma.kf_analisa`
GROUP BY branch_name
ORDER BY total_profit DESC
LIMIT 10;

SELECT
  category,
  SUM(nett_sales) AS total_sales,
  SUM(nett_profit) AS total_profit
FROM `rakamin-kf-analytics.kimia_farma.kf_analisa`
GROUP BY category
ORDER BY total_sales DESC;

SELECT
  EXTRACT(YEAR FROM date) AS year,
  SUM(nett_profit) AS total_profit
FROM `rakamin-kf-analytics.kimia_farma.kf_analisa`
GROUP BY year
ORDER BY year;

SELECT
  branch_name,
  AVG(branch_rating) AS avg_rating,
  SUM(nett_profit) AS total_profit
FROM `rakamin-kf-analytics.kimia_farma.kf_analisa`
GROUP BY branch_name
ORDER BY total_profit DESC;
