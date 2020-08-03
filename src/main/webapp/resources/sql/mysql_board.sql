-- board 테이블 정보
create table board(
    bno int(30) primary key, 
	user_id varchar(50), 
	title varchar(200),
	content varchar(4000), 
	cnt int(30) default 0, 
	rcnt int(30) default 0,
	nickname VARCHAR(200),
	regdate DATETIME,
    moddate TIMESTAMP,
    
    CONSTRAINT fk_code FOREIGN KEY (user_id) REFERENCES member(user_id) ON DELETE CASCADE
);
-- board에 rcnt추가
--alter table board add (rcnt number(30) default 0);
-- board에 nickname추가
--alter table board add (nickname VARCHAR2(200));

insert into board (bno, user_id,title,content,nickname,regdate) values(nextval('bno'),"phantom1994","제목"
,"내용","띠용",sysdate());

select * from board;

select @ROWNUM:=@ROWNUM+1 as row, A.* from board A, (select @ROWNUM:=0) R;

select * from (select @rownum:=@rownum+1 as rnum, A.* from board A, (select @rownum:=0) TMP) TPM where rnum > 1 and rnum < 5;

SELECT @ROWNUM:=@ROWNUM+1, board.*
FROM  board
WHERE (@ROWNUM:=0)=0
;

set @rownum:=0;
select @rownum:=@rownum+1 from board;

select @rownum:=@rownum+1 as rnum, A.* from board A, (select @rownum:=0) TMP;