CREATE INDEX data_events_created_at_author_idx ON data.events(created_at, author_id);
VACUUM (FULL) data.events;