﻿CREATE TABLE [Metrics].[PeriodEndSummary] (
    [Id]                                            BIGINT             IDENTITY (1, 1) NOT NULL,
    [AcademicYear]                                  SMALLINT           NOT NULL,
    [CollectionPeriod]                              TINYINT            NOT NULL,
    [JobId]                                         BIGINT             NOT NULL,
    [Percentage]                                    DECIMAL (15, 5)    NOT NULL,
    [ContractType1]                                 DECIMAL (15, 5)    NOT NULL,
    [ContractType2]                                 DECIMAL (15, 5)    NOT NULL,
    [DifferenceContractType1]                       DECIMAL (15, 5)    NOT NULL,
    [DifferenceContractType2]                       DECIMAL (15, 5)    NOT NULL,
    [PercentageContractType1]                       DECIMAL (15, 5)    NOT NULL,
    [PercentageContractType2]                       DECIMAL (15, 5)    NOT NULL,
    [EarningsDCContractType1]                       DECIMAL (15, 5)    NOT NULL,
    [EarningsDCContractType2]                       DECIMAL (15, 5)    NOT NULL,
    [PaymentsContractType1]                         DECIMAL (15, 5)    NOT NULL,
    [PaymentsContractType2]                         DECIMAL (15, 5)    NOT NULL,
    [AdjustedDataLockedEarnings]                    DECIMAL (15, 5)    NOT NULL,
    [AdjustedDataLockedEarnings16To18]              DECIMAL (15, 5)    CONSTRAINT [DF_PeriodEndSummary__AdjustedDataLockedEarnings16To18] DEFAULT ((0)) NOT NULL,
    [AdjustedDataLockedEarnings19Plus]              DECIMAL (15, 5)    CONSTRAINT [DF_PeriodEndSummary__AdjustedDataLockedEarnings19Plus] DEFAULT ((0)) NOT NULL,
    [AlreadyPaidDataLockedEarnings]                 DECIMAL (15, 5)    CONSTRAINT [DF_PeriodEndSummary__AlreadyPaidDataLockedEarnings] DEFAULT ((0)) NOT NULL,
    [AlreadyPaidDataLockedEarnings16To18]           DECIMAL (15, 5)    CONSTRAINT [DF_PeriodEndSummary__AlreadyPaidDataLockedEarnings16To18] DEFAULT ((0)) NOT NULL,
    [AlreadyPaidDataLockedEarnings19Plus]           DECIMAL (15, 5)    CONSTRAINT [DF_PeriodEndSummary__AlreadyPaidDataLockedEarnings19Plus] DEFAULT ((0)) NOT NULL,
    [TotalDataLockedEarnings]                       DECIMAL (15, 5)    CONSTRAINT [DF_PeriodEndSummary__TotalDataLockedEarnings] DEFAULT ((0)) NOT NULL,
    [TotalDataLockedEarnings16To18]                 DECIMAL (15, 5)    CONSTRAINT [DF_PeriodEndSummary__TotalDataLockedEarnings16To18] DEFAULT ((0)) NULL,
    [TotalDataLockedEarnings19Plus]                 DECIMAL (15, 5)    CONSTRAINT [DF_PeriodEndSummary__TotalDataLockedEarnings19Plus] DEFAULT ((0)) NULL,
    [HeldBackCompletionPaymentsContractType1]       DECIMAL (15, 5)    NOT NULL,
    [HeldBackCompletionPaymentsContractType2]       DECIMAL (15, 5)    NOT NULL,
    [PaymentsYearToDateContractType1]               DECIMAL (15, 5)    NOT NULL,
    [PaymentsYearToDateContractType2]               DECIMAL (15, 5)    NOT NULL,
    [InLearning]                                    INT                NULL,
    [NegativeEarningsContractType1]           DECIMAL (15, 5)    NULL,
    [NegativeEarningsContractType2]           DECIMAL (15, 5)    NULL,
    [IsWithinTolerance]                             BIT                NOT NULL,
    [CreationDate]                                  DATETIMEOFFSET (7) CONSTRAINT [DF_PeriodEndSummary__CreationDate] DEFAULT (sysdatetimeoffset()) NOT NULL,
    CONSTRAINT [PK_PeriodEndSummary] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_PeriodEndSummary] UNIQUE NONCLUSTERED ([AcademicYear] ASC, [CollectionPeriod] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_PeriodEndSummary]
    ON [Metrics].[PeriodEndSummary]([JobId] ASC, [AcademicYear] ASC, [CollectionPeriod] ASC, [CreationDate] ASC);

