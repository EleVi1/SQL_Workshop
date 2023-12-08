CREATE TEMPORARY VIEW devices_metrics AS
    SELECT
    device_serial as serial_number,
    memorin.device_logs.version_id,
    memorin.device_logs.id as log_id,
    latitude as lat,
    longitude as long,
    temperature as temp,
    battery_percentage as battery,
    signal_strength
    FROM memorin.device_logs
    JOIN memorin.devices
    ON memorin.devices.serial_number = memorin.device_logs.device_serial
    JOIN memorin.device_versions
    ON memorin.device_logs.version_id = memorin.device_versions.id

WHERE deactivated_at is NULL
    ORDER BY serial_number,
    released_at DESC,
    log_id;
