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