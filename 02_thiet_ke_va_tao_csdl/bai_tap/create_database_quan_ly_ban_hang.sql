create database quan_ly_ban_hang;

use quan_ly_ban_hang;

create table customer (
	customer_id   int 		   primary key,
	customer_name varchar(30) not null,
	customer_age  int 		   not null
);

create table `order` (
	order_id 		  int primary key,
    customer_id 		  int not null,
    order_date 		  datetime,
    order_total_price float,
    foreign key(customer_id) references customer (customer_id)
);

create table product (
	product_id    int 		primary key,
    product_name  varchar(30) not null,
    product_price float	    not null
);

create table order_detail (
	order_id int,
    product_id int,
    order_detail_qty varchar(30),
    primary key(order_id , product_id),
    foreign key(order_id) references `order`(order_id),
    foreign key (product_id) references product (product_id)
);

drop database quan_ly_ban_hang;