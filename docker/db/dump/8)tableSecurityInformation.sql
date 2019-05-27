USE [testDiplomDatabase]
GO

CREATE TABLE SecurityInformation(
	[SecurityInformationID] [int] IDENTITY(1,1),
	[Name] [varchar](100) NOT NULL,
	[ShortDescription] [varchar](250) NULL,
	[Hash] [varchar](150) NOT NULL,
	[DocumentID] [int] NOT NULL

)ON [PRIMARY]

GO 

ALTER TABLE SecurityInformation
ADD CONSTRAINT PK_SecurityInformationt_SecurityInformationID PRIMARY KEY CLUSTERED (SecurityInformationID)
GO

ALTER TABLE SecurityInformation
WITH CHECK ADD CONSTRAINT FK_SecurityInformation_DocumentID FOREIGN KEY (DocumentID)
REFERENCES Document (DocumentID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO