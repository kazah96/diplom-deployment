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