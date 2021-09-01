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

/* data.roles */
create table if not exists data.roles
(
    id bigint not null constraint roles_pk primary key,
    name varchar(255) not null,
    created_at timestamp not null,
    updated_at timestamp
    );

alter table data.roles owner to icarhelper_user;

create unique index if not exists roles_name_uindex on data.roles (name);

/* data.countries */
create table if not exists data.countries
(
    id bigint not null constraint countries_pk primary key,
    common_name varchar(255) not null,
    native_name varchar(255) not null,
    name_ru varchar(255) not null,
    iso_3166_1_alpha3 varchar(255) not null,
    iso_3166_1_numeric smallint not null,
    phone_code varchar(255) not null,
    flag varchar(255) not null
    );

alter table data.countries owner to icarhelper_user;

create unique index if not exists countries_common_name_uindex on data.countries (common_name);
create unique index if not exists countries_iso_3166_1_alpha3_uindex on data.countries (iso_3166_1_alpha3);
create unique index if not exists countries_iso_3166_1_numeric_uindex on data.countries (iso_3166_1_numeric);
create unique index if not exists countries_name_ru_uindex on data.countries (name_ru);
create unique index if not exists countries_native_name_uindex on data.countries (native_name);

/* data.regions */
create table if not exists data.regions
(
    id bigint not null constraint regions_pk primary key,
    country_id bigint not null constraint countries___fk references data.countries on delete cascade,
    name_ru varchar(255) not null,
    name_en varchar(255) not null,
    iso_3166_2 varchar(255) not null,
    iso_a3 varchar(255) not null,
    postal varchar(255) not null,
    lat double precision not null,
    long double precision not null
    );

alter table data.regions owner to icarhelper_user;
