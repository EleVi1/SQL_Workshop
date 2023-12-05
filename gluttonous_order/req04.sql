INSERT INTO public.scrooge_eats_basket_items (order_id, item_id, quantity)
SELECT 10000, scrooge_eats_items.id, 1
FROM public.scrooge_eats_items
WHERE scrooge_eats_items.name = 'Kinder Bueno White'
or scrooge_eats_items.name = 'Tacos'
or scrooge_eats_items.name = 'Coca-Cola';
