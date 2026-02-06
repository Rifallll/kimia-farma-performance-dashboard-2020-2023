CREATE OR REPLACE TABLE
  `rakamin-kf-analytics.kimia_farma.kf_analisa` AS
SELECT
  t.transaction_id,
  t.date,
  c.branch_id,
  c.branch_name,
  c.provinsi,
  p.product_id,
  p.product_name,
  p.category,
  t.price,
  t.discount_percentage,
  t.quantity,

  -- Nett Sales
  (t.price * t.quantity) * (1 - t.discount_percentage / 100) AS nett_sales,

  -- Nett Profit (asumsi 20% margin)
  ((t.price * t.quantity) * (1 - t.discount_percentage / 100)) * 0.2 AS nett_profit,

  c.rating AS branch_rating

FROM
  `rakamin-kf-analytics.kimia_farma.kf_final_transaction` t
LEFT JOIN
  `rakamin-kf-analytics.kimia_farma.kf_product` p
ON
  t.product_id = p.product_id
LEFT JOIN
  `rakamin-kf-analytics.kimia_farma.kf_kantor_cabang` c
ON
  t.branch_id = c.branch_id;
