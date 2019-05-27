CREATE DATABASE [testDiplomDatabase]
GO
/*-------------------------!!!!!!Alert!!!!!-----------------------------------------*/
--DROP DATABASE [testDiplomDatabase]
--GO
/*----------------------------------------------------------------------------------*/
USE [testDiplomDatabase]
GO

CREATE TABLE Subdivision(
	[SubdivisionID] [int] IDENTITY(1,1),
	[Name] [varchar](100) NOT NULL,
	[ShortName] [varchar](50) NULL
)ON [PRIMARY]

GO 

ALTER TABLE Subdivision
ADD CONSTRAINT PK_Subdivision_SubdivisionID PRIMARY KEY CLUSTERED (SubdivisionID)
GO
/*----------------------------------------------------------------------------------*/
USE [testDiplomDatabase]
GO

CREATE TABLE Company(
	[CompanyID] [int] IDENTITY(1,1),
	[Name] [varchar](100) NOT NULL,
	[ShortName] [varchar](50) NULL,
	[Address] [varchar](250) NOT NULL,
	[ContactDetails] [varchar](250) NULL
)ON [PRIMARY]

GO 

ALTER TABLE Company
ADD CONSTRAINT PK_Company_CompanyID PRIMARY KEY CLUSTERED (CompanyID)
GO
/*----------------------------------------------------------------------------------*/
USE [testDiplomDatabase]
GO

CREATE TABLE ActionAuthorization(
	[ActionAuthorizationID] [int] IDENTITY(1,1),
	[ActionCode] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[ShortDescription] [varchar](250) NULL

)ON [PRIMARY]

GO 

ALTER TABLE ActionAuthorization
ADD CONSTRAINT PK_ActionAuthorization_ActionAuthorizationID PRIMARY KEY CLUSTERED (ActionAuthorizationID)
GO
/*----------------------------------------------------------------------------------*/
USE [testDiplomDatabase]
GO

CREATE TABLE [Action](
	[ActionID] [int] IDENTITY(1,1),
	[Name] [varchar](100) NOT NULL,
	[ShortDescription] [varchar](250) NULL,

)ON [PRIMARY]

GO 


ALTER TABLE [Action]
ADD CONSTRAINT PK_Action_ActionID PRIMARY KEY CLUSTERED (ActionID)
GO
/*----------------------------------------------------------------------------------*/
USE [testDiplomDatabase]
GO

CREATE TABLE ActionStatus(
	[ActionStatusID] [int] IDENTITY(1,1),
	[StatusCode] [int] NOT NULL,
	[Integrity] [BIT] NOT NULL,
	[Name] [varchar](100) NULL,
	[ShortDescription] [varchar](250) NULL

)ON [PRIMARY]

GO 

ALTER TABLE ActionStatus
ADD CONSTRAINT PK_ActionStatus_ActionStatusID PRIMARY KEY CLUSTERED (ActionStatusID)
GO

USE [testDiplomDatabase]
GO
/*----------------------------------------------------------------------------------*/
CREATE TABLE DocumentType(
	[DocumentTypeID] [int] IDENTITY(1,1),
	[Name] [varchar](100) NOT NULL,
	[ShortDescription] [varchar](250) NULL

)ON [PRIMARY]

GO 

ALTER TABLE DocumentType
ADD CONSTRAINT PK_DocumentType_DocumentTypeID PRIMARY KEY CLUSTERED (DocumentTypeID)
GO
/*----------------------------------------------------------------------------------*/
USE [testDiplomDatabase]
GO

CREATE TABLE AccessLevel(
	[AccessLevelID] [int] IDENTITY(1,1),
	[Number] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[ShortDescription] [varchar](250) NULL

)ON [PRIMARY]

GO 

ALTER TABLE AccessLevel
ADD CONSTRAINT PK_AccessLevel_AccessLevelID PRIMARY KEY CLUSTERED (AccessLevelID)
GO
/*----------------------------------------------------------------------------------*/
USE [testDiplomDatabase]
GO

CREATE TABLE Position(
	[PositionID] [int] IDENTITY(1,1),
	[Name] [varchar](200) NOT NULL,
	[ShortName] [varchar](50) NOT NULL,
	[ShortDescription] [varchar](250) NULL,
	[AccessLevelID] [int] NOT NULL
)ON [PRIMARY]

GO 


ALTER TABLE Position
ADD CONSTRAINT PK_Position_PositionID PRIMARY KEY CLUSTERED (PositionID)
GO

