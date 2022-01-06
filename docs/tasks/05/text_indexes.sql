CREATE INDEX data_events_description_idx
    ON data.events
        USING GIN (to_tsvector('english', description));

VACUUM (FULL) data.events;

EXPLAIN
SELECT id
FROM data.events
WHERE to_tsvector('english', description) @@ to_tsquery('english', 'hi');

EXPLAIN
SELECT description
FROM data.events
WHERE description LIKE 'hi%';