CREATE TABLE [Payments2].[ApprenticeshipEmploymentVerification]
(
    Id BIGINT NOT NULL IDENTITY CONSTRAINT PK_ApprenticeshipEmploymentVerification PRIMARY KEY,
    ApprenticeshipId BIGINT NOT NULL CONSTRAINT FK_ApprenticeshipEmploymentVerification__Apprenticeship FOREIGN KEY REFERENCES [Payments2].[Apprenticeship] (Id),
    [PreEmploymentStatus] TINYINT NOT NULL,
    [PreEmploymentCorrelationId] UNIQUEIDENTIFIER NULL,
    [FirstHiringGrantStatus] TINYINT NOT NULL,
    [FirstHiringGrantCorrelationId] UNIQUEIDENTIFIER NULL,
    [SecondHiringGrantStatus] TINYINT NOT NULL,
    [SecondHiringGrantCorrelationId] UNIQUEIDENTIFIER NULL,
    [CreationDate] DATETIME2 NOT NULL
)