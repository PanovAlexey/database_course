INSERT INTO data.events
(id, created_at, description, author_id, type_id, status_id, region_id, locality, lat, long)
SELECT generate_series(1, 30000000)   AS id,
       CURRENT_TIMESTAMP                  AS created_at,
       md5(random()::text)                AS description,
       floor(random() * (105)) + 1        AS author_id,
       floor(random() * (6)) + 1          AS type_id,
       floor(random() * (2 - 1 + 1)) + 1  AS status_id,
       floor(random() * (490 - +1)) + 490 AS region_id,
       random()::text                     AS locality,
            floor(random() * 100) + 0.31       as lat,
       floor(random() * 100) + 0.45       as long;