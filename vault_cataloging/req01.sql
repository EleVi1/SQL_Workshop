SELECT id,
    filename,
    CASE WHEN decrypted = True THEN 'File was successfully decrypted.'
    WHEN parent_id IN
        (SELECT id
        FROM dtf.madelines_files_results
        WHERE decrypted = True) THEN 'File was successfully decrypted because its containing folder was successfully decrypted.'
    ELSE
        'File remains encrypted.'
    END as decryption_status
FROM dtf.madelines_files_results
ORDER BY id;
