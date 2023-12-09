SELECT
    subject_tag,
    name as symptom_name,
    danger as danger_level,
    severity,
    version_id,
    ROUND(avg(severity) OVER
        (ORDER BY name GROUPS CURRENT ROW), 2)
    AS mean_severity
FROM memorin.test_results
JOIN memorin.test_result_symptoms
ON memorin.test_results.id = memorin.test_result_symptoms.test_result_id
JOIN memorin.symptoms
ON memorin.symptoms.id = memorin.test_result_symptoms.symptom_id
ORDER BY subject_tag,
        danger_level DESC,
        severity DESC,
        version_id,
        symptom_name
LIMIT 100;
