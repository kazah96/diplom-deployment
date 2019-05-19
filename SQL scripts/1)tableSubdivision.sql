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