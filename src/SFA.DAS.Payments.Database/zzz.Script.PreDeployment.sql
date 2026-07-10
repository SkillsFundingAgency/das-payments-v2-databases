/*
--------------------------------------------------------------------------------------
Pre-Deployment Script
--------------------------------------------------------------------------------------
*/

SET NOCOUNT ON;
GO

IF OBJECT_ID(N'[Payments2].[CollectionPeriod]', N'U') IS NOT NULL
    AND COL_LENGTH(N'[Payments2].[CollectionPeriod]', 'CalendarYear') IS NOT NULL
    AND COL_LENGTH(N'[Payments2].[CollectionPeriod]', 'CalendarMonth') IS NOT NULL
BEGIN
    UPDATE [Payments2].[CollectionPeriod]
    SET
        [CalendarYear] = NULL,
        [CalendarMonth] = NULL
    WHERE
        [CalendarYear] IS NOT NULL
        OR [CalendarMonth] IS NOT NULL;
END
GO