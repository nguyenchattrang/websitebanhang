/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [id]
      ,[name]
      ,[sdesc]
      ,[category_id]
      ,[longdesc]
      ,[subcategory_id]
      ,[brand_id]
  FROM [Assignment].[dbo].[Product]
  where(1=1)
  and id ='2'
   and name like '%' + null +'%'
  and subcategory_id=null
  and category_id = null
    and brand_id = null