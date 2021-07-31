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
