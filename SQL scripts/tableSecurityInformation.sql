USE [DiplomDatabase]
GO

CREATE TABLE SecurityInformation(
	[SecurityInformationID] [int] IDENTITY(1,1),
	[Name] [varchar](100) NOT NULL,
	[ShortDescription] [varchar](250) NULL,
	[HashSize] [float](24) NOT NULL

)ON [PRIMARY]

GO 

ALTER TABLE SecurityInformation
ADD CONSTRAINT PK_SecurityInformationt_SecurityInformationID PRIMARY KEY CLUSTERED (SecurityInformationID)
GO