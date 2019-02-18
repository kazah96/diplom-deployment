USE [DiplomDatabase]
GO

CREATE TABLE DocumentPathHistory(
	[DocumentPathHistoryID] [int] IDENTITY(1,1),
	[Name] [varchar](200) NOT NULL,
	[DateAndTimeOfReceipt] [datetime] NOT NULL,
	[DateAndTimeOfDispatch] [datetime] NULL,
	[DocumentID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL

)ON [PRIMARY]

GO 

ALTER TABLE DocumentPathHistory
ADD CONSTRAINT [DF_DocumentPathHistory_DateAndTimeOfReceipt] DEFAULT (getdate()) FOR [DateAndTimeOfReceipt]
GO

ALTER TABLE DocumentPathHistory
ADD CONSTRAINT PK_DocumentPathHistoryt_DocumentPathHistoryID PRIMARY KEY CLUSTERED (DocumentPathHistoryID)
GO

ALTER TABLE DocumentPathHistory
WITH CHECK ADD CONSTRAINT FK_DocumentPathHistory_DocumentID FOREIGN KEY (DocumentID)
REFERENCES Document (DocumentID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE DocumentPathHistory
WITH CHECK ADD CONSTRAINT FK_DocumentPathHistory_EmployeeID FOREIGN KEY (EmployeeID)
REFERENCES Employee (EmployeeID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO