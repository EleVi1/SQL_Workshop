SELECT parent_id as folder_id,
count(*) FILTER (WHERE permissions LIKE '%x%') as nb_executables
FROM dtf.madelines_files
GROUP BY parent_id
HAVING count(*) FILTER (WHERE permissions LIKE '%x%') >= 3
ORDER BY folder_id NULLS FIRST;
