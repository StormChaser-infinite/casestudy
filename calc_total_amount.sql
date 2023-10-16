-- =======================================================
-- Create Stored Procedure Template for Azure SQL Database
-- =======================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Name
-- Create Date: 
-- Description: 
-- =============================================
CREATE PROCEDURE calc_total_amount AS
BEGIN
	with totalamount as (
    select DATEFROMPARTS(SUBSTRING(FKCO_V_VALUE_DATE,6 ,4),SUBSTRING(FKCO_V_VALUE_DATE,3,2),SUBSTRING(FKCO_V_VALUE_DATE,1 ,1)) as 'FKCO_V_VALUE_DATE', 
			sum(FKCO_F_AMOUNT) as 'Total_Amount' 
	from dbo.FKTA_D_MESSAGES
	group by DATEFROMPARTS(SUBSTRING(FKCO_V_VALUE_DATE,6 ,4),SUBSTRING(FKCO_V_VALUE_DATE,3,2),SUBSTRING(FKCO_V_VALUE_DATE,1 ,1))
	)

	insert into [dbo].[total_amount]
	([FKCO_V_VALUE_DATE]
      ,[Total_Amount])
	select * from totalamount
END
GO
