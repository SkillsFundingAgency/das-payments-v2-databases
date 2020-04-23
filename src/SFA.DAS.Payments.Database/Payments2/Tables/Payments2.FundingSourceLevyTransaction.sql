﻿CREATE TABLE [Payments2].[FundingSourceLevyTransaction]
(
	[Id] BIGINT NOT NULL IDENTITY(1,1) CONSTRAINT PK_FundingSourceLevyTransaction PRIMARY KEY CLUSTERED,
	[Ukprn] BIGINT NOT NULL,
	[CollectionPeriod] TINYINT NOT NULL,
	[AcademicYear] SMALLINT NOT NULL,
	[DeliveryPeriod] TINYINT NOT NULL,
	[JobId]  BIGINT NOT NULL,
	[AccountId] BIGINT NULL, 
	[TransferSenderAccountId] BIGINT NULL, 
	[RequiredPaymentEventId] UNIQUEIDENTIFIER NOT NULL,
	[EarningEventId] UNIQUEIDENTIFIER NOT NULL,
	[CreationDate] DATETIMEOFFSET NOT NULL CONSTRAINT DF_FundingSourceLevyTransaction__CreationDate DEFAULT (SYSDATETIMEOFFSET()),
	[Amount] DECIMAL(15,5) NOT NULL,
	[MessagePayload] nvarchar(max) not null,
	[MessageType] nvarchar(max) not null
)
GO

CREATE NONCLUSTERED INDEX [IX_FundingSourceLevyTransaction__PeriodEnd] ON [Payments2].[FundingSourceLevyTransaction] 
([JobId], [AccountId], [TransferSenderAccountId]) include (Amount) 
WITH (ONLINE = ON)
GO