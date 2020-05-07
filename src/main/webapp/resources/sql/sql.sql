-- oh my god !

select * from member;

select * from board;

create table reply(
	rno number(30) primary key,
	bno number(30),
	user_id varchar2(100),
	rcontent varchar2(2000) not null,
	regdate date,
	updatedate date,
	
	constraint fk_user_bno foreign key (bno) references board(bno) on delete cascade,
	constraint fk_user_id foreign key (user_id) references member(user_id) on delete cascade,
	
);

select * from reply;

create sequence rno_seq
start with 1   --1부터 시작하라는 옵션
increment by 1  -- 1씩증가하라는 옵션
nocache; 

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