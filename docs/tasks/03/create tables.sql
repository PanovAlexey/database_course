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

/* data.languages */
create table if not exists data.languages
(
    id bigint not null constraint languages_pk primary key,
    deleted_at timestamp,
    name varchar(255) not null,
    code varchar(255) not null,
    country_id bigint constraint languages_countries_id_fk references data.countries
    );

alter table data.languages owner to icarhelper_user;

create unique index if not exists languages_code_uindex on data.languages (code);
create unique index if not exists languages_country_id_uindex on data.languages (country_id);
create unique index if not exists languages_name_uindex on data.languages (name);

/* data.pictures */
create table if not exists data.pictures
(
    id bigint not null constraint pictures_pk primary key,
    created_at timestamp not null,
    updated_at timestamp,
    path varchar(255) not null
    );

alter table data.pictures owner to icarhelper_user;

/* data.news */
create table if not exists data.news
(
    id bigint not null constraint news_pk primary key,
    created_at timestamp not null,
    updated_at timestamp,
    deleted_at timestamp,
    name varchar(255) not null,
    description text not null,
    picture_id bigint constraint news_pictures_id_fk references data.pictures
    );

alter table data.news owner to icarhelper_user;

create unique index if not exists news_name_uindex on data.news (name);

/* data.articles */
create table if not exists data.articles
(
    id bigint not null constraint articles_pk primary key,
    created_at timestamp not null,
    updated_at timestamp,
    deleted_at timestamp,
    name varchar(255) not null,
    description text not null,
    picture_id bigint constraint articles_pictures_id_fk references data.pictures
    );

alter table data.articles owner to icarhelper_user;

create unique index if not exists articles_name_uindex on data.articles (name);

/* data.users */
create table if not exists data.users
(
    id bigint not null constraint users_pk primary key,
    deleted_at timestamp,
    active boolean not null,
    name varchar(255) not null,
    last_name varchar(255) not null,
    country_id bigint not null,
    created_user_id bigint constraint users_users_id_fk references data.users,
    region_id bigint not null constraint users_regions_id_fk references data.regions,
    locality varchar(255),
    email varchar(255) not null,
    email_verified_at timestamp,
    phone varchar(255) not null,
    phone_verified_at timestamp,
    password varchar(255) not null,
    timezone varchar(255),
    api_token varchar(80),
    picture_id bigint constraint users_pictures_id_fk references data.pictures,
    remember_token varchar(100),
    created_at timestamp not null,
    updated_at timestamp
    );

alter table data.users owner to icarhelper_user;

create unique index if not exists users_email_uindex on data.users (email);
create unique index if not exists users_phone_uindex on data.users (phone);

/* data.products */
create table if not exists data.products
(
    id bigint not null constraint products_pk primary key,
    price numeric(10,2) not null check (price>0),
    name varchar(45) not null
    );

alter table data.products owner to icarhelper_user;

create unique index if not exists products_name_uindex on data.products (name);

/* data.orders */
create table if not exists data.orders
(
    id bigint not null constraint orders_pkey primary key,
    price numeric(10, 2) not null check (price>0),
    user_id bigint not null constraint orders_users_id_fk references data.users
    );

alter table data.orders owner to icarhelper_user;

/* data.baskets */
create table if not exists data.baskets
(
    id bigint not null constraint baskets_pk primary key,
    user_id bigint not null constraint baskets_users_id_fk references data.users,
    order_id bigint not null constraint baskets_orders_id_fk references data.orders,
    product_id bigint not null constraint baskets_products_id_fk references data.products
);

alter table data.baskets owner to icarhelper_user;

/* data.comments */
create table if not exists data.comments
(
    id bigint not null constraint comments_pk primary key,
    deleted_at timestamp,
    created_at timestamp not null,
    updated_at timestamp,
    active boolean not null,
    parent_id bigint constraint comments_comments_id_fk references data.comments,
    commentable_id bigint not null,
    commentable_type varchar(255) not null,
    user_id bigint not null constraint comments_users_id_fk references data.users,
    text text not null
    );

alter table data.comments owner to icarhelper_user;

/* data.events */
create table if not exists data.events
(
    id bigint not null constraint events_pk primary key,
    deleted_at timestamp,
    created_at timestamp not null,
    updated_at timestamp,
    description text not null,
    author_id bigint not null constraint events_users_id_fk references data.users,
    type_id bigint not null constraint events_event_types_id_fk references data.event_types,
    status_id bigint not null constraint events_event_statuses_id_fk references data.event_statuses,
    region_id bigint not null constraint events_regions_id_fk references data.regions,
    locality varchar(255) not null,
    unpublish_note varchar(255),
    lat double precision,
    long double precision
    );

alter table data.events owner to icarhelper_user;

/* data.event_user */
create table if not exists data.event_user
(
    id bigint not null constraint event_user_pk primary key,
    event_id bigint not null constraint event_user_events_id_fk references data.events,
    user_id bigint not null constraint event_user_users_id_fk references data.users,
    is_successful boolean not null,
    created_at timestamp not null,
    updated_at timestamp
);

alter table data.event_user owner to icarhelper_user;

/* data.role_user */
create table if not exists data.role_user
(
    id bigint not null constraint role_user_pk primary key,
    role_id bigint constraint role_user_roles_id_fk references data.roles,
    user_id bigint constraint role_user_users_id_fk references data.users,
    created_at timestamp not null,
    updated_at bigint
);

alter table data.role_user owner to icarhelper_user;
 