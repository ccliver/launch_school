SELECT
  parts.part_number, devices.id
FROM
  parts
INNER JOIN devices ON
  parts.device_id = devices.id;

SELECT DISTINCT part_number, device_id from parts where device_id IS NULL
