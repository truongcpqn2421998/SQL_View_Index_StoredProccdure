create database demo;
use demo;
create table Products(
    Id int primary key ,
    productCode varchar(10),
    productName varchar(20),
    productPrice int,
    productAmount int,
    productDescription varchar(50),
    productStatus bit
);
insert into products value (1,'1A','lenovo legion 5',23500000,1,'like new',true);

alter table  products add unique inx_Code(productCode);

alter table products add index inx_name_price(productName,productPrice);

explain select * from products where productStatus =true;
explain select * from products where productCode ='1A';

create view product_view AS
    select productCode,productName,productPrice,productStatus
from products;

create or replace view product_view AS
    select productName,productPrice
from products;

select * from demo.product_view;

drop view product_view;

DELIMITER //
create procedure findAll()
begin
    select * from products;

end//

DELIMITER ;

call findAll();

DELIMITER //
create procedure addProduct(in nId int,nCode varchar(10),nName varchar(20),nPrice int,nAmount int,nD varchar(20),nStatus bit )
begin
    insert into products value (nId,nCode,nName,nPrice,nAmount,nD,nStatus);
end //
DELIMITER ;

call addProduct(2,'2A','IP',1300000,2,'new',true);

DELIMITER //
create procedure fixProduct(in nId int,nCode varchar(10),nName varchar(20),nPrice int,nAmount int,nD varchar(20),nStatus bit )
begin
    update products S set S.productCode=nCode,S.productName=nName,S.productPrice=nPrice,S.productAmount=nAmount,S.productDescription=nD,S.productStatus=nStatus where Id=nId;

end //
DELIMITER ;

call fixProduct(2,'C','Samsung',15,1,'old',true);

DELIMITER //
create procedure deleteProduct(in nID int)
begin
    delete from products
        where Id=nID;
end //
DELIMITER ;

call deleteProduct(2);