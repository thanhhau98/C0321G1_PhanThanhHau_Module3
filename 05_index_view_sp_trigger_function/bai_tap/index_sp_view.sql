create database demo;

use demo;

create table products (
	id int,
    product_code int,
    product_name varchar(45),
    product_price float,
    product_amount int,
    product_description varchar(45),
    product_status varchar(45)
);

insert into products
values
		(1,21,'Table',3000,2,'new','yes'),
		(2,123,'Glass',1000,2,'new','yes'),
		(3,31,'Lamp',2000,2,'new','yes'),
		(4,22,'Chair',1000,2,'new','yes');
        
select* from products where product_code = 31;

explain select* from products where product_code = 31;
        
create unique index product_index on products(product_code);

explain select* from products where product_code = 31;

create unique index name_price_index on products(product_name ,product_code);

-- alter table products add index name_price_index ( product_name , product_price);

explain select * from products where product_name = 'Lamp' or product_name = 'Table';

drop database demo;
