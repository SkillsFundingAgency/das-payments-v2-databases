CREATE TABLE [Payments2].[ShortCourseEarning]
(
	[Id] BIGINT NOT NULL IDENTITY(1,1) CONSTRAINT PK_ShortCourseEarning PRIMARY KEY CLUSTERED,
	[EarningsId] UNIQUEIDENTIFIER NOT NULL,
	[UKPRN] BIGINT NOT NULL,
	[LearnerId] BIGINT NOT NULL,
	[LearnerUln] BIGINT NOT NULL,
	[LearnerReference] NVARCHAR(50) NOT NULL,
	[TrainingType] TINYINT NOT NULL,
	[CourseCode] INT NOT NULL,
	[StartDate] DATETIME2 NOT NULL,
	[AgeAtStartOfTraining] TINYINT NOT NULL,
	[PlannedEndDate] DATETIME2 NOT NULL,
	[ActualEndDate] DATETIME2 NULL,
	[TrainingStatus] TINYINT NOT NULL,
	[EmployerContribution] DECIMAL(15,5) NOT NULL
)
