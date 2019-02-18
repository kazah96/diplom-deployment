USE [DiplomDatabase]
GO

INSERT INTO [Action]  (Name, ShortDescription)
VALUES ('Ожидает Согласования', 'Документ ожидает соглосования с директором'),
('Согласован', 'Документ согласован директором'),
('Отклонен', 'Документ не был согласован директором');

INSERT INTO Company (Name, ShortName, Address, ContactDetails)
VALUES ('АЙ-СИС ЛАБС', 'ISYS', 'г.Оренбург, ул. Полежаевская28, офис 304', 'Сайт: www.isys.ru, Номер: +7(901)-184-37-80');


INSERT INTO Subdivision (Name, ShortName)
VALUES ('Департамент бизнес решений', 'Бизнес решения'),
('Департамент проектов 1С', '1С'),
('Департамент технической поддержки', 'Техническая поддержка');

INSERT INTO Position (Name, ShortDescription)
VALUES ('Software Production Business Unit Manager', 'Руководитель отдела производства программного обеспечения'),
('Software Development Engineer', 'Инженер по разработке программного обеспечения'),
('Senior Software Development Engineer', 'Старший инженер по разработке программного обеспечения'),
('Технический директор', 'Технический директор'),
('Software Development Engineer', 'Инженер по разработке программного обеспечения'),
('Junior Software Development Engineer', 'Младший инженер по разработке программного обеспечения'),
('Бухгалтер', 'Бухгалтер');

INSERT INTO DocumentType(Name, ShortDescription)
VALUES ('txt', 'Текстовый формат документа'),
('doc', 'Вордовский формат документов'),
('pdf', ' Межплатформенный открытый формат электронных документов'),
('xls', 'Формат для работы с электронными таблицами');

INSERT INTO Network(Name, ShortDiscription, CompanyID)
VALUES ('Сеть 1', 'Сеть под номером 1', '1'),
('Сеть 2', 'Сеть под номером 2', '1'),
('Сеть 3', 'Сеть под номером 3', '1'),
('Сеть 4', 'Сеть под номером 4', '1');

INSERT INTO Document(Name, ShortDiscription, CreationDate, Path, Status, Size, EditsAndChanges, DocumentTypeID)
VALUES ('Документ номер 1', 'Документ под номером 1', '2019-01-18T11:19:00.000', 'С:\Documents\Document1', 'Edit', '500', 'No Edits', '1'),
('Документ номер 2', 'Документ под номером 2', '2019-01-19T11:19:00.000', 'С:\Documents\Document2', 'Apply', '320', 'No Edits', '2'),
('Документ номер 3', 'Документ под номером 3', '2019-01-20T11:19:00.000', 'С:\Documents\Document3', 'Reject', '480', 'No Edits', '3'),
('Документ номер 4', 'Документ под номером 4', '2019-01-21T11:19:00.000', 'С:\Documents\Document4', 'Edit', '761', 'No Edits', '4');

INSERT INTO RoutePoint(Name, ShortDescription, StageNumber, DocumentTypeID, PositionID, ActionID)
VALUES ('Маршрут 1', 'Маршрут под номером 1', 'Этап 1', '1', '1', '1'),
('Маршрут 2', 'Маршрут под номером 2', 'Этап 2', '2', '2', '2'),
('Маршрут 3', 'Маршрут под номером 3', 'Этап 3', '3', '3', '3'),
('Маршрут 4', 'Маршрут под номером 4', 'Этап 4', '4', '4', '1');

INSERT INTO SecurityInformation(Name, ShortDescription, HashSize, DocumentID)
VALUES ('Информация 1', 'Информация под номером 1', '789', '3'),
('Информация 2', 'Информация под номером 2', '875', '4'),
('Информация 3', 'Информация под номером 3', '561', '5'),
('Информация 4', 'Информация под номером 4', '789', '6');

INSERT INTO MonitoringInformation(Name, ShortDescription, DocumentID, NetworkID)
VALUES ('Монитор 1', 'Монитор под номером 1', '3', '1'),
('Монитор 2', 'Монитор под номером 2', '4', '2'),
('Монитор 3', 'Монитор под номером 3', '5', '3'),
('Монитор 4', 'Монитор под номером 4', '6', '4');

INSERT INTO Employee(Name, Surname, MiddleName, TelephoneNumber, Email, PositionID, SubdivisionID, CompanyID)
VALUES ('Имя1', 'Фамилия1', 'Отчество1', '89013126411', 'mail1@mail.ru', '1', '1', '1'),
('Имя2', 'Фамилия2', 'Отчество2', '89013126412', 'mail2@mail.ru', '2', '2', '1'),
('Имя3', 'Фамилия3', 'Отчество3', '89013126413', 'mail3@mail.ru', '3', '3', '1'),
('Имя4', 'Фамилия4', 'Отчество4', '89013126414', 'mail4@mail.ru', '4', '1', '1');

INSERT INTO DocumentPathHistory(Name, DateAndTimeOfDispatch, DocumentID, EmployeeID)
VALUES ('История пути 1', '2019-01-20T11:19:00.000', '3', '1'),
('История пути 1', '2019-01-18T11:17:00.000', '4', '2'),
('История пути 1', '2019-01-18T11:15:00.000', '5', '3'),
('История пути 1', '2019-01-18T11:13:00.000', '6', '4');