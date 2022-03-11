Select * from [Order] inner join OrderDetail
on [Order].id=OrderDetail.order_id where user_id=1 and product_id=3

Select * from [Order] 
Select * from OrderDetail where order_id=3

Select Product.id,Product.name,sdesc,longdesc,Variation.id as varid, Variation.name as varname,Variation.price,OrderDetail.amount, Category.name as categoryname from Product inner join Variation
            on Product.id=Variation.product_id
             inner join Category
            on Product.category_id=Category.id
            inner join OrderDetail
            on Variation.id=OrderDetail.var_id
           where OrderDetail.order_id=6
           
           
           Select * from Product