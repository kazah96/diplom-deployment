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
