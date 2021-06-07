## Task 2

### Схема
[Ссылка на sqldbm (требуется авторизация)](https://app.sqldbm.com/MySQL/Edit/p195366/)
##### Логин: "wgw64138@boofx.com"
##### Пароль: "sdfLK359sdj" 


---

### Анализ возможных запросов/отчетов/поиска данных.

В качестве самой популярной нагрузки ожидается чтение списка событий (таблица events).
Одновременно будет происходить получение данных из связных таблиц:
 1) страна (поле country_id с ссылкой на таблицу _countries_)
 2) регион (поле region_id с ссылкой на таблицу _regions_)
 3) автор (поле author_id с ссылкой на таблицу _users_)

 По всем трем необходимо создать индексы (если в используемой СУБД
 не предусмотрено автоматическое покрытие индексами всех создаваемых внешних ключей). 


Второй по популярности ожидается выборка событий (из таблицы _events_) с использованием
фильтров:
1) тип события (поле type_id с ссылкой на таблицу _event_types_)
2) дата события (поле created_at)

По дате события помимо фильтрации будет производиться и основная сортировка.

Третьей важной частью бизнес логики является детальная карточка события.
На ней необходимо помимо имеющейся в таблице _events_ информации получить:
1) комментарии (поля commentable_id и commentable_type в таблице _comments_)

---

### Список индексов и анализ кардинальности (cardinality) полей.

Предварительно необходимо добавить индексы на следующие поля:
- таблица _events_, поле country_id - кардинальность низкая или средняя 
(в зависимости от количества стран, в которых будет вестись работа сервиса)
- таблица _events_, поле region_id - кардинальность средняя
- таблица _events_, поле author_id - кардинальность средняя
- таблица _events_, поле type_id - кардинальность низкая
- таблица _events_, поле created_at - кардинальность высокая
- таблица _comments_, поле commentable_id - кардинальность высокая
- таблица _comments_, поле commentable_type - кардинальность низкая

Остальные индексы будут создаваться/модифицироваться по мере анализа производительности
приложения под реальной нагрузкой.

---

## Список необходимых ограничений (constraints).
Список ранее озвученных первичных и внешних ключей составляют существенную долю
ограничений. Однако, для повышения целостности данных и надежности работы сервиса
необходимо добавить следующий список ограничений:
- таблица _products_, поле price - **NOT NULL**, **CHECK (price>0)**
- таблица _products_, поле name - **NOT NULL**, **UNIQUE**


- таблица _baskets_, поле user - **NOT NULL**
- таблица _baskets_, поле orders - **NOT NULL**, **UNIQUE**
- таблица _baskets_, поле product - **NOT NULL**


- таблица _orders_, поле price - **NOT NULL**, **CHECK (price>0)**
- таблица _orders_, поле user - **NOT NULL**


- таблица _events_, поле created_at - **NOT NULL**
- таблица _events_, поле country_id - **NOT NULL**
- таблица _events_, поле region_id - **NOT NULL**


- таблица _users_, поле email - **NOT NULL**, **UNIQUE**
- таблица _users_, поле phone - **NOT NULL**, **UNIQUE**


- таблица _roles_, поле name- **UNIQUE**
- таблица _roles_, поле created_at - **NOT NULL**


- таблица _role_user_, поле role_id - **NOT NULL**
- таблица _role_user_, поле user_id - **NOT NULL**


- таблица _articles_, поле created_at - **NOT NULL**
- таблица _articles_, поле name - **NOT NULL**, **UNIQUE**


- таблица _news_, поле created_at - **NOT NULL**
- таблица _news_, поле name - **NOT NULL**, **UNIQUE**


- таблица _language_, поле name - **NOT NULL**, **UNIQUE**
- таблица _language_, поле code - **NOT NULL**, **UNIQUE**


- таблица _pictures_, поле created_at - **NOT NULL**
- таблица _pictures_, поле path - **NOT NULL**, **UNIQUE**

- таблица _event_pictures_, поле created_at - **NOT NULL**


- таблица _event_statuses_, поле created_at - **NOT NULL**
- таблица _event_statuses_, поле name - **NOT NULL**, **UNIQUE**


- таблица _event_user_, поле is_successful - **NOT NULL**


- таблица _password_resets_, поле created_at - **NOT NULL**
- таблица _password_resets_, поле email - **NOT NULL**
- таблица _password_resets_, поле token - **NOT NULL**, **UNIQUE**


- таблица _comments_, поле created_at - **NOT NULL**
- таблица _comments_, поле active - **NOT NULL**
- таблица _comments_, поле commentable_id - **NOT NULL**
- таблица _comments_, поле commentable_type - **NOT NULL**
- таблица _comments_, поле user_id - **NOT NULL**

---

[На главную](https://github.com/PanovAlexey/database_course/blob/main/README.md)