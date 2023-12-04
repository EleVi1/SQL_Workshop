SELECT *
FROM public.traffic_violations
WHERE license_plate LIKE 'AZ__36_' and
violation_date >= timestamp '2059-12-03 21:00:00.00' - INTERVAL '1 hour'
and violation_date <= timestamp '2059-12-03 21:00:00.00' + INTERVAL '1 hour';
