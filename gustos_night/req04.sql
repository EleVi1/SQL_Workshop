SELECT id, reservation_name, reservation_date
FROM public.gusto_reservations
WHERE reservation_date >= '2059-12-03 18:00:00'
and reservation_date <= '2059-12-03 21:00:00' and cancelled = False;
