Select * from Account inner join [Order]
on Account.id=[Order].user_id

Select * from [Order] inner join OrderDetail
on [Order].id=OrderDetail.order_id
where user_id=1