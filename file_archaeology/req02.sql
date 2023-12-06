SELECT filename, size
FROM dtf.madelines_files
WHERE created_at BETWEEN '2059-11-27' AND '2059-12-03'
and size IN (
    SELECT max(size)
    FROM dtf.madelines_files
    WHERE created_at BETWEEN '2059-11-27' AND '2059-12-03')
ORDER BY filename;
