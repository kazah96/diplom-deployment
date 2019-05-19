USE [testDiplomDatabase]
GO

CREATE TABLE ActionHistory(
	[ActionHistoryID] [int] IDENTITY(1,1),
	[Name] [varchar](200) NOT NULL,
	[Date] [datetime] NOT NULL,
	[ActionStatusID] [int] NOT NULL,
	[DocumentID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[ActionID] [int] NOT NULL

)ON [PRIMARY]

GO 

ALTER TABLE ActionHistory
ADD CONSTRAINT [DF_ActionHistory_Date] DEFAULT (getdate()) FOR [Date]
GO

ALTER TABLE ActionHistory
ADD CONSTRAINT PK_ActionHistory_ActionHistoryID PRIMARY KEY CLUSTERED (ActionHistoryID)
GO

ALTER TABLE ActionHistory
WITH CHECK ADD CONSTRAINT FK_ActionHistory_ActionStatusID FOREIGN KEY (ActionStatusID)
REFERENCES ActionStatus (ActionStatusID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE ActionHistory
WITH CHECK ADD CONSTRAINT FK_ActionHistory_DocumentID FOREIGN KEY (DocumentID)
REFERENCES Document (DocumentID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE ActionHistory
WITH CHECK ADD CONSTRAINT FK_ActionHistory_EmployeeID FOREIGN KEY (EmployeeID)
REFERENCES Employee (EmployeeID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE ActionHistory
WITH CHECK ADD CONSTRAINT FK_ActionHistory_ActionID FOREIGN KEY (ActionID)
REFERENCES [Action] (ActionID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO