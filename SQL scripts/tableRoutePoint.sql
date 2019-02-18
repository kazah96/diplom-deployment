USE [DiplomDatabase]
GO

CREATE TABLE RoutePoint(
	[RoutePointID] [int] IDENTITY(1,1),
	[Name] [varchar](100) NOT NULL,
	[ShortDescription] [varchar](250) NULL,
	[StageNumber] [varchar](50) NOT NULL,
	[DocumentTypeID] [int] NOT NULL,
	[PositionID] [int] NOT NULL,
	[ActionID] [int] NOT NULL

)ON [PRIMARY]

GO 


ALTER TABLE RoutePoint
ADD CONSTRAINT PK_RoutePoint_RoutePointID PRIMARY KEY CLUSTERED (RoutePointID)
GO

ALTER TABLE RoutePoint
WITH CHECK ADD CONSTRAINT FK_RoutePoint_DocumentTypeID FOREIGN KEY (DocumentTypeID)
REFERENCES DocumentType (DocumentTypeID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE RoutePoint
WITH CHECK ADD CONSTRAINT FK_RoutePoint_PositionID FOREIGN KEY (PositionID)
REFERENCES Position (PositionID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE RoutePoint
WITH CHECK ADD CONSTRAINT FK_RoutePoint_ActionID FOREIGN KEY (ActionID)
REFERENCES Action (ActionID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

