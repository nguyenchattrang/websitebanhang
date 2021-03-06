/****** Script for SelectTopNRows command from SSMS  ******/
SELECT role FROM [Assignment].[dbo].[Account_Role] where id=1

Select Product.id, name,sdesc, SUM(amount) as total from Product left join OrderDetail
on Product.id=OrderDetail.product_id
group by Product.id,name,sdesc order by total DESC

Select * from
(SELECT ROW_NUMBER() OVER (ORDER BY ID ASC) AS [Row], *FROM DummyTBL) as a
where [Row]>=2 and [Row]<=5