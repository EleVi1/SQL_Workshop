SELECT 
    version_id,
    symptom_name,
    danger_level,
    rank
FROM
(SELECT
    version_id,
    symptom_name,
    danger_level,
    dense_rank() OVER
    (PARTITION BY version_id ORDER BY symptom_count DESC) as rank
FROM
    (SELECT
        version_id,
        name as symptom_name,
        danger as danger_level,
        count(*) as symptom_count
    FROM memorin.test_results
    JOIN memorin.test_result_symptoms
    ON memorin.test_results.id = memorin.test_result_symptoms.test_result_id
    JOIN memorin.symptoms
    ON memorin.symptoms.id = memorin.test_result_symptoms.symptom_id
    GROUP BY version_id, symptom_name, danger_level
    ORDER BY symptom_count DESC) as count1) as rank2
WHERE rank <= 3
ORDER BY version_id,
        rank,
        symptom_name;
