
CREATE FUNCTION dbo.GetMonthCalendar(@Year INT, @Month INT)
RETURNS TABLE
AS
RETURN
(
    WITH Calendar AS (
        
        SELECT 
            DATEADD(DAY, number, DATEFROMPARTS(@Year, @Month, 1)) AS Date
        FROM master.dbo.spt_values
        WHERE type = 'P'
        AND number < DAY(EOMONTH(DATEFROMPARTS(@Year, @Month, 1)))
    ),
    WeekNumbers AS (
       
        SELECT 
            Date,
            DATEPART(WEEK, Date) AS WeekNumber,
            DATEPART(WEEKDAY, Date) AS DayOfWeek
        FROM Calendar
    )
    
    SELECT 
        WeekNumber,
        MAX(CASE WHEN DayOfWeek = 1 THEN DAY(Date) END) AS Sunday,
        MAX(CASE WHEN DayOfWeek = 2 THEN DAY(Date) END) AS Monday,
        MAX(CASE WHEN DayOfWeek = 3 THEN DAY(Date) END) AS Tuesday,
        MAX(CASE WHEN DayOfWeek = 4 THEN DAY(Date) END) AS Wednesday,
        MAX(CASE WHEN DayOfWeek = 5 THEN DAY(Date) END) AS Thursday,
        MAX(CASE WHEN DayOfWeek = 6 THEN DAY(Date) END) AS Friday,
        MAX(CASE WHEN DayOfWeek = 7 THEN DAY(Date) END) AS Saturday
    FROM WeekNumbers
    GROUP BY WeekNumber
    ORDER BY WeekNumber
);
GO
