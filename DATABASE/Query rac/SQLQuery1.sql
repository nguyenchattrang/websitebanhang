Select * from
(Select top 1 price from Product inner join
Variation on Product.id=Variation.product_id 
where Product.id=6
order by price
 ) a
union
Select * from
(
Select top 1 price from Product inner join
Variation on Product.id=Variation.product_id 
where Product.id=6
order by price DESC
) b

Select Category.id,name, ISNULL(count, 0 ) as count from Category left join 
 (
Select Category.id, COUNT(Category.id) as count from Category inner join Product
on Category.id = Product.category_id
group by Category.id) a
on Category.id = a.id

Select * from SubCategory


Select * from Variation


Select * from\n" +
"(Select top 1 price from Product inner join\n" +
"Variation on Product.id=Variation.product_id \n" +
"where Product.id=?\n" +
"order by price\n" +
" ) a\n" +
"union\n" +
"Select * from\n" +
"(\n" +
"Select top 1 price from Product inner join\n" +
"Variation on Product.id=Variation.product_id \n" +
"where Product.id=?\n" +
"order by price DESC\n" +
") b
