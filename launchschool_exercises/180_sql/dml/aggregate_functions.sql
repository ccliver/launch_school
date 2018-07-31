SELECT
  devices.name, count(parts.id)
FROM
  devices
INNER JOIN parts ON
  devices.id = parts.device_id
GROUP BY
  devices.name
