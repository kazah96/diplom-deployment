USE [DiplomDatabase]
GO

CREATE TABLE Network(
	[NetworkID] [int] IDENTITY(1,1),
	[Name] [varchar](100) NOT NULL,
	[ShortDiscription] [varchar](250) NULL,
	[CompanyID] [int] NOT NULL
)ON [PRIMARY]

GO 

ALTER TABLE Network
ADD CONSTRAINT PK_Network_NetworkID PRIMARY KEY CLUSTERED (NetworkID)
GO

ALTER TABLE Network
WITH CHECK ADD CONSTRAINT FK_Network_CompanyID FOREIGN KEY (CompanyID)
REFERENCES Company (CompanyID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

