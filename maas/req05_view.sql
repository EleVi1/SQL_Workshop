DROP VIEW IF EXISTS memorin.server_hierarchy;
CREATE RECURSIVE VIEW memorin.server_hierarchy(id, zone_id, core_count, ram,
storage, data_center_id)
AS
    SELECT id, zone_id, core_count, ram, storage, id
    FROM memorin.servers S WHERE master_id is NULL

UNION

SELECT
    E.id, E.zone_id, E.core_count, E.ram, E.storage, S.data_center_id
    FROM memorin.servers E
    JOIN server_hierarchy S
    ON E.master_id = S.id;
