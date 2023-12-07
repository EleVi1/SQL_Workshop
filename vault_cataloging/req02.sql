SELECT id,
size as stored_size,
decrypted,
CAST(CASE WHEN size is NOT NULL THEN size
        WHEN decrypted = True THEN
        (SELECT avg(size) FROM dtf.madelines_files_results
        WHERE decrypted = True AND parent_id is NOT NULL)
        ELSE
        (SELECT avg(size) FROM dtf.madelines_files_results
    WHERE decrypted = False AND parent_id is NOT NULL)
    END as bigint) as calculated_size
FROM dtf.madelines_files_results
WHERE parent_id is NOT NULL
ORDER BY id;
