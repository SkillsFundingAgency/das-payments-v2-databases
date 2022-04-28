CREATE TABLE [Payments2].[Payment]
(
	Id BIGINT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Payment PRIMARY KEY,
	EventId UNIQUEIDENTIFIER NOT NULL, 
	EarningEventId UNIQUEIDENTIFIER NOT NULL,
	FundingSourceEventId UNIQUEIDENTIFIER NOT NULL,
	RequiredPaymentEventId UNIQUEIDENTIFIER NULL,
	ClawbackSourcePaymentEventId UNIQUEIDENTIFIER NULL,
	EventTime DATETIMEOFFSET NOT NULL,
	JobId BIGINT NOT NULL,
	DeliveryPeriod TINYINT NOT NULL,
	CollectionPeriod TINYINT NOT NULL,
	AcademicYear SMALLINT,
	Ukprn BIGINT NOT NULL,
	LearnerReferenceNumber NVARCHAR(50) NOT NULL,
	LearnerUln BIGINT NOT NULL,
	PriceEpisodeIdentifier NVARCHAR(50) NOT NULL,
	Amount DECIMAL(15,5) NOT NULL,
	LearningAimReference  NVARCHAR(8) NOT NULL,
	LearningAimProgrammeType INT NOT NULL ,
	LearningAimStandardCode INT NOT NULL,
	LearningAimFrameworkCode INT NOT NULL,
	LearningAimPathwayCode INT NOT NULL,
	LearningAimFundingLineType NVARCHAR(100) NOT NULL,
	ContractType TINYINT NOT NULL,
	TransactionType TINYINT NOT NULL,
	FundingSource TINYINT NOT NULL,
	IlrSubmissionDateTime DATETIME2 NOT NULL,
	SfaContributionPercentage DECIMAL(15,5) NOT NULL,
	AgreementId NVARCHAR(255) NULL, 
	AccountId BIGINT NULL , 
	TransferSenderAccountId BIGINT NULL , 
	CreationDate DATETIMEOFFSET NOT NULL,
	EarningsStartDate DATETIME NOT NULL,
	EarningsPlannedEndDate DATETIME NULL,
	EarningsActualEndDate DATETIME NULL,
	EarningsCompletionStatus TINYINT NULL,
	EarningsCompletionAmount DECIMAL (15,5) NULL,
	EarningsInstalmentAmount DECIMAL (15,5) NULL,
	EarningsNumberOfInstalments SMALLINT NULL,
	LearningStartDate DATETIME2 NULL,
	ApprenticeshipId BIGINT NULL,
	ApprenticeshipPriceEpisodeId BIGINT NULL,
	ApprenticeshipEmployerType TINYINT NULL,
	ReportingAimFundingLineType NVARCHAR(120) NULL, 
	NonPaymentReason TINYINT NULL,
	DuplicateNumber INT NULL,
	LearningAimSequenceNumber BIGINT NULL
)
GO

--CREATE NONCLUSTERED INDEX [IX_Payment__ApprenticeshipKey] ON [Payments2].[Payment]
--(
--	[Ukprn] ASC,
--	[AcademicYear] ASC,
--	[LearnerReferenceNumber] ASC,
--	[LearningAimReference] ASC,
--	[LearningAimProgrammeType] ASC,
--	[LearningAimStandardCode] ASC,
--	[LearningAimFrameworkCode] ASC,
--	[LearningAimPathwayCode] ASC,
--	[ContractType] ASC,
--	[LearnerUln] ASC
--)
--WITH (ONLINE = ON)
--GO

--CREATE NONCLUSTERED INDEX [IX_Payment__UkprnPeriodSearch] ON [Payments2].[Payment]
--(
--	[Ukprn],
--	[CollectionPeriod],
--	[AcademicYear],
--	[DeliveryPeriod],
--	[JobId]
--) 
--WITH (ONLINE = ON)
--GO

--CREATE NONCLUSTERED INDEX [IX_Payment__Audit] ON [Payments2].[Payment]
--(
--	[EarningEventId],
--	[FundingSourceEventId]
--) 
--WITH (ONLINE = ON)
--GO

--CREATE NONCLUSTERED INDEX [IX_Payment__Metrics_Paid_DataLocks] ON [Payments2].[Payment]
--(
--	[Ukprn],
--	[LearnerReferenceNumber] ASC,
--	[LearningAimReference] ASC,
--	[LearningAimProgrammeType] ASC,
--	[LearningAimStandardCode] ASC,
--	[LearningAimFrameworkCode] ASC,
--	[LearningAimPathwayCode] ASC,
--	[CollectionPeriod]
--)
--INCLUDE
--(
--	[Amount], 
--	[TransactionType], 
--	[DeliveryPeriod]
--)
--WITH (ONLINE = ON)
--GO

--CREATE NONCLUSTERED INDEX [IX_Payment__CollectionPeriodCompletionPayments] on [Payments2].[Payment] 
--(
--	[Ukprn],
--	[ContractType],
--	[TransactionType]
--)
--WITH (ONLINE = ON)
--GO

--CREATE NONCLUSTERED INDEX [UX_Payment_ProviderEvents] ON [Payments2].[Payment] 
--(
--	[CollectionPeriod],
--	[AcademicYear],
--	[AccountId],
--	[FundingSource],
--	[TransferSenderAccountId],
--	[ApprenticeshipId]
--)
--INCLUDE 
--(
--	[EventId],
--	[RequiredPaymentEventId],
--	[DeliveryPeriod],
--	[Ukprn],
--	[LearnerUln],
--	[Amount],
--	[LearningAimProgrammeType],
--	[LearningAimStandardCode],
--	[LearningAimFrameworkCode],
--	[LearningAimPathwayCode],
--	[TransactionType],
--	[IlrSubmissionDateTime],
--	[EarningsStartDate],
--	[EarningsPlannedEndDate],
--	[EarningsActualEndDate],
--	[EarningsCompletionStatus],
--	[EarningsCompletionAmount],
--	[EarningsInstalmentAmount],
--	[EarningsNumberOfInstalments],
--	[ContractType]
--)
--WITH (ONLINE = ON)
--GO


--CREATE NONCLUSTERED INDEX [IX_Payment__AcademicYear_CollectionPeriod_JobId] ON [Payments2].[Payment]
--(
--	[AcademicYear],
--	[CollectionPeriod], 
--	[JobId]
--) 
--WITH (ONLINE = ON)
--GO

CREATE NONCLUSTERED INDEX [IX_Payment__AuditDataFactory] ON [Payments2].[Payment] 
(
	[AcademicYear],
	[CollectionPeriod]
)
WITH (ONLINE = ON)
GO