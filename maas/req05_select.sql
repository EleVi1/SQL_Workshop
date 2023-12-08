SELECT
    name AS zone_name,
    count(*) FILTER (WHERE data_center_id = memorin.server_hierarchy.id)
    AS data_center_count,

    count(*) AS total_servers,
    sum(core_count) as total_cores,
    sum(ram) as total_ram,
    sum(storage) as total_storage

FROM memorin.server_hierarchy
JOIN memorin.geographic_zones
ON memorin.geographic_zones.id = memorin.server_hierarchy.zone_id

GROUP BY zone_name
ORDER BY data_center_count DESC,
        total_servers DESC,
        zone_name;
