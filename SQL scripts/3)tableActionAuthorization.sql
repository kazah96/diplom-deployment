USE [testDiplomDatabase]
GO

CREATE TABLE ActionAuthorization(
	[ActionAuthorizationID] [int] IDENTITY(1,1),
	[ActionCode] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[ShortDescription] [varchar](250) NULL

)ON [PRIMARY]

GO 

ALTER TABLE ActionAuthorization
ADD CONSTRAINT PK_ActionAuthorization_ActionAuthorizationID PRIMARY KEY CLUSTERED (ActionAuthorizationID)
GO