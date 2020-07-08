-- oh my god !

-- reply 테이블
create table reply(
	rno number(30) primary key,
	bno number(30),
	user_id varchar2(100),
	rcontent varchar2(2000) not null,
	regdate date,
	updatedate date,
	no_user_id varchar2(100),
	no_user_passwd varchar2(100),
	nickname varchar2(100),
	
	constraint fk_user_bno foreign key (bno) references board(bno) on delete cascade,
	constraint fk_user_id foreign key (user_id) references member(user_id) on delete cascade
);
-- 컬럼추가
ALTER table reply add(
	kind number(30)
);

-- 컬럼추가
ALTER table reply add(
	no_user_id varchar2(100),
	no_user_passwd varchar2(100)
);

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

-- board 테이블 정보
create table board(
    bno number(30) primary key, 
	user_id varchar2(50), 
	title varchar2(200),
	content varchar2(4000), 
	cnt number(30) default 0, 
	rcnt number(30) default 0,
	nickname VARCHAR2(200),
	regdate date,
    moddate date,
    
    CONSTRAINT fk_code FOREIGN KEY (user_id) REFERENCES member(user_id) ON DELETE CASCADE
);
-- board에 rcnt추가
--alter table board add (rcnt number(30) default 0);
-- board에 nickname추가
--alter table board add (nickname VARCHAR2(200));


-- rno_seq 작업
create sequence rno_seq
start with 1   --1부터 시작하라는 옵션
increment by 1  -- 1씩증가하라는 옵션
nocache; 

-- bno_seq 
create sequence bno_seq 
start with 1
INCREMENT by 1
MAXVALUE 10000
NOCACHE;

-- bno_seq 
create sequence uno_seq 
start with 1
INCREMENT by 1
MAXVALUE 10000
NOCACHE;

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

-- email, address 삭제
alter table member drop column email;
alter table member drop column address;

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

alter table member add (type_regdate date);


----------------------------------------------------------------------------------

drop table member;


select * from reply;

























create table board(
    bno number(30) primary key, 
	user_id varchar2(50) , 
	title varchar2(200),
	content varchar2(4000), 
	cnt number(30) default 0, 
	regdate date,
    moddate date,
    
    CONSTRAINT fk_code FOREIGN KEY (user_id) REFERENCES member(user_id) ON DELETE CASCADE
);

