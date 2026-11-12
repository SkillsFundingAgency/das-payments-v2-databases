CREATE TABLE [Payments2].[GrowthAndSkillsEarningsProcessing]
(
	[Id] BIGINT NOT NULL IDENTITY(1,1) CONSTRAINT PK_GrowthAndSkillsEarningsProcessing PRIMARY KEY CLUSTERED,
	[GrowthAndSkillsEarningId] UNIQUEIDENTIFIER NOT NULL,
	[CollectionPeriod] TINYINT NOT NULL,
	[AcademicYear] SMALLINT NOT NULL,
	[ProcessedOn] DATETIME2 NULL
)
GO

CREATE UNIQUE INDEX [UX_GrowthAndSkillsEarningsProcessing_Earning_Year_Period] ON [Payments2].[GrowthAndSkillsEarningsProcessing]
(
	[GrowthAndSkillsEarningId],
	[AcademicYear],
	[CollectionPeriod]
)
GO
