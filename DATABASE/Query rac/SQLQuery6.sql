UPDATE [Assignment].[dbo].[Variation]
   SET 
      [quantity] = 
	((Select quantity from Variation where id =5) -3)
     
 WHERE id=5
 
 
 
 
GO
Select quantity from Variation where id =22

Select @@IDENTITY as sid

Select * from[Order]