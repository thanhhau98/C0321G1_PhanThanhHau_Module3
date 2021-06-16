create database student_management;

use student_management ;

create table class (
	class_id   int 		   not null auto_increment primary key,
	class_name varchar(60) not null,
	start_date datetime    not null,
	`status`   bit
);

insert into class
values (1, 'A1', '2008-12-20', 1);
insert into class
values (2, 'A2', '2008-12-22', 1);
insert into class
values (3, 'B3', current_date, 0);
	

create table student (
	student_id 	 int 		 not null auto_increment primary key,
	student_name varchar(30) not null,
	address 	 varchar(50),
    phone		 varchar(20),
	`status` 	 bit,
    class_id 	 int 		 not null,
    foreign key (class_id) references class (class_id)
);

insert into student (student_name, address, phone, `status`, class_id)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student (student_name, address, `status`, class_id)
values ('Hoa', 'Hai phong', 1, 1);
insert into student (student_name, address, phone, `status`, class_id)
values ('Manh', 'HCM', '0123123123', 0, 2);

create table `subject` (
	sub_id 	 int 		 not null auto_increment primary key,
	sub_name varchar(60) not null,
	credit   tinyint 	 not null default 1 check (credit>=1),
	`status` bit 				  default 1 
);

insert into `subject`
value (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

create table mark (
    mark_id    int not null auto_increment primary key,
    sub_id     int not null,
    student_id int not null,
    mark       float   default 0 check ( Mark between 0 and 100),
    exam_times tinyint default 1,
    unique (sub_id, student_id),
    foreign key (sub_id) references `subject` (sub_id),
    foreign key (student_id) references student (student_id)
);

insert into mark (sub_id, student_id, mark, exam_times)
values (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
select address, count(student_id) as 'Số lượng học viên'
from student
group by address;

SELECT student.student_id,student_name, AVG(mark)
FROM student join mark on student.student_id = mark.student_id
GROUP BY student.student_id, student_name 
HAVING AVG(mark) > 15;

SELECT student.student_id,student_name, AVG(Mark)
FROM student join mark on student.student_id = mark.student_id
GROUP BY student.student_id, student_name
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.student_id);

drop database student_management;