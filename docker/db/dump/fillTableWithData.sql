USE [testDiplomDatabase]
GO

INSERT INTO [Action]  (Name, ShortDescription)
VALUES ('��������� �� ������������', '�������� ��������� �� ������������'),
('����������', '�������� ��� ����������'),
('��������', '�������� ��� �������� � ��������� ������� �����������');

INSERT INTO Company (Name, ShortName, Address, ContactDetails)
VALUES ('��-��� ����', 'ISYS', '�.��������, ��. ������������28, ���� 304', '����: www.isys.ru, �����: +7(901)-184-37-80');


INSERT INTO Subdivision (Name, ShortName)
VALUES ('����������� ������ �������', '������ �������'),
('����������� �������� 1�', '1�'),
('����������� ����������� ���������', '����������� ���������');

INSERT INTO ActionAuthorization(ActionCode, Name, ShortDescription)
VALUES ('1', '����', '���� ������������'),
('2', '�����', '����� ������������');

INSERT INTO DocumentType(Name, ShortDescription)
VALUES ('txt', '��������� ������ ���������'),
('doc', '���������� ������ ����������'),
('pdf', ' ���������������� �������� ������ ����������� ����������'),
('xls', '������ ��� ������ � ������������ ���������');

INSERT INTO AccessLevel(Number, Name, ShortDescription)
VALUES ('1', '������ 1', '������� ������� 1'),
('2', '������ 2', '������� ������� 2'),
('3', '������ 3', '������� ������� 3'),
('4', '������ 4', '������� ������� 4');

INSERT INTO ActionStatus(StatusCode, Integrity, Name, ShortDescription)
VALUES ('1', '1', '�������� �������� ������� 1', '�������� �������� 1'),
('2', '0', '�������� �������� ������� 2', '�������� �������� 2'),
('3', '1', '�������� �������� ������� 3', '�������� �������� 3'),
('4', '0', '�������� �������� ������� 4', '�������� �������� 4');

INSERT INTO Position (Name,ShortName, ShortDescription, AccessLevelID)
VALUES ('Software Production Business Unit Manager', 'SPBUM','������������ ������ ������������ ������������ �����������', '1'),
('Software Development Engineer', 'SDE', '������� �� ���������� ������������ �����������', '4'),
('Senior Software Development Engineer', 'SSDE', '������� ������� �� ���������� ������������ �����������', '2'),
('����������� ��������', 'TD', '����������� ��������', '1'),
('Software Development Engineer', 'SDE', '������� �� ���������� ������������ �����������', '1'),
('Junior Software Development Engineer', 'JSDE', '������� ������� �� ���������� ������������ �����������', '3'),
('���������', '�', '���������', '2');

INSERT INTO Employee(Name, Surname, MiddleName, TelephoneNumber, Email, Password, PositionID, SubdivisionID, CompanyID)
VALUES ('���1', '�������1', '��������1', '89013126411', 'mail1@mail.ru', 'qwe', '1', '1', '1'),
('���2', '�������2', '��������2', '89013126412', 'mail2@mail.ru', 'qwe', '2', '2', '1'),
('���3', '�������3', '��������3', '89013126413', 'mail3@mail.ru', 'qwe', '3', '3', '1'),
('���4', '�������4', '��������4', '89013126414', 'mail4@mail.ru', 'qwe', '4', '1', '1');

INSERT INTO EmployeeLogging(Status, ActionAuthorizationID, EmployeeID)
VALUES ('1', '1', '1'),
('0', '1', '2'),
('1', '2', '1'),
('0', '2', '2');

INSERT INTO Document(Name, ShortDiscription, Path, Size, DocumentTypeID)
VALUES ('�������� ����� 1', '�������� ��� ������� 1', '�:\Documents\Document1', '500', '1'),
('�������� ����� 2', '�������� ��� ������� 2', '�:\Documents\Document2', '320', '2'),
('�������� ����� 3', '�������� ��� ������� 3', '�:\Documents\Document3', '480', '3'),
('�������� ����� 4', '�������� ��� ������� 4', '�:\Documents\Document4', '761', '4');

INSERT INTO SecurityInformation(Name, ShortDescription, Hash, DocumentID)
VALUES ('���������� 1', '���������� ��� ������� 1', '789', '3'),
('���������� 2', '���������� ��� ������� 2', '875', '2'),
('���������� 3', '���������� ��� ������� 3', '561', '1'),
('���������� 4', '���������� ��� ������� 4', '789', '1');

INSERT INTO ActionHistory(Name, ActionStatusID, DocumentID, EmployeeID, ActionID)
VALUES ('������� �������� 1', '1', '2', '1', '1'),
('������� �������� 2', '1', '2', '1', '2'),
('������� �������� 3', '2', '2', '1', '1'),
('������� �������� 4', '1', '2', '1', '2');