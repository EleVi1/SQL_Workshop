SELECT DISTINCT public.people.id as person_id, first_name, last_name, 
justice.outcomes.created_at, serving_time,
    CASE
        WHEN justice.sentence_reductions.amount is NULL THEN
            justice.outcomes.created_at + INTERVAL '1 month' * serving_time
        ELSE
            justice.outcomes.created_at + INTERVAL '1 month' * serving_time 
            - INTERVAL '1 month' * justice.sentence_reductions.amount
    END AS release_date
INTO public.release_dates
FROM justice.defendants
JOIN public.people ON justice.defendants.person_id = people.id
JOIN justice.outcomes ON justice.outcomes.trial_id = justice.defendants.trial_id
LEFT JOIN justice.sentence_reductions
ON justice.sentence_reductions.outcome_id = justice.outcomes.id
WHERE justice.outcomes.outcome = 'GUILTY'
ORDER BY
    release_date DESC,
    serving_time DESC;
