CREATE MATERIALIZED VIEW memorin.outdated_devices AS
    SELECT
    serial_number,
    version_id,
    released_at,
    eol_timestamp,
    (SELECT count(*) FROM memorin.device_versions
    WHERE released_at > (SELECT released_at FROM memorin.device_versions
    WHERE version_id = memorin.device_versions.id))
    as versions_behind

    FROM memorin.devices as dev
    JOIN memorin.device_versions
    ON dev.version_id = memorin.device_versions.id
    WHERE deactivated_at is NULL
    AND eol_timestamp is NOT NULL

    ORDER BY released_at,
    serial_number;
