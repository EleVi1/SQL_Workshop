SELECT id, first_name, last_name
FROM people
WHERE EXISTS (
    SELECT person_id FROM transport.metro_usage_logs
    JOIN transport.metro_stations
    ON transport.metro_stations.id = transport.metro_usage_logs.station_id
    WHERE people.id = person_id and name = 'Morgane Abeille');
