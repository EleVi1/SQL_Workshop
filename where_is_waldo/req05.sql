SELECT DISTINCT employee_id, person_id, first_name, last_name
FROM nexus_stores.employees
JOIN public.people ON people.id = nexus_stores.employees.person_id
LEFT JOIN nexus_stores.cashier_shifts
ON nexus_stores.cashier_shifts.employee_id = nexus_stores.employees.id
WHERE employee_id NOT IN --Subquery to find the 8 others that are not suspect
(SELECT employee_id
FROM nexus_stores.employees
JOIN public.people ON people.id = nexus_stores.employees.person_id
LEFT JOIN nexus_stores.cashier_shifts
ON (nexus_stores.cashier_shifts.employee_id = nexus_stores.employees.id
AND nexus_stores.cashier_shifts.store_id = '78'
AND nexus_stores.cashier_shifts.start_timestamp = '2059-12-01 13:00:00')
WHERE nexus_stores.employees.position = 'CASHIER'
AND nexus_stores.cashier_shifts.store_id = '78')
AND nexus_stores.cashier_shifts.store_id = '78'
ORDER BY person_id DESC;
