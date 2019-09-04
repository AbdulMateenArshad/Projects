

create database dbOnlineStore

Use dbOnlineStore

-----------------------------------------------------------------------------------------------------

create table tbl_admin
(
ad_id int identity primary key,
ad_username varchar(50) Not Null,
ad_password varchar(10) Not Null
);

select * from dbOnlineStore..tbl_admin

insert into dbOnlineStore..tbl_admin([ad_username],[ad_password]) values('Abdul','1234')
insert into dbOnlineStore..tbl_admin([ad_username],[ad_password]) values('Ahad','1111')
insert into dbOnlineStore..tbl_admin([ad_username],[ad_password]) values('Abdul Mateen','1234')


--------------------------------------------------------------------------------------------------------

--table category
create table tbl_category
(
cat_id int identity primary key,
cat_name varchar(50) Not Null,
cat_image nvarchar(max) Not Null ,
cat_fk_ad int foreign key references tbl_admin(ad_id)
);


select * from dbOnlineStore..tbl_category

Delete from tbl_category where cat_id='27'
delete from tbl_category where cat_name='Abdul'
Alter table tbl_category
Add cat_status int;

Alter table tbl_category
TRUNCATE TABLE tbl_category;

----------------------------------------------------------------------------------------------------------

--table user

create table tbl_user
(
u_id int identity primary key,
u_name varchar(50) not null unique,
u_email varchar(100) not null unique,
u_image nvarchar(max) not null ,
u_password varchar(10) not null,
u_contact varchar(12) not null unique
);
select * from dbOnlineStore..tbl_user


delete from tbl_user where u_id='2'
-------------------------------------------------------------------------------------------------------------------

--table product

create table tbl_product
(
pro_id int identity primary key,
pro_name varchar(50) not null unique,
pro_image nvarchar(max) not null,
pro_description varchar(100) not null,
pro_price int not null,
pro_fk_cat int foreign key references tbl_category(cat_id),
pro_fk_u int foreign key references tbl_user(u_id), 
pro_fk_ad int foreign key references tbl_admin(ad_id)

)
Alter table tbl_product
Add pro_bestbefore date null

Select * from dbOnlineStore..tbl_product

TRUNCATE TABLE tbl_product;

-----------------------------------------------------------------------------------------------------------------------
--table items

--create table tbl_item
--(
--item_id int identity primary key,
--item_price int ,
--item_total int ,
--item_sum int ,
--item_fk_pro int foreign key references tbl_product(pro_id),
--item_fk_u int foreign key references tbl_user(u_id),


--)


-------------------------------------------------------------------------------------------------------------------------
--table invoice

create table tbl_invoice
(
in_id int identity primary key,
in_fk_u int foreign key references tbl_user(u_id),
in_date date,
int_totalbill int 
)

select * from tbl_invoice

--------------------------------------------------------------------------------------------------------------------------
--table order


create table tbl_order
(
o_id int identity primary key,
o_fk_pro int foreign key references tbl_product(pro_id),
o_fk_in int foreign key references tbl_invoice(in_id),
o_date date,
o_qty int,
o_bill int ,
o_unitprice int

)

select * from tbl_order;