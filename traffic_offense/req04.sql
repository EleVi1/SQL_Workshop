SELECT az.id, az.description, az.violation_date, az.street_id, az.license_plate
FROM public.traffic_violations as bz, public.traffic_violations as az
WHERE bz.license_plate LIKE 'AZ__36_' and
bz.violation_date >= timestamp '2059-12-03 21:00:00.00' - INTERVAL '1 hour'
and bz.violation_date <= timestamp '2059-12-03 21:00:00.00' + INTERVAL '1 hour'
and (bz.description = 'SPEED_AND_TRAFFIC_VIOLATION'
or bz.description = 'RECKLESS_AND_DANGEROUS_DRIVING')
and bz.license_plate = az.license_plate;
