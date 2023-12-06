INSERT INTO public.scrooge_eats_reviews (account_id, rating, review)
SELECT account_id, '4', 'Quick and clean delivery'
FROM public.scrooge_eats_orders
WHERE id = '10001';
