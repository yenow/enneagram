-- reply 테이블
create table reply(
	rno int(30) primary key,
	bno int(30),
	user_id varchar(100),
	rcontent varchar(2000) not null,
	regdate DATETIME,
	updatedate TIMESTAMP,
	no_user_id varchar(100),
	no_user_passwd varchar(100),
	nickname varchar(100),
	
	constraint fk_user_bno foreign key (bno) references board(bno) on delete cascade,
	constraint fk_user_id foreign key (user_id) references member(user_id) on delete cascade
);
-- 컬럼추가
ALTER table reply add(
	kind int(30)
);

insert into reply (rno,bno,user_id,rcontent,regdate,nickname,kind) values (nextval('rno'),2,"phantom1994","댓글내용"
,sysdate(),"띠용",1);

select * from reply;

delete from reply;