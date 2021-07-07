/* service.password_resets */
create table if not exists service.password_resets
(
    id bigserial constraint password_resets_pk primary key,
    email varchar(255) not null,
    token varchar(255) not null
    );

alter table service.password_resets owner to icarhelper_user;
