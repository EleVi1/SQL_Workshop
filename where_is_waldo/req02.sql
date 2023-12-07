SELECT 
count(*) FILTER (WHERE nexus_stores.cashier_shifts.employee_id is NULL)
as null_employee_id_rows_count,
count(*) FILTER (WHERE nexus_stores.cashier_shifts.store_id is NULL)
as null_store_id_rows_count
FROM nexus_stores.cashier_shifts
LEFT JOIN nexus_stores.employees on nexus_stores.cashier_shifts.employee_id =
nexus_stores.employees.id
LEFT JOIN nexus_stores.stores on nexus_stores.stores.id =
nexus_stores.cashier_shifts.store_id;
