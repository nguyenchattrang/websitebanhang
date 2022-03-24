declare @pageindex as int = 1
declare @pagesize as int =10
Select * from
(
Select COUNT(*) as total from [Order] left join Order_Status
on [Order].id=Order_Status.orderid
inner join [Status]
on [Status].id=Order_Status.statusid
where
(1=1)
) as T
where [Row]>=(@pageindex-1)*@pagesize+1 and [Row]<=@pageindex*@pagesize


and Order_Status.statusid='1'

Select * from [Order]
order by [Order].id DESC

Select COUNT(*) as total from [Order]

Select isNULL(AVG(Cast(Rating as Float)),0 )rating from Product left join Rating
on Product.id=Rating.productid
where Product.id=1

group by Product.id



Select * from Rating





and [Order].id=16
and shipname like  '%'+ 'mongoose'+'%'
and (shipaddress like   '%'+ '123'+'%' or shipaddress2  like'%'+ '123'+'%')





and [Order].id=16
and shipname like  '%'+ 'mongoose'+'%'
and (shipaddress like   '%'+ '123'+'%' or shipaddress2  like'%'+ '123'+'%')
and Order_Status.statusid='2'
order by [Order].id DESC

Select * from Status