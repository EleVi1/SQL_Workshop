SELECT id, person_id, credits_change, action_description
FROM public.social_credit_history
WHERE date BETWEEN '2059-12-03 17:00:00' and '2059-12-03 22:00:00'
    ORDER BY credits_change ASC,
        id ASC
LIMIT 10
