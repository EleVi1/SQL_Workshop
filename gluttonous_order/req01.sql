SELECT scrooge_eats_accounts.id
FROM public.scrooge_eats_accounts, public.companies
WHERE company_id = companies.id and companies.name = 'DTF';
