DROP VIEW if exists memorin.zoned_devices_logs;
CREATE VIEW memorin.zoned_devices_logs AS
    SELECT
    device_serial,
    version_id,
    zone_id,
    latitude as lat,
    longitude as long,
    temperature as temp,
    battery_percentage as battery,
    signal_strength
    FROM memorin.device_logs logs

WHERE
    device_serial IN (SELECT serial_number FROM memorin.devices
    WHERE deactivated_at is NULL)
AND version_id IN (SELECT id FROM memorin.device_versions)
AND temperature BETWEEN '34' AND '45'
AND signal_strength BETWEEN '0' AND '5'
AND battery_percentage BETWEEN '0' AND '100'
AND (latitude BETWEEN
(SELECT min_latitude FROM memorin.geographic_zones WHERE logs.zone_id = id)
AND  (SELECT max_latitude FROM memorin.geographic_zones WHERE logs.zone_id = id))
AND (longitude BETWEEN
(SELECT min_longitude FROM memorin.geographic_zones WHERE logs.zone_id = id)
AND  (SELECT max_longitude FROM memorin.geographic_zones WHERE logs.zone_id = id))

WITH CHECK OPTION;
