SELECT 
    version_id,
    symptom_name,
    danger_level,
    symptom_count,
    (ntile (10) OVER (ORDER BY symptom_count DESC)) as decile_group
FROM
(SELECT
    version_id,
    name as symptom_name,
    danger as danger_level,
    count(*)  as symptom_count

FROM memorin.test_results
JOIN memorin.test_result_symptoms
ON memorin.test_results.id = memorin.test_result_symptoms.test_result_id
JOIN memorin.symptoms
ON memorin.symptoms.id = memorin.test_result_symptoms.symptom_id
GROUP BY version_id, symptom_name, danger) as data
ORDER BY version_id,
        symptom_count DESC,
        symptom_name;
