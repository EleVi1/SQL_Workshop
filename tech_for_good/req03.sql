SELECT
    version_id,
    description,
    death_count,
    avg(death_count) OVER (ORDER BY death_count
            ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)::numeric(10,2)
    AS smooth_avg
FROM
    (SELECT
        version_id,
        description,
        death_count - lag(death_count)
        OVER (ORDER BY death_count GROUPS CURRENT ROW) AS death_count

    FROM
        (SELECT DISTINCT
            version_id,
            description,
            count(subject_tag) OVER (ORDER BY version_id GROUPS CURRENT ROW)
            AS death_count
        FROM memorin.test_results
        JOIN memorin.versions
        ON memorin.test_results.version_id = memorin.versions.id
        GROUP BY version_id, description, subject_tag) as data1) as data2
ORDER BY version_id;
