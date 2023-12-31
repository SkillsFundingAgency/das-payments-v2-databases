﻿CREATE TABLE [Payments2].[SubmittedLearnerAim]
(
	[Id] BIGINT NOT NULL IDENTITY(1,1) CONSTRAINT PK_SubmittedLearnerAim PRIMARY KEY CLUSTERED, 
    [Ukprn] BIGINT NOT NULL, 
    [LearnerReferenceNumber] NVARCHAR(12) NOT NULL, 
    [LearningAimFrameworkCode] INT NOT NULL, 
    [LearningAimPathwayCode] INT NOT NULL, 
    [LearningAimProgrammeType] INT NOT NULL, 
    [LearningAimStandardCode] INT NOT NULL, 
    [LearningAimReference] NVARCHAR(8) NOT NULL, 
    [CollectionPeriod] TINYINT NOT NULL, 
    [AcademicYear] SMALLINT NOT NULL, 
    [IlrSubmissionDateTime] DATETIME2 NOT NULL, 
    [CreationDate] DATETIMEOFFSET NOT NULL CONSTRAINT DF_SubmittedLearnerAim_CreationDate DEFAULT (SYSDATETIMEOFFSET()), 
    [LearnerUln] BIGINT NULL, 
    [JobId] BIGINT NOT NULL, 
    [ContractType] TINYINT NOT NULL, 
)

GO

CREATE INDEX [IX_SubmittedLearnerAim_ApprenticeshipKey] ON [Payments2].[SubmittedLearnerAim] ([Ukprn], [LearnerReferenceNumber], [LearningAimFrameworkCode], [LearningAimPathwayCode], [LearningAimProgrammeType], [LearningAimStandardCode], [LearningAimReference], [ContractType])
Go

CREATE INDEX [IX_SubmittedLearnerAim__Delete] ON [Payments2].[SubmittedLearnerAim] 
(
	[Ukprn], 
	[AcademicYear], 
	[CollectionPeriod], 
	[IlrSubmissionDateTime]
)
INCLUDE
(
	[LearnerUln]
)
Go

CREATE NONCLUSTERED INDEX [IX_SubmittedLearnerAim_RemovedLearningAim] ON [Payments2].[SubmittedLearnerAim]
(
    [Ukprn],
    [CollectionPeriod],
    [AcademicYear]
)
INCLUDE
(
    [LearnerReferenceNumber],
    [LearningAimFrameworkCode],
    [LearningAimPathwayCode],
    [LearningAimProgrammeType], 
    [LearningAimStandardCode],
    [LearningAimReference],
    [ContractType]
)
GO