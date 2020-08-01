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