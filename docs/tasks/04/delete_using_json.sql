DELETE FROM data.users users_alias
    USING data.events events_alias
WHERE users_alias.region_id = events_alias.region_id
  AND users_alias.active = false
    returning *;