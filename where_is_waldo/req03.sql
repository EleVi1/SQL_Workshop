SELECT nexus_stores.checkouts.id as id,
nexus_stores.checkouts.id as checkout_id,
employee_id,
nexus_stores.checkouts.store_id as checkout_store_id,
nexus_stores.cashier_shifts.store_id as shift_store_id,
start_timestamp,
end_timestamp
FROM nexus_stores.checkouts
LEFT JOIN nexus_stores.cashier_shifts
on nexus_stores.cashier_shifts.checkout_id = nexus_stores.checkouts.id
