drop table jg_board; 

create table jg_board (
num number not null primary key, --게시물번호 
writer varchar2(50) not null, --작성자
subject varchar2(50) not null, --제목
passwd varchar2(60) not null, --수정/삭제 비번 
reg_date date default sysdate, --작성일자 
readcount number default 0,	--조회수
ref number not null,		--게시물그룹 
re_step number not null,		--게시물그룹의 순번 
re_level number not null,	--답변 단계
content varchar2(4000) not null, --본문
ip varchar2(30) not null,	--작성자 ip 
filename varchar2(200),
filesize number default 0, 
down number default 0 --다운로드 횟수
);

select * from jg_board;

insert into jg_board
(num,writer,subject,passwd,ref,re_step,re_level,content,ip,filename,filesize,down) 
values
( (select nvl(max(num)+1,1) from board)
  ,'kim','제목','1234'
  ,(select nvl(max(num)+1,1) from board)
  ,1,0,'내용','127.0.0.1','한국사',5,15);

select * from jg_board order by num desc;

commit;




--3번 게시물의 첨부파일 이름
select filename
from board
where num=1;

--다운로드수 증가 처리
update board set down=down+1 where num=2; 
commit;

--조회수 증가 처리
update board set readcount=readcount+1 where num=2;

commit;

--1번 게시물에 대한 조회
select * from board where num=1;

delete from board; 


--댓글 테이블
-- references 테이블(컬럼)	Foreign Key(외래키) 
create table board_comment (
comment_num number not null primary key, --댓글 일련번호 
board_num number not null references board(num), --Foreign Key 
writer varchar2(50) not null,
content clob not null, --큰내용을 처리할 수 있게 clob을 써본다.
reg_date date default sysdate
);

--1번 게시물에 댓글 추가  (만약 100번에 대한 글이 없으면 에러나기 때문에 foreign key설정했었음)
insert into board_comment
(comment_num,board_num,writer,content) values
((select nvl(max(comment_num)+1,1) from board_comment)
, 1, 'kim', '댓글...');
--여러번 insert해봄
