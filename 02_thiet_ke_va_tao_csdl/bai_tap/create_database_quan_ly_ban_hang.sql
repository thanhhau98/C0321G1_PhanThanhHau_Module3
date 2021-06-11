create database quan_ly_ban_hang;

use quan_ly_ban_hang;

create table customer (
	c_id   int 		   primary key,
	c_name varchar(30) not null,
	c_age  int 		   not null
);

create table `order` (
	o_id 		  int primary key,
    c_id 		  int not null,
    o_date 		  datetime,
    o_total_price float,
    foreign key(c_id) references customer (c_id)
);

create table product (
	p_id    int 		primary key,
    p_name  varchar(30) not null,
    p_price float	    not null
);

create table order_detail (
	o_id int,
    p_id int,
    od_qty varchar(30),
    primary key(o_id , p_id),
    foreign key(o_id) references `order`(o_id),
    foreign key (p_id) references product (p_id)
);

drop database quan_ly_ban_hang;