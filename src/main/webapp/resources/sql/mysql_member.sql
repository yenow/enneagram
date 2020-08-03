-- member table
create table member(
    uno int(30),
    user_id varchar(50) primary key,
    user_pw varchar(50) not null,
    name varchar(50) not null,
    nickname varchar(50),
    email varchar(200),
    tel varchar(50),
    address varchar(100) not null, 
    type varchar(100),
    regdate date
);

alter table member add (
one int(30),
two int(30),
three int(30),
four int(30),
five int(30),
six int(30),
seven int(30),
eight int(30),
night int(30),
type_regdate DATETIME
);

-- email, address 삭제
alter table member drop column email;
alter table member drop column address;
alter table member add (type_regdate TIMESTAMP);

select * from member;

insert into member (uno, user_id,user_pw,name,nickname,tel,regdate) 
values (nextval('uno'),"phantom1994","tlsdud5089","윤신영","띠용","01021245690",sysdate());