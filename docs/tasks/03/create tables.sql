/* service.password_resets */
create table if not exists service.password_resets
(
    id bigserial constraint password_resets_pk primary key,
    email varchar(255) not null,
    token varchar(255) not null
    );

alter table service.password_resets owner to icarhelper_user;

/* service.failed_jobs */
create table if not exists service.failed_jobs
(
    id bigint not null constraint failed_jobs_pk primary key,
    connection text not null,
    queue text not null,
    payload text not null,
    exception text not null,
    failed_at timestamp not null
);

alter table service.failed_jobs owner to icarhelper_user;

/* data.event_statuses */
create table if not exists data.event_statuses
(
    id bigserial constraint event_statuses_pk primary key,
    created_at timestamp not null,
    updated_at timestamp,
    name varchar(255) not null
    );

alter table data.event_statuses owner to icarhelper_user;

create unique index if not exists event_statuses_name_uindex on data.event_statuses (name);

/* data.event_types */
create table if not exists data.event_types
(
    id bigint not null constraint event_types_pk primary key,
    name varchar(255) not null,
    created_at timestamp not null,
    updated_at timestamp
    );

alter table data.event_types owner to icarhelper_user;

create unique index if not exists event_types_name_uindex on data.event_types (name);
