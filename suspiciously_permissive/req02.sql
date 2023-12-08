DROP TABLE IF EXISTS nexus_intranet.onboarding_info;
CREATE TABLE if not exists nexus_intranet.onboarding_info
(
    manager_id serial,
    division nexus_intranet.division_type,
    ssh_key_name text,
    ssh_key_value text,
    tag text
);

WITH RECURSIVE hierarchy_level AS (
    SELECT
        id, manager_id,
        1 AS levels_from_ceo
    FROM nexus_intranet.nexus_employees WHERE manager_id IS NULL
    UNION ALL
    SELECT
        nexus_intranet.nexus_employees.id,
        nexus_intranet.nexus_employees.manager_id,
        hierarchy_level.levels_from_ceo + 1 AS levels_from_ceo
    FROM nexus_intranet.nexus_employees
    INNER JOIN hierarchy_level
        ON nexus_intranet.nexus_employees.manager_id = hierarchy_level.id
)

INSERT INTO nexus_intranet.onboarding_info
VALUES
(
    (SELECT id FROM nexus_intranet.nexus_employees WHERE
    first_name||' '||last_name = 'Arthur Polard'),
    (SELECT division FROM nexus_intranet.nexus_employees WHERE
    first_name||' '||last_name = 'Arthur Polard'),
    'arch_home',
    'ssh-rsa SWV0OUUzcXBSSm4yRUo2cURQSVhEekx3S04ybElKOGQ4ck1zdHZpMndqRlROTHZHVjhHMVg2ZG92aVdFV
nB3VkhVTz00a0RFM1NwTHhxZjZzclprY1VsQ2NYbDloPXRlZkFYQXlYQWVmZk1HR0ZNdzhkSDdmNngxUXBlTWhjK3
JuWjFNUXJnbEdpRWwrSXBFQnZqU3U9a3lIelFsaD1pV1E2amU5VElacGdBVy92TjRXL0F5cFNLdGcwS216U2MvSXB
5QWV5VmY1Z3cyUGE3YnhoRU80Zy85Sz1GPUpVUURGeGRwMy9qR2NqRWF3WGZBbUdXS0NzPTl4VzI1UjhBNVREQUhj
ZXRhaTdUaG1VYTBIZVlqZnVSTUx3TEtZR0NKcDZ5VjRVUzdVMVBQSFdFeG5zVzBweVRNcGQ9Z3lOQUx4N01acXNxU
HVYeUtna0JHbmorV1VIZmVBbDBFdXA9dDBFV3BtQysxZVd5KzlKRzkxbHpr',
    'N'||
    (SELECT division FROM nexus_intranet.nexus_employees WHERE
    first_name||' '||last_name = 'Arthur Polard')||
    lpad(CAST(
            (SELECT levels_from_ceo FROM hierarchy_level 
            WHERE manager_id = 5)  as text), 2, '0')||
    lpad(CAST((SELECT count(id) from hierarchy_level where manager_id = 5) as text), 3, '0')
    ||'-'||
    substring((SELECT tag from nexus_intranet.nexus_employees
        WHERE manager_id = 5)
    from '%-#"%#"' for '#')

);
SELECT * from nexus_intranet.onboarding_info;
