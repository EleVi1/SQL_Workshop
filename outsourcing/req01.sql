SELECT justice.trials.id as trial_id, case_id, classification, description
INTO public.definitive_trials
FROM justice.trials, justice.cases
WHERE justice.cases.id = case_id
and (justice.trials.status = 'FINISHED')
ORDER BY
    classification, case_id;
