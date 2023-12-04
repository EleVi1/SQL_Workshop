SELECT receipt_id, name, quantity, price
FROM nexus_stores.products, nexus_stores.receipt_items
WHERE nexus_stores.products.id = nexus_stores.receipt_items.product_id and
name ILIKE '%apple%' and quantity > 10;
