CREATE INDEX name ON data.events (created_at) WHERE created_at < '2022-04-11 04:38:36.915911';

VACUUM (FULL) data.events;
