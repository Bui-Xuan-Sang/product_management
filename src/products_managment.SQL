create database demo_products_management;
use demo_products_management;
create table Products
(
    Id                 int auto_increment primary key,
    productCode        varchar(10) unique,
    productName        varchar(30),
    productPrice       double,
    productAmount      double,
    productDescription varchar(30),
    productStatus      bit
);

insert into Products
values (1, 'Bánh', 'Bánh Mỳ', 10000, 50, 'còn hạn sử dụng', 1),
       (2, 'Hoa Quả', 'Táo', 20000, 150, 'sạch', 1),
       (3, 'Hải Sản', 'Cá', 100000, 5, 'Tươi', 0),
       (4, 'Dụng Cụ', 'Dao Thớt', 350000, 100, 'Bền', 1),
       (5, 'Nội Thất', 'Bàn Ghế', 50000000, 10, 'Tốt', 0);

create unique index index_Products on Products (productCode);

create index composite_Products on Products (productName, productPrice);

create view products_view as
select productCode, productName, productPrice, productStatus
from Products;
select *
from products_view;
drop view products_view;

DELIMITER //
create procedure findAllProducts()
begin
select * from Products;
end //
DELIMITER ;
call findAllProducts();

DELIMITER //
create procedure addProducts( addProductCode varchar(10),  addProductName varchar(20),  addProductPrice double,
                              addProductAmount double)
begin
insert into products(productCode, productName, productPrice, productAmount)
values (addProductCode, addProductName, addProductPrice, addProductAmount);

end
//
DELIMITER ;


call addProducts('cá nhân', 'Kem đánh răng', 15000, 100);
select *
from products;

DELIMITER //
create procedure updateProducts(in upProductCode varchar(10))
begin
update products
set productCode = upProductCode
where Id = 11;
end //
DELIMITER ;
call updateProducts('đồ dùng');
select *
from products;

DELIMITER //
create procedure deleteProducts()
begin
delete
from products
where Id = 11;
end //
DELIMITER ;
call deleteProducts;
select * from products;














