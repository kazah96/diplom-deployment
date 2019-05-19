USE [testDiplomDatabase]
GO

INSERT INTO [Action]  (Name, ShortDescription)
VALUES ('Отправлен на согласование', 'Документ отправлен на согласование'),
('Согласован', 'Документ был согласован'),
('Отклонен', 'Документ был отклонен и отправлен обратно отправителю');

INSERT INTO Company (Name, ShortName, Address, ContactDetails)
VALUES ('АЙ-СИС ЛАБС', 'ISYS', 'г.Оренбург, ул. Полежаевская28, офис 304', 'Сайт: www.isys.ru, Номер: +7(901)-184-37-80');


INSERT INTO Subdivision (Name, ShortName)
VALUES ('Департамент бизнес решений', 'Бизнес решения'),
('Департамент проектов 1С', '1С'),
('Департамент технической поддержки', 'Техническая поддержка');

INSERT INTO ActionAuthorization(ActionCode, Name, ShortDescription)
VALUES ('1', 'Вход', 'Вход пользователя'),
('2', 'Выход', 'Выход пользователя');

INSERT INTO DocumentType(Name, ShortDescription)
VALUES ('txt', 'Текстовый формат документа'),
('doc', 'Вордовский формат документов'),
('pdf', ' Межплатформенный открытый формат электронных документов'),
('xls', 'Формат для работы с электронными таблицами');

INSERT INTO AccessLevel(Number, Name, ShortDescription)
VALUES ('1', 'Доступ 1', 'Уровень доступа 1'),
('2', 'Доступ 2', 'Уровень доступа 2'),
('3', 'Доступ 3', 'Уровень доступа 3'),
('4', 'Доступ 4', 'Уровень доступа 4');

INSERT INTO ActionStatus(StatusCode, Integrity, Name, ShortDescription)
VALUES ('1', '1', 'Название действия статуса 1', 'Короткое описание 1'),
('2', '0', 'Название действия статуса 2', 'Короткое описание 2'),
('3', '1', 'Название действия статуса 3', 'Короткое описание 3'),
('4', '0', 'Название действия статуса 4', 'Короткое описание 4');

INSERT INTO Position (Name,ShortName, ShortDescription, AccessLevelID)
VALUES ('Software Production Business Unit Manager', 'SPBUM','Руководитель отдела производства программного обеспечения', '1'),
('Software Development Engineer', 'SDE', 'Инженер по разработке программного обеспечения', '4'),
('Senior Software Development Engineer', 'SSDE', 'Старший инженер по разработке программного обеспечения', '2'),
('Технический директор', 'TD', 'Технический директор', '1'),
('Software Development Engineer', 'SDE', 'Инженер по разработке программного обеспечения', '1'),
('Junior Software Development Engineer', 'JSDE', 'Младший инженер по разработке программного обеспечения', '3'),
('Бухгалтер', 'Б', 'Бухгалтер', '2');

INSERT INTO Employee(Name, Surname, MiddleName, TelephoneNumber, Email, Password, PositionID, SubdivisionID, CompanyID)
VALUES ('Имя1', 'Фамилия1', 'Отчество1', '89013126411', 'mail1@mail.ru', 'qwe', '1', '1', '1'),
('Имя2', 'Фамилия2', 'Отчество2', '89013126412', 'mail2@mail.ru', 'qwe', '2', '2', '1'),
('Имя3', 'Фамилия3', 'Отчество3', '89013126413', 'mail3@mail.ru', 'qwe', '3', '3', '1'),
('Имя4', 'Фамилия4', 'Отчество4', '89013126414', 'mail4@mail.ru', 'qwe', '4', '1', '1');

INSERT INTO EmployeeLogging(Status, ActionAuthorizationID, EmployeeID)
VALUES ('1', '1', '1'),
('0', '1', '2'),
('1', '2', '1'),
('0', '2', '2');

INSERT INTO Document(Name, ShortDiscription, Path, Size, DocumentTypeID)
VALUES ('Документ номер 1', 'Документ под номером 1', 'С:\Documents\Document1', '500', '1'),
('Документ номер 2', 'Документ под номером 2', 'С:\Documents\Document2', '320', '2'),
('Документ номер 3', 'Документ под номером 3', 'С:\Documents\Document3', '480', '3'),
('Документ номер 4', 'Документ под номером 4', 'С:\Documents\Document4', '761', '4');

INSERT INTO SecurityInformation(Name, ShortDescription, Hash, DocumentID)
VALUES ('Информация 1', 'Информация под номером 1', '789', '3'),
('Информация 2', 'Информация под номером 2', '875', '2'),
('Информация 3', 'Информация под номером 3', '561', '1'),
('Информация 4', 'Информация под номером 4', '789', '1');

INSERT INTO ActionHistory(Name, ActionStatusID, DocumentID, EmployeeID, ActionID)
VALUES ('История действий 1', '1', '2', '1', '1'),
('История действий 2', '1', '2', '1', '2'),
('История действий 3', '2', '2', '1', '1'),
('История действий 4', '1', '2', '1', '2');