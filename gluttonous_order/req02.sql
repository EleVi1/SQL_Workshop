INSERT INTO public.scrooge_eats_orders (id, account_id, ordered_at, total_price)
SELECT 10000, scrooge_eats_accounts.id, now(), 0
FROM public.scrooge_eats_accounts, public.companies
WHERE company_id = companies.id and companies.name = 'DTF';
