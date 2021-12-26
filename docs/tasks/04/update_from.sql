UPDATE data.users
SET last_name = data.countries.common_name
    FROM data.countries
WHERE data.users.country_id = data.countries.id
  AND data.users.active = false;