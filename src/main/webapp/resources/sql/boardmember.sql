create table member(
    uno NUMBER(30),
    user_id varchar2(50) primary key,
    user_pw varchar2(50) not null,
    name varchar(50) not null,
    nickname VARCHAR2(50),
    email VARCHAR2(200),
    tel varchar2(100),
    address VARCHAR2(200) not null, 
    type number(2),
    regdate date
);

select * from member;

create table board(
    bno number(30) primary key, 
	user_id varchar2(50), 
	title varchar2(200),
	content varchar2(4000), 
	cnt number(30) default 0, 
	regdate date,
    moddate date,
    
    CONSTRAINT fk_code FOREIGN KEY (user_id) REFERENCES member(user_id) ON DELETE CASCADE
);

create sequence bno_seq 
start with 1
INCREMENT by 1
MAXVALUE 10000
NOCACHE;

create sequence uno_seq 
start with 1
INCREMENT by 1
MAXVALUE 10000
NOCACHE;

select * from nls_database_parameters where parameter = 'NLS_CHARACTERSET';

create table ysy(
    name varchar2(50)
);

insert into ysy values ('신영');

select * from ysy;

select * from (select ROWNUM, e.* from board e);

select * from board order by bno desc;

select rownum, board.* from board;

select * from (select rownum as rnum, e.* from (select * from board order by bno desc) e) where rnum <= 15 and rnum >=5;
