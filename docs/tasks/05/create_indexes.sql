CREATE INDEX events_created_at ON data.events (created_at);

VACUUM (VERBOSE, ANALYZE) data.events;