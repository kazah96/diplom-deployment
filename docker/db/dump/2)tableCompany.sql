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
