SELECT public.people.id as person_id, first_name, last_name, birth_date,
classification, description
INTO TEMPORARY not_guilty
FROM justice.trials, justice.cases, public.people, justice.defendants,
justice.outcomes
WHERE justice.defendants.person_id = people.id
and justice.defendants.trial_id = justice.trials.id
and justice.trials.id = justice.outcomes.trial_id
and justice.trials.case_id = justice.cases.id
and justice.outcomes.outcome = 'NOT_GUILTY';
