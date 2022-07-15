drop table if exists liked_by;
drop table if exists offer;
drop table if exists employee;

create table Employee(
	id int primary key auto_increment,
    name varchar(50) not null,
    department varchar(50),
    gender varchar(6) not null,
    age int not null,
    contact_number bigint,
    email varchar(100) unique,
    points_gained int default 0
    );
    
create table Offer(
	id int primary key auto_increment,
    name varchar(50) not null,
    description varchar(100),
    category varchar(50) not null,
    open_date timestamp default now(),
    closed_date timestamp,
    engaged_date timestamp,
    engaged_emp_id int,
    emp_id int not null,
    likes int default 0,
    foreign key(engaged_emp_id) references Employee(id) on delete cascade,
    foreign key(emp_id) references Employee(id) on delete cascade
    );

create table liked_by(
	emp_id int,
    offer_id int,
    liked_on timestamp default now(),
    primary key(emp_id,offer_id),
    foreign key(emp_id) references Employee(id) on delete cascade,
    foreign key(offer_id) references Offer(id) on delete cascade
    );
    
    
INSERT INTO `employee`(`id`, `name`, `department`, `gender`, `age`, `contact_number`, `email`, `points_gained`) VALUES (1,'Karthik','Development','male',21,'9464131544','Karthik@gmail.com', 10);
INSERT INTO `employee`(`id`, `name`, `department`, `gender`, `age`, `contact_number`, `email`, `points_gained`) VALUES (2,'Debraj','Development','male',31,'9884541524','Debraj@gmail.com', 18);
INSERT INTO `employee`(`id`, `name`, `department`, `gender`, `age`, `contact_number`, `email`, `points_gained`) VALUES (1,'Rizwan','Automation','male',24,'7842154852','Rizwan@gmail.com', 15);
INSERT INTO `employee`(`id`, `name`, `department`, `gender`, `age`, `contact_number`, `email`, `points_gained`) VALUES (1,'Shagun','Front-End','female',22,'8562244572','Shagun@gmail.com', 10);
INSERT INTO `employee`(`id`, `name`, `department`, `gender`, `age`, `contact_number`, `email`, `points_gained`) VALUES (5,'Vishal Kumar','Testing','male',23,'8492361532','VishalKS@gmail.com', 20);

insert into Offer(id,name,category,emp_id) values(1,'offer 1' ,'electronics',3);
insert into Offer(id,name,category,emp_id) values(2,'offer 2' ,'electronics1',3);
insert into Offer(id,name,category,emp_id) values(3,'offer 4' ,'electronics2',2);
insert into Offer(id,name,category,emp_id) values(4,'offer 5' ,'electronics3',1);
insert into Offer(id,name,category,emp_id) values(5,'offer 6' ,'electronics4',2);
insert into Offer(id,name,category,emp_id) values(6,'offer 3' ,'electronics',1);

insert into liked_by(emp_id,offer_id) values(1,1);
insert into liked_by(emp_id,offer_id) values(1,2);
insert into liked_by(emp_id,offer_id) values(3,6);
insert into liked_by(emp_id,offer_id) values(2,4);