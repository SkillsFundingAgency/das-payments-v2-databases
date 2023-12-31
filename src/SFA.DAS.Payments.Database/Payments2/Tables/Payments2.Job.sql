﻿Create TABLE [Payments2].[Job]
( 
	JobId BIGINT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Job PRIMARY KEY CLUSTERED,
	JobType TINYINT NOT NULL CONSTRAINT FK_Job__JobType FOREIGN KEY REFERENCES [Payments2].[JobType] (Id),
	StartTime DATETIMEOFFSET NOT NULL CONSTRAINT DF_Job__StartTime DEFAULT (SYSDATETIMEOFFSET()),	
	EndTime DATETIMEOFFSET NULL, 
	[Status] TINYINT NOT NULL CONSTRAINT FK_Job__JobStatus FOREIGN KEY REFERENCES [Payments2].[JobStatus] (Id) CONSTRAINT DF_Job__Status DEFAULT (1),
	CreationDate DATETIMEOFFSET NOT NULL CONSTRAINT DF_Job__CreationDate DEFAULT (SYSDATETIMEOFFSET()),
	DCJobId BIGINT NULL,
	Ukprn BIGINT NULL, 
	IlrSubmissionTime DATETIME NULL,
	LearnerCount INT NULL,
	AcademicYear SMALLINT NOT NULL,
	CollectionPeriod TINYINT NOT NULL,
	DataLocksCompletionTime DATETIMEOFFSET NULL,
	DCJobSucceeded BIT NULL,
	DCJobEndTime DATETIMEOFFSET NULL
)
GO

CREATE INDEX [IX_Job__Search] ON [Payments2].[Job]
(
	JobId,
	JobType,
	DCJobId,
	Ukprn,
	[Status],
	StartTime,
	EndTime,	
	DataLocksCompletionTime,
	DCJobSucceeded,
	DCJobEndTime
)
GO

CREATE INDEX IX_Payments2_Job__IlrSubmissionTime
ON Payments2.Job (IlrSubmissionTime)
GO

CREATE NONCLUSTERED INDEX [IX_Payments2_Job_Search] 
ON [Payments2].[Job] ([DCJobId], [AcademicYear], [DCJobSucceeded], [JobType], [Status]) 
INCLUDE ([IlrSubmissionTime], [Ukprn]) WITH (ONLINE = ON)