CREATE TABLE [Payments2].[GrowthAndSkillsEarningPricePeriod]
(
	[Id] BIGINT NOT NULL IDENTITY(1,1) CONSTRAINT PK_GrowthAndSkillsEarningPricePeriod PRIMARY KEY CLUSTERED,
	[GrowthAndSkillsEarningEarningsId] UNIQUEIDENTIFIER NOT NULL,
	[Price] DECIMAL(15,5) NOT NULL,
	[StartDate] DATETIME2 NOT NULL,
	[EndDate] DATETIME2 NULL,
	[DeliveryPeriod] TINYINT NOT NULL,
	[AcademicYear] SMALLINT NOT NULL,
	[EarningType] TINYINT NOT NULL,
	[Amount] DECIMAL(15,5) NOT NULL,
	[EmployerAccountId] BIGINT NOT NULL,
	[EmployerType] TINYINT NOT NULL,
	[FundingAccountId] BIGINT NOT NULL, 
    [ProcessedOn] DATETIME2 NULL, 
    [ApprenticeshipId] BIGINT NULL   
)
