INSERT INTO nexus_stores.sales (id, product_id, checkout_id, store_id,
    sale_timestamp)
SELECT
'10000',
'3',
'68cdd3ec',
'78',
'2059-12-01 14:47:07';

INSERT INTO nexus_stores.cashier_shifts (id, checkout_id, employee_id, store_id,
    start_timestamp, end_timestamp)
SELECT
'ffff',
'68cdd3ec',
NULL,
'78',
'2059-12-01 13:00:00',
'2059-12-01 15:00:00';
