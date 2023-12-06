INSERT INTO public.scrooge_eats_reviews (account_id, order_id, rating, review)
SELECT account_id, '10001', '5', 'The food was so delicious'
FROM public.scrooge_eats_orders
WHERE id = '10001';
