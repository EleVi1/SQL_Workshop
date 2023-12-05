INSERT INTO public.scrooge_eats_orders (id, account_id, ordered_at, total_price)
SELECT 10001, scrooge_eats_accounts.id, now(), 0
FROM public.scrooge_eats_accounts, public.companies
WHERE company_id = companies.id and companies.name = 'DTF';

INSERT INTO public.scrooge_eats_basket_items (order_id, item_id, quantity)
SELECT 10001, scrooge_eats_items.id, 1
FROM public.scrooge_eats_items
WHERE scrooge_eats_items.name = 'Kinder Bueno White'
or scrooge_eats_items.name = 'Tacos'
or scrooge_eats_items.name = 'Coca-Cola';
