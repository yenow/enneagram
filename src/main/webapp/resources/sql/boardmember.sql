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

-- 여기까지가 member table 정보

alter table member modify (type varchar2(100));
update member set type=null;
select * from member;

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
alter table board add (rcnt number(30) default 0);
-- board에 nickname추가
alter table board add (nickname VARCHAR2(200));



insert into board (bno,user_id,title,content,cnt,regdate,nickname) values
		(bno_seq.nextval,#{user_id},#{title},#{content},#{cnt},sysdate,#{nickname});
		
insert into board (bno,user_id,title,content,cnt,regdate,nickname) values (bno_seq.nextval,'phantom1994','실험용','실험용',0,sysdate,'띠용');


update board set nickname='띠용';

select * from board;

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


-- 여기서부터는 연습장
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
