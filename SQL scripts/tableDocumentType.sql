USE [DiplomDatabase]
GO

CREATE TABLE DocumentType(
	[DocumentTypeID] [int] IDENTITY(1,1),
	[Name] [varchar](100) NOT NULL,
	[ShortDescription] [varchar](250) NULL

)ON [PRIMARY]

GO 

ALTER TABLE DocumentType
ADD CONSTRAINT PK_DocumentType_DocumentTypeID PRIMARY KEY CLUSTERED (DocumentTypeID)
GO