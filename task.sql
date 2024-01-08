CREATE TABLE Users (
    UserID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserName TEXT,
    PasswordHash TEXT
);

CREATE TABLE TaskGroups (
    GroupID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserID INTEGER,
    GroupName TEXT,
    Priority INTEGER DEFAULT 0,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Tasks (
    TaskID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserID INTEGER,
    GroupID INTEGER,
    Title TEXT,
    Description TEXT,
    DueDate DATE DEFAULT (datetime('now','localtime')),
    StatusID INTEGER,
    Priority INTEGER DEFAULT 0,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (GroupID) REFERENCES TaskGroups(GroupID),
    FOREIGN KEY (StatusID) REFERENCES TaskStatuses(StatusID)
);

CREATE TABLE Labels (
    LabelID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserID INTEGER,
    LabelName TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE TaskLabels (
    TaskID INTEGER,
    LabelID INTEGER,
    PRIMARY KEY (TaskID, LabelID),
    FOREIGN KEY (TaskID) REFERENCES Tasks(TaskID),
    FOREIGN KEY (LabelID) REFERENCES Labels(LabelID)
);

CREATE TABLE UserActions (
    ActionID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserID INTEGER,
    ActionDescription TEXT,
    DateTime DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE TaskStatuses (
    StatusID INTEGER PRIMARY KEY AUTOINCREMENT,
    StatusName TEXT
);

INSERT INTO Users (UserName, PasswordHash)
VALUES
('user1', 'password_hash1'),
('user2', 'password_hash2'),
('user3', 'password_hash3'),
('user4', 'password_hash'),
('user5', 'password_hash'),
('user6', 'password_hash'),
('user7', 'password_hash'),
('user8', 'password_hash'),
('user9', 'password_hash'),
('user10', 'password_hash'),
('user11', 'password_hash');

INSERT INTO TaskGroups (UserID, GroupName)
VALUES
(1, 'Group 1'),
(1, 'Group 2'),
(2, 'Group 3'),
(3, 'Group 4'),
(4, 'Group 5'),
(4, 'Group 6'),
(4, 'Mega group 7');

INSERT INTO Tasks (UserID, GroupID, Title, Description, DueDate, StatusID)
VALUES
(1, 1, 'Task 1', 'Description for Task 1', '2023-10-15', 1),
(1, 1, 'Task 2', 'Description for Task 2', '2023-10-20', 2);
INSERT INTO Tasks (UserID, GroupID, Title, Description, StatusID)
VALUES
(1, 2, 'Task 3', 'Description for Task', 2),
(2, 3, 'Task 4', 'Description for Task', 1),
(3, 4, 'Task 5', 'Description for Task', 2),
(4, 5, 'Task 6', 'Description for Task', 3),
(4, 6, 'Task 7', 'Description for Task', 3),
(4, 7, 'Task 8', 'Description for Task', 1),
(4, 5, 'Task 9', 'Description for Task', 3),
(4, 6, 'Task 10', 'Description for Task', 3),
(4, 7, 'Task 11', 'Description for Task', 3),
(4, 7, 'Task 12', 'Description for Task', 1),
(4, 7, 'Task 13', 'Description for Task', 2),
(4, 7, 'Task 14', 'Description for Task', 1),
(4, 7, 'Task 15', 'Description for Task', 2),
(4, 7, 'Task 16', 'Description for Task', 3),
(4, 7, 'Task 17', 'Description for Task', 3),
(4, 7, 'Task 18', 'Description for Task', 1),
(4, 7, 'Task 19', 'Description for Task', 3),
(4, 7, 'Task 21', 'Description for Task', 3),
(4, 7, 'Task 22', 'Description for Task', 1),
(4, 7, 'Task 23', 'Description for Task', 2),
(4, 7, 'Task 24', 'Description for Task', 1),
(4, 7, 'Task 25', 'Description for Task', 2),
(4, 7, 'Task 26', 'Description for Task', 3),
(4, 7, 'Task 27', 'Description for Task', 3),
(4, 7, 'Task 28', 'Description for Task', 1),
(4, 7, 'Task 29', 'Description for Task', 3),
(4, 7, 'Task 31', 'Description for Task', 3),
(4, 7, 'Task 32', 'Description for Task', 1),
(4, 7, 'Task 33', 'Description for Task', 2),
(4, 7, 'Task 34', 'Description for Task', 1),
(4, 7, 'Task 35', 'Description for Task', 2),
(4, 7, 'Task 36', 'Description for Task', 3),
(4, 7, 'Task 37', 'Description for Task', 3),
(4, 7, 'Task 38', 'Description for Task', 1),
(4, 7, 'Task 39', 'Description for Task', 3),
(4, 7, 'Task 41', 'Description for Task', 3),
(4, 7, 'Task 42', 'Description for Task', 1),
(4, 7, 'Task 43', 'Description for Task', 1),
(4, 7, 'Task 44', 'Description for Task', 1),
(4, 7, 'Task 45', 'Description for Task', 1),
(4, 7, 'Task 46', 'Description for Task', 1),
(4, 7, 'Task 47', 'Description for Task', 1),
(4, 7, 'Task 48', 'Description for Task', 1),
(4, 7, 'Task 49', 'Description for Task', 1),
(4, 7, 'Task 51', 'Description for Task', 1),
(4, 7, 'Task 52', 'Description for Task', 1),
(4, 7, 'Task 53', 'Description for Task', 1),
(4, 7, 'Task 54', 'Description for Task', 1),
(4, 7, 'Task 55', 'Description for Task', 1),
(4, 7, 'Task 56', 'Description for Task', 1),
(4, 7, 'Task 57', 'Description for Task', 1),
(4, 7, 'Task 58', 'Description for Task', 1),
(4, 7, 'Task 59', 'Description for Task', 1),
(4, 7, 'Task 61', 'Description for Task', 1),
(4, 7, 'Task 62', 'Description for Task', 1),
(4, 7, 'Task 63', 'Description for Task', 1),
(4, 7, 'Task 64', 'Description for Task', 1),
(4, 7, 'Task 65', 'Description for Task', 1),
(4, 7, 'Task 66', 'Description for Task', 1),
(4, 7, 'Task 67', 'Description for Task', 1),
(4, 7, 'Task 68', 'Description for Task', 1),
(4, 7, 'Task 69', 'Description for Task', 1),
(4, 7, 'Task 71', 'Description for Task', 1),
(4, 7, 'Task 72', 'Description for Task', 1),
(4, 7, 'Task 73', 'Description for Task', 1),
(4, 7, 'Task 74', 'Description for Task', 1),
(4, 7, 'Task 75', 'Description for Task', 1),
(4, 7, 'Task 76', 'Description for Task', 1),
(4, 7, 'Task 77', 'Description for Task', 1),
(4, 7, 'Task 78', 'Description for Task', 1),
(4, 7, 'Task 79', 'Description for Task', 1),
(4, 7, 'Task 81', 'Description for Task', 1),
(4, 7, 'Task 82', 'Description for Task', 1),
(4, 7, 'Task 83', 'Description for Task', 1),
(4, 7, 'Task 84', 'Description for Task', 1),
(4, 7, 'Task 85', 'Description for Task', 1),
(4, 7, 'Task 86', 'Description for Task', 1),
(4, 7, 'Task 87', 'Description for Task', 1),
(4, 7, 'Task 88', 'Description for Task', 1),
(4, 7, 'Task 89', 'Description for Task', 1),
(4, 7, 'Task 91', 'Description for Task', 1),
(4, 7, 'Task 92', 'Description for Task', 1),
(4, 7, 'Task 93', 'Description for Task', 1),
(4, 7, 'Task 94', 'Description for Task', 1),
(4, 7, 'Task 95', 'Description for Task', 1),
(4, 7, 'Task 96', 'Description for Task', 1),
(4, 7, 'Task 97', 'Description for Task', 1),
(4, 7, 'Task 98', 'Description for Task', 1),
(4, 7, 'Task 99', 'Description for Task', 1),
(4, 7, 'Task 101', 'Description for Task', 1),
(4, 7, 'Task 102', 'Description for Task', 1),
(4, 7, 'Task 103', 'Description for Task', 1),
(4, 7, 'Task 104', 'Description for Task', 1),
(4, 7, 'Task 105', 'Description for Task', 1),
(4, 7, 'Task 106', 'Description for Task', 1),
(4, 7, 'Task 107', 'Description for Task', 1),
(4, 7, 'Task 108', 'Description for Task', 1),
(4, 7, 'Task 109', 'Description for Task', 1),
(4, 7, 'Task 111', 'Description for Task', 1),
(4, 7, 'Task 112', 'Description for Task', 1),
(4, 7, 'Task 113', 'Description for Task', 1),
(4, 7, 'Task 114', 'Description for Task', 1),
(4, 7, 'Task 115', 'Description for Task', 1),
(4, 7, 'Task 116', 'Description for Task', 1),
(4, 7, 'Task 117', 'Description for Task', 1),
(4, 7, 'Task 118', 'Description for Task', 1),
(4, 7, 'Task 119', 'Description for Task', 1);

INSERT INTO Labels (UserID, LabelName)
VALUES
(4, 'Critical'),
(4, 'Boring'),
(4, 'IDK'),
(4, 'Deadline'),
(4, 'Trash');

INSERT INTO TaskStatuses (StatusName)
VALUES
('Completed'),
('In progress'),
('Await'),
('Pending');

INSERT INTO TaskLabels (TaskID, LabelID)
VALUES
(6, 4),
(3, 4),
(8, 4),
(7, 4),
(9, 4),
(12, 4),
(14, 4);

 -- Пример условия: выборка задач из определенной группы
SELECT
    Tasks.TaskID,
    Tasks.UserID,
    Tasks.GroupID,
    Tasks.Title,
    Tasks.Description,
    Tasks.DueDate,
    TaskStatuses.StatusName AS TaskStatus,
    Labels.LabelName AS Label
FROM
    Tasks
LEFT JOIN
    TaskStatuses ON Tasks.StatusID = TaskStatuses.StatusID
LEFT JOIN
    TaskLabels ON Tasks.TaskID = TaskLabels.TaskID
LEFT JOIN
    Labels ON TaskLabels.LabelID = Labels.LabelID
WHERE
    Tasks.GroupID = 1;


 -- Пример UserID
SELECT
    Tasks.TaskID,
    Tasks.UserID AS TaskUserID,
    Users.UserName AS TaskUserName,
    Tasks.GroupID,
    Tasks.Title,
    Tasks.Description,
    Tasks.DueDate,
    TaskStatuses.StatusName AS TaskStatus,
    Labels.LabelName AS Label,
    Users.UserID AS UserID,
    Users.UserName AS UserName,
    Users.PasswordHash
FROM
    Tasks
LEFT JOIN
    TaskStatuses ON Tasks.StatusID = TaskStatuses.StatusID
LEFT JOIN
    TaskLabels ON Tasks.TaskID = TaskLabels.TaskID
LEFT JOIN
    Labels ON TaskLabels.LabelID = Labels.LabelID
LEFT JOIN
    Users ON Tasks.UserID = Users.UserID
WHERE
    Tasks.GroupID = 1;


 -- TaskID и количество его меток
SELECT
    Tasks.TaskID,
    COUNT(TaskLabels.LabelID) AS LabelCount
FROM
    Tasks
LEFT JOIN
    TaskLabels ON Tasks.TaskID = TaskLabels.TaskID
GROUP BY
    Tasks.TaskID;


 -- Группа и средня дата
SELECT GroupID, AVG(DueDate) AS AverageDueDate
FROM Tasks
GROUP BY GroupID;

 -- Показать все задачи групп с одинаковым названием "Mega group 7"
SELECT *
FROM Tasks
WHERE GroupID = (SELECT GroupID FROM TaskGroups WHERE GroupName = 'Mega group 7');

INSERT INTO Users (UserName, PasswordHash)
VALUES ('new user', 'new password hash');

UPDATE TaskGroups
SET GroupName = 'NewGroupName'
WHERE GroupID = 1;
