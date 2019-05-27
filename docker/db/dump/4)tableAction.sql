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
