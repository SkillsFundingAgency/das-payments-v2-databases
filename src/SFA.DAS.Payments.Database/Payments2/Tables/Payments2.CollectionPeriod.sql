CREATE TABLE [Payments2].[CollectionPeriod]
(
	[Id] BIGINT NOT NULL IDENTITY(1,1) CONSTRAINT PK_CollectionPeriod PRIMARY KEY CLUSTERED,
	[AcademicYear] SMALLINT NOT NULL,
	[Period] TINYINT NOT NULL,
	[ReferenceDataValidationDate] DATETIME2 NULL,
	[CompletionDate] DATETIME2 NOT NULL,
	[AuditMigrationStartDate] DATETIME2 NULL,
	[AuditMigrationCompletionDate] DATETIME2 NULL,
	[CreationDate] DATETIME2 NOT NULL DEFAULT sysutcdatetime(), 
    [Status] TINYINT NULL CONSTRAINT FK_CollectionPeriod__CollectionPeriodStatus FOREIGN KEY REFERENCES [Payments2].[CollectionPeriodStatus] (Id) CONSTRAINT DF_CollectionPeriod__Status DEFAULT (1),
    [CalendarYear] SMALLINT NULL, 
    [CalendarMonth] TINYINT NULL, 
    [StartDateTime] DATETIME2 NULL, 
    [EndDateTime] DATETIME2 NULL
)
GO

CREATE INDEX [IX_CollectionPeriod__Status] ON [Payments2].[CollectionPeriod]
(
	[Status]
)
GO
