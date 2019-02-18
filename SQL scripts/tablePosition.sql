USE [DiplomDatabase]
GO

CREATE TABLE Position(
	[PositionID] [int] IDENTITY(1,1),
	[Name] [varchar](200) NOT NULL,
	[ShortDescription] [varchar](250) NULL,

)ON [PRIMARY]

GO 


ALTER TABLE Position
ADD CONSTRAINT PK_Position_PositionID PRIMARY KEY CLUSTERED (PositionID)
GO
