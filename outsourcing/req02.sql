SELECT public.people.id as person_id, first_name, last_name, birth_date,
justice.outcomes.created_at as conviction_date, serving_time,
(justice.outcomes.created_at + INTERVAL '1 month' * serving_time <= '2059-12-03')
as could_be_released
INTO public.outcome_status
FROM justice.outcomes, justice.trials, public.people, justice.cases,
justice.defendants
WHERE justice.defendants.person_id = people.id
and justice.defendants.trial_id = justice.trials.id
and justice.trials.id = justice.outcomes.trial_id
and justice.trials.case_id = justice.cases.id
and justice.outcomes.outcome = 'GUILTY'
and justice.cases.classification = 'CRIME'

