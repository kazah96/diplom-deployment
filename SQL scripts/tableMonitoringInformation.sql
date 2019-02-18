USE [DiplomDatabase]
GO

CREATE TABLE MonitoringInformation(
	[MonitoringInformationID] [int] IDENTITY(1,1),
	[Name] [varchar](100) NOT NULL,
	[ShortDescription] [varchar](250) NULL,
	[DocumentID] [int] NOT NULL,
	[NetworkID] [int] NOT NULL,

)ON [PRIMARY]

GO 


ALTER TABLE MonitoringInformation
ADD CONSTRAINT PK_MonitoringInformation_MonitoringInformationID PRIMARY KEY CLUSTERED (MonitoringInformationID)
GO

ALTER TABLE MonitoringInformation
WITH CHECK ADD CONSTRAINT FK_MonitoringInformation_DocumentID FOREIGN KEY (DocumentID)
REFERENCES Document (DocumentID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE MonitoringInformation
WITH CHECK ADD CONSTRAINT FK_MonitoringInformation_NetworkID FOREIGN KEY (NetworkID)
REFERENCES Network (NetworkID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO