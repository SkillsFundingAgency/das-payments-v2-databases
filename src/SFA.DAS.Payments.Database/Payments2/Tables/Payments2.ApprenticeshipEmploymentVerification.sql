CREATE TABLE [Payments2].[ApprenticeshipEmploymentVerification]
(
    [ApprenticeshipId] BIGINT NOT NULL CONSTRAINT PK_ApprenticeshipEmploymentVerification PRIMARY KEY,
    [PreEmploymentStatus] TINYINT NOT NULL,
    [PreEmploymentCorrelationId] UNIQUEIDENTIFIER NULL,
    [FirstHiringGrantStatus] TINYINT NOT NULL,
    [FirstHiringGrantCorrelationId] UNIQUEIDENTIFIER NULL,
    [SecondHiringGrantStatus] TINYINT NOT NULL,
    [SecondHiringGrantCorrelationId] UNIQUEIDENTIFIER NULL,
    [CreationDate] DATETIME2 NOT NULL,
    CONSTRAINT [FK_ApprenticeshipEmploymentVerification_Apprenticeship] FOREIGN KEY ([ApprenticeshipId]) REFERENCES [Payments2].[Apprenticeship] ([Id])
)
GO