create database quan_ly_ban_hang;

use quan_ly_ban_hang;

create table customer (
	customer_id   int 		   primary key,
	customer_name varchar(30) not null,
	customer_age  int 		   not null
);

insert into customer
values (1,'Minh Quan',10),
	   (2,'Ngoc Oanh',20),
       (3,'Hong Ha',50);

create table `order` (
	order_id 		  int primary key,
    customer_id 	  int not null,
    order_date 		  datetime,
    order_total_price float,
    foreign key(customer_id) references customer (customer_id)
);

insert into `order`(order_id,customer_id,order_date)
values (1,1,'2006-3-21'),
	   (2,2,'2006-3-23'),
       (3,1,'2006-3-16');


create table product (
	product_id    int 		primary key,
    product_name  varchar(30) not null,
    product_price float	    not null
);

insert into product
values (1,'May Giat',3),
	   (2,'Tu Lanh',5),
       (3,'Dieu Hoa',7),
	   (4,'Quat',1),
	   (5,'Bep Dien',2);

create table order_detail (
	order_id int,
    product_id int,
    order_detail_qty varchar(30),
    primary key(order_id , product_id),
    foreign key(order_id) references `order`(order_id),
    foreign key (product_id) references product (product_id)
);

insert into order_detail
values (1,1,3),
	   (1,3,7),
       (1,4,2),
	   (2,1,1),
	   (3,1,8),
       (2,5,4),
       (2,3,3);
       
select order_id,order_date,order_total_price
from `order`;

select customer_name, product_name
from customer join `order` on customer.customer_id = `order`.customer_id
			  join order_detail on `order`.order_id = order_detail.order_id
			  join product on product.product_id = order_detail.product_id ;
            
select customer_name , product_name
from customer left join `order` on customer.customer_id = `order`.customer_id
			  left join order_detail on `order`.order_id = order_detail.order_id
			  left join product on product.product_id = order_detail.product_id
where `order`.customer_id is null ;

select `order`.order_id, order_date, sum(order_detail_qty * product_price) as order_total_price 
from `order` join order_detail on `order`.order_id = order_detail.order_id 
			 join product on product.product_id = order_detail.product_id
group by `order`.order_id ;

drop database quan_ly_ban_hang;