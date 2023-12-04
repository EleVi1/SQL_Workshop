SELECT DISTINCT gusto_guests.id, gusto_guests.reservation_id
FROM public.gusto_guests, public.gusto_reservations
WHERE gusto_guests.reservation_id = gusto_reservations.id
and cancelled = False and reservation_date BETWEEN '2059-12-03 18:00:00' AND
'2059-12-03 21:00:00'
