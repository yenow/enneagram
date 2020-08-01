-- member table
create table member(
    uno number(30),
    user_id varchar2(50) primary key,
    user_pw varchar2(50) not null,
    name varchar2(50) not null,
    nickname varchar2(50),
    email varchar2(200),
    tel varchar2(50),
    address varchar2(100) not null, 
    type varchar2(100),
    regdate date
);

alter table member add (
one number(30),
two number(30),
three number(30),
four number(30),
five number(30),
six number(30),
seven number(30),
eight number(30),
night number(30),
type_regdate date
);

-- email, address 삭제
alter table member drop column email;
alter table member drop column address;
alter table member add (type_regdate date);