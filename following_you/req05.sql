(SELECT people.id as person_id,
first_name as person_first_name,
last_name as person_last_name,
created_at,
'street' as place,
street_id as place_id
FROM people
JOIN public.street_logs ON public.street_logs.person_id = people.id
WHERE created_at BETWEEN '2059-12-03 17:00:00' AND '2059-12-03 22:00:00')

UNION

(SELECT people.id as person_id,
first_name as person_first_name,
last_name as person_last_name,
created_at,
'shop' as place,
shop_id as place_id
FROM people
JOIN public.shop_entrance_logs ON
public.shop_entrance_logs.person_id = people.id
WHERE created_at BETWEEN '2059-12-03 17:00:00' AND '2059-12-03 22:00:00')

UNION

(SELECT people.id as person_id,
first_name as person_first_name,
last_name as person_last_name,
created_at,
'metro' as place,
station_id as place_id
FROM people
JOIN transport.metro_usage_logs ON
transport.metro_usage_logs.person_id = people.id
WHERE created_at BETWEEN '2059-12-03 17:00:00' AND '2059-12-03 22:00:00')

ORDER BY created_at, person_id;
