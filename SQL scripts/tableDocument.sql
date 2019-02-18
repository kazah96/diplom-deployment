USE [DiplomDatabase]
GO

CREATE TABLE Document(
	[DocumentID] [int] IDENTITY(1,1),
	[Name] [varchar](100) NOT NULL,
	[ShortDiscription] [varchar](250) NULL,
	[CreationDate] [datetime] NOT NULL,
	[Path] [char](250) NOT NULL,
	[Status] [varchar](200) NOT NULL,
	[Size] [float](24) NOT NULL,
	[EditsAndChanges] [varchar](200) NOT NULL,
	[DocumentTypeID] [int] NOT NULL

)ON [PRIMARY]

GO 

ALTER TABLE Document
ADD CONSTRAINT [DF_Document_CreationDate] DEFAULT (getdate()) FOR [CreationDate]
GO

ALTER TABLE Document
ADD CONSTRAINT PK_Document_DocumentID PRIMARY KEY CLUSTERED (DocumentID)
GO

ALTER TABLE Document
WITH CHECK ADD CONSTRAINT FK_Document_DocumentTypeID FOREIGN KEY (DocumentTypeID)
REFERENCES DocumentType (DocumentTypeID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
