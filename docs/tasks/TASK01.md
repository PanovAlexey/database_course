## Task 1

### Схема
[Ссылка на sqldbm (требуется авторизация)](https://app.sqldbm.com/MySQL/Edit/p195366/)
##### Логин: "wgw64138@boofx.com"
##### Пароль: "sdfLK359sdj" 


---

### Описание БД
- ***users*** - список пользователей.
- ***events*** - таблица, содержащая основную информацию о созданных 
пользователями событиях.
- ***comments*** - список комментариев. Содержат привязку к автору и к какой-либо сущности, 
например, к событию или к новости. Так же может устанавливаться 
привязка к родительскому комментарию для поддержки иерархического вывода.
- ***event_types*** - таблица, содержащая список типов событий. 
Например: *кончилось топливо*, *необходим мобильный шиномонтаж*.
- ***event_statuses*** - таблица, содержащая список возможных статусов события,
например: *активна*, *закрыта*, *на модерации*.
- ***event_participants*** - таблица содержит связь событий и пользователей. 
Каждый пользователей может принимать участие одновременно в нескольких событиях.
Поэтому, связь является "многие-ко-многим". Дополнительно содержит поле-флаг, 
обозначающее, оказал ли пользователь помощь в данном событии.
- ***pictures*** - список ссылок на изображения, используемые в проекте.
- ***event_pictures*** - таблица для связи между изображениями и событиями.
Необходима, т.к. у каждого событиях может быть более одного изображения.
- ***countries*** - таблица для хранения информации о странах и используемых кодах 
телефонных номеров.
- ***regions*** - в дополнение к таблице со списком стран содержит список регионов,
что позволит более точно задавать местоположение события для последующей фильтрации
и выдаче наиболее подходящим пользователям.
- ***languages*** - список языков, используемых в системе.
- ***products*** - список услуг, доступных к покупке. 
Например: *выделение события жирным шрифтом в общем списке*, 
*подъем события наверх в общем списке*.
- ***baskets*** - таблица содержит привязку к пользователю и к продуктам,
добавленным в корзину.
- ***orders*** - таблица содержит информацию о сумме оплаты и привязку к корзине
с продуктами (оплаченными услугами).

Таблицы, содержащие миграции, новости, статьи итд являются типовыми и не связаны
с основной бизнес логикой проекта.
---
## Примеры бизнес-задач которые решает база
- Хранение данных
- Установка и обеспечение связей между различными таблицами (сущностями)
- Предоставление доп. слоя управления правами доступа (для администратора, 
пользователей, системы аналитики или полнотекстового поиска итд)
- Резервное копирование
---
## Рекомендации к использованию репликации
 На начальном этапе будет реализована Master-Salve репликация
---
## Рекомендации к резервному копированию
Для большей надежности будет использовано два вида резервирования:
- создание полного бэкапа два раза в сутки
- инкрементное резервное копирование изменений, произведенных в данных во 
время заданного небольшого промежутка времени

[На главную](https://github.com/PanovAlexey/database_course/blob/main/README.md)