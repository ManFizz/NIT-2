# СИТ - Лабораторная №2

---
## Задание
Выбрать предметную область, для которой будет разрабатываться web-приложение (любая предметная область с необходимостью обработки данных, НЕ ИНТЕРНЕТ-МАГАЗИН).  ОБЯЗАТЕЛЬНО СОГЛАСОВАТЬ ТЕМУ С ПРЕПОДАВАТЕЛЕМ!

Создать концептуальную, логическую и физическую модели базы данных для выбранной предметной области, описать модели в произвольном виде (физическая модель должна включать не менее пяти таблиц).

Выполнить создание базы данных и наполнение таблиц (SQLite и Python) (суммарно во всех таблицах вместе не менее 100 записей).

Реализовать запросы на выборку:
- два запроса на выборку для связанных таблиц с условиями и сортировкой;

- два запроса с группировкой и групповыми функциями;

- два запроса со вложенными запросами или табличными выражениями;

- два запроса корректировки данных (обновление, добавление, удаление и пр)
---
## Выполнение
Предметная область: **ToDo Plus**

Модели данных:
- Концептуальная
![](/Conceptual.png)
- Физическая/Логическая
![](/Logical_Physical.png)

В файле `task.sql` содежатся запросы для создания и наполнения базы данных

Реализованные запросы на выборку:
- два запроса на выборку для связанных таблиц с условиями и сортировкой;
```sql
 -- Выборка задач из определенной группы
SELECT t.Title, l.LabelName
FROM Tasks t
JOIN TaskLabels tl ON t.TaskID = tl.TaskID
JOIN Labels l ON tl.LabelID = l.LabelID
WHERE t.GroupID = 1;
```

```sql
-- Выборка истории действий пользователя по UserID с сортировкой по времени
SELECT ActionID, ActionDescription, DateTime
FROM UserActionsHistory
WHERE UserID = 1
ORDER BY DateTime DESC;
```
- два запроса с группировкой и групповыми функциями;
```sql
-- Группировка по UserID и подсчет количества меток у каждого пользователя
SELECT UserID, COUNT(LabelID) AS LabelCount
FROM TaskLabels
GROUP BY UserID;
```

```sql
-- Получение среднего времени выполнения задач для каждой группы
SELECT GroupID, AVG(DueDate) AS AverageDueDate
FROM Tasks
GROUP BY GroupID;
```

- два запроса со вложенными запросами или табличными выражениями;
```sql
-- Использование вложенного запроса для выбора задач из определенной группы
SELECT *
FROM Tasks
WHERE GroupID = (SELECT GroupID FROM TaskGroups WHERE GroupName = 'Group1');
```

```sql
-- Использование табличного выражения для объединения таблиц
WITH TaskLabelInfo AS (
    SELECT t.TaskID, t.Title, l.LabelName
    FROM Tasks t
    JOIN TaskLabels tl ON t.TaskID = tl.TaskID
    JOIN Labels l ON tl.LabelID = l.LabelID
)
SELECT *
FROM TaskLabelInfo;
```

- два запроса корректировки данных (обновление, добавление, удаление и пр)

```sql
-- Добавление нового пользователя
INSERT INTO Users (UserName, PasswordHash)
VALUES ('newuser', 'newpasswordhash');
```

```sql
-- Обновление названия группы задач
UPDATE TaskGroups
SET GroupName = 'NewGroupName'
WHERE GroupID = 1;
```