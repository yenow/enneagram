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