ALTER TABLE Position
WITH CHECK ADD CONSTRAINT FK_Position_AccessLevelID FOREIGN KEY (AccessLevelID)
REFERENCES AccessLevel (AccessLevelID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
/*----------------------------------------------------------------------------------*/
USE [testDiplomDatabase]
GO

CREATE TABLE Employee(
	[EmployeeID] [int] IDENTITY(1,1),
	[Name] [varchar](100) NOT NULL,
	[Surname] [varchar](200) NOT NULL,
	[MiddleName] [varchar](200) NULL,
	[TelephoneNumber] [varchar](25) NULL,
	[Email] [char](70) NOT NULL,
	[Password] [varchar](70) NOT NULL,
	[PositionID] [int] NOT NULL,
	[SubdivisionID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL
)ON [PRIMARY]

GO 

ALTER TABLE Employee
ADD CONSTRAINT PK_Employee_EmployeeID PRIMARY KEY CLUSTERED (EmployeeID)
GO

ALTER TABLE Employee
WITH CHECK ADD CONSTRAINT FK_Employee_PositionID FOREIGN KEY (PositionID)
REFERENCES Position (PositionID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE Employee
WITH CHECK ADD CONSTRAINT FK_Employee_SubdivisionID FOREIGN KEY (SubdivisionID)
REFERENCES Subdivision (SubdivisionID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE Employee
WITH CHECK ADD CONSTRAINT FK_Employee_CompanyID FOREIGN KEY (CompanyID)
REFERENCES Company (CompanyID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
/*----------------------------------------------------------------------------------*/
USE [testDiplomDatabase]
GO

CREATE TABLE EmployeeLogging(
	[EmployeeLoggingID] [int] IDENTITY(1,1),
	[Date] [datetime] NOT NULL,
	[Status] [BIT] NOT NULL,
	[ActionAuthorizationID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL

)ON [PRIMARY]

GO 

ALTER TABLE EmployeeLogging
ADD CONSTRAINT [DF_EmployeeLogging_Date] DEFAULT (getdate()) FOR [Date]
GO

ALTER TABLE EmployeeLogging
ADD CONSTRAINT PK_EmployeeLogging_EmployeeLoggingID PRIMARY KEY CLUSTERED (EmployeeLoggingID)
GO

ALTER TABLE EmployeeLogging
WITH CHECK ADD CONSTRAINT FK_EmployeeLogging_ActionAuthorizationID FOREIGN KEY (ActionAuthorizationID)
REFERENCES ActionAuthorization (ActionAuthorizationID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE EmployeeLogging
WITH CHECK ADD CONSTRAINT FK_EmployeeLogging_EmployeeID FOREIGN KEY (EmployeeID)
REFERENCES Employee (EmployeeID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
/*----------------------------------------------------------------------------------*/
USE [testDiplomDatabase]
GO

CREATE TABLE Document(
	[DocumentID] [int] IDENTITY(1,1),
	[Name] [varchar](100) NOT NULL,
	[ShortDiscription] [varchar](250) NULL,
	[CreationDate] [datetime] NOT NULL,
	[Path] [char](250) NOT NULL,
	[Size] [float](24) NOT NULL,
	[DocumentTypeID] [int] NOT NULL

)ON [PRIMARY]

GO 

ALTER TABLE Document
ADD CONSTRAINT [DF_Document_CreationDate] DEFAULT (getdate()) FOR [CreationDate]
GO

ALTER TABLE Document
ADD CONSTRAINT PK_Document_DocumentID PRIMARY KEY CLUSTERED (DocumentID)
GO

ALTER TABLE Document
WITH CHECK ADD CONSTRAINT FK_Document_DocumentTypeID FOREIGN KEY (DocumentTypeID)
REFERENCES DocumentType (DocumentTypeID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
/*----------------------------------------------------------------------------------*/
USE [testDiplomDatabase]
GO

CREATE TABLE SecurityInformation(
	[SecurityInformationID] [int] IDENTITY(1,1),
	[Name] [varchar](100) NOT NULL,
	[ShortDescription] [varchar](250) NULL,
	[Hash] [varchar](150) NOT NULL,
	[DocumentID] [int] NOT NULL

)ON [PRIMARY]

GO 

ALTER TABLE SecurityInformation
ADD CONSTRAINT PK_SecurityInformationt_SecurityInformationID PRIMARY KEY CLUSTERED (SecurityInformationID)
GO

ALTER TABLE SecurityInformation
WITH CHECK ADD CONSTRAINT FK_SecurityInformation_DocumentID FOREIGN KEY (DocumentID)
REFERENCES Document (DocumentID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
/*----------------------------------------------------------------------------------*/
USE [testDiplomDatabase]
GO

CREATE TABLE ActionHistory(
	[ActionHistoryID] [int] IDENTITY(1,1),
	[Name] [varchar](200) NOT NULL,
	[Date] [datetime] NOT NULL,
	[ActionStatusID] [int] NOT NULL,
	[DocumentID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[ActionID] [int] NOT NULL

)ON [PRIMARY]

GO 

ALTER TABLE ActionHistory
ADD CONSTRAINT [DF_ActionHistory_Date] DEFAULT (getdate()) FOR [Date]
GO

ALTER TABLE ActionHistory
ADD CONSTRAINT PK_ActionHistory_ActionHistoryID PRIMARY KEY CLUSTERED (ActionHistoryID)
GO

ALTER TABLE ActionHistory
WITH CHECK ADD CONSTRAINT FK_ActionHistory_ActionStatusID FOREIGN KEY (ActionStatusID)
REFERENCES ActionStatus (ActionStatusID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE ActionHistory
WITH CHECK ADD CONSTRAINT FK_ActionHistory_DocumentID FOREIGN KEY (DocumentID)
REFERENCES Document (DocumentID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE ActionHistory
WITH CHECK ADD CONSTRAINT FK_ActionHistory_EmployeeID FOREIGN KEY (EmployeeID)
REFERENCES Employee (EmployeeID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE ActionHistory
WITH CHECK ADD CONSTRAINT FK_ActionHistory_ActionID FOREIGN KEY (ActionID)
REFERENCES [Action] (ActionID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
/*----------------------------------------------------------------------------------*/