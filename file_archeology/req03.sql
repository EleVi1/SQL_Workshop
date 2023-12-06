SELECT filename, size
FROM dtf.madelines_files
WHERE size > (
    SELECT 0.75 * avg(size)
    FROM dtf.madelines_files)
ORDER BY size DESC;
