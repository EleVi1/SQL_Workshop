SELECT owner, count(*) as num_files
FROM dtf.madelines_files
GROUP BY owner
HAVING count(*) = (SELECT min(tmp)
    FROM (SELECT owner, count(*) tmp
    FROM dtf.madelines_files
    GROUP BY owner) as result)
ORDER BY owner;
