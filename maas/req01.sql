CREATE VIEW memorin.devices_summary AS
    SELECT
    count(*) AS total_devices,
    count(serial_number) FILTER (WHERE deactivated_at is NULL)
    AS active_devices,
    count(serial_number) FILTER (WHERE deactivated_at is NOT NULL)
    AS inactive_devices
    FROM memorin.devices;
