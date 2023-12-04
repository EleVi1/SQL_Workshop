SELECT DISTINCT purchase_date, first_name, last_name, email, name, price, category
FROM nexus_stores.receipts, nexus_stores.products, nexus_stores.receipt_items
WHERE email SIMILAR TO
's(a|e)m([a-z]{3,6})_w([a-z]{6,})([0-9]*)@roger_([a-z]+).([a-z]{3,})'
and name ILIKE '%apple%'
and receipt_id = nexus_stores.receipts.id
and product_id = nexus_stores.products.id;
