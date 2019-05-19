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
ADD CONSTRAINT [DF_EmployeeLogging_CreationDate] DEFAULT (getdate()) FOR [CreationDate]
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
