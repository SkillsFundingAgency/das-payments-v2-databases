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
    [IlrSubmissionDateTime] DATETIME NOT NULL, 
    [CreationDate] DATETIMEOFFSET NOT NULL CONSTRAINT DF_SubmittedLearnerAim_CreationDate DEFAULT (SYSDATETIMEOFFSET()), 
    [LearnerUln] BIGINT NOT NULL, 
    [JobId] BIGINT NOT NULL, 
    [SfaContributionPercentage] DECIMAL(15, 5) NOT NULL,
)
