SELECT nexus_stores.sales.id as sales_id, 
product_id,
nexus_stores.sales.checkout_id as checkout_id,
sale_timestamp,
nexus_stores.cashier_shifts.id as shift_id,
employee_id,
start_timestamp as shift_start_timestamp,
end_timestamp as shift_end_timestamp
INTO dtf.shifts_and_sales_78
FROM nexus_stores.sales
JOIN nexus_stores.cashier_shifts ON nexus_stores.cashier_shifts.checkout_id =
nexus_stores.sales.checkout_id
WHERE nexus_stores.sales.store_id = '78'
and nexus_stores.cashier_shifts.start_timestamp = '2059-12-01 13:00:00'
and nexus_stores.cashier_shifts.end_timestamp = '2059-12-01 15:00:00';
