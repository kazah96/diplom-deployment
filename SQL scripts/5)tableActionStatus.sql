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