SELECT
    B.first_name||' '||B.last_name as employee_name,
    A.first_name||' '||A.last_name as manager_name
FROM nexus_intranet.nexus_employees A
INNER JOIN nexus_intranet.nexus_employees B on B.manager_id = A.id;
