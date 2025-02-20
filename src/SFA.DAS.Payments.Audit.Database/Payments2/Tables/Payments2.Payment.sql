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
	LearningAimSequenceNumber BIGINT NULL,
	AgeAtStartOfLearning TINYINT NULL,
	FundingPlatformType TINYINT NULL constraint DF_Payment__FundingPlatformType DEFAULT(1)
)
GO

CREATE NONCLUSTERED INDEX [IX_Payment__AuditDataFactory] ON [Payments2].[Payment]
(
	[AcademicYear],
	[CollectionPeriod],
	[EventId]
)
WITH (ONLINE = ON)
GO
