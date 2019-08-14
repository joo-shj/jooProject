drop table jg_board; 

create table jg_board (
num number not null primary key, --�Խù���ȣ 
writer varchar2(50) not null, --�ۼ���
subject varchar2(50) not null, --����
passwd varchar2(60) not null, --����/���� ��� 
reg_date date default sysdate, --�ۼ����� 
readcount number default 0,	--��ȸ��
ref number not null,		--�Խù��׷� 
re_step number not null,		--�Խù��׷��� ���� 
re_level number not null,	--�亯 �ܰ�
content varchar2(4000) not null, --����
ip varchar2(30) not null,	--�ۼ��� ip 
filename varchar2(200),
filesize number default 0, 
down number default 0 --�ٿ�ε� Ƚ��
);

select * from jg_board;

insert into jg_board
(num,writer,subject,passwd,ref,re_step,re_level,content,ip,filename,filesize,down) 
values
( (select nvl(max(num)+1,1) from board)
  ,'kim','����','1234'
  ,(select nvl(max(num)+1,1) from board)
  ,1,0,'����','127.0.0.1','�ѱ���',5,15);

select * from jg_board order by num desc;

commit;




--3�� �Խù��� ÷������ �̸�
select filename
from board
where num=1;

--�ٿ�ε�� ���� ó��
update board set down=down+1 where num=2; 
commit;

--��ȸ�� ���� ó��
update board set readcount=readcount+1 where num=2;

commit;

--1�� �Խù��� ���� ��ȸ
select * from board where num=1;

delete from board; 


--��� ���̺�
-- references ���̺�(�÷�)	Foreign Key(�ܷ�Ű) 
create table board_comment (
comment_num number not null primary key, --��� �Ϸù�ȣ 
board_num number not null references board(num), --Foreign Key 
writer varchar2(50) not null,
content clob not null, --ū������ ó���� �� �ְ� clob�� �ẻ��.
reg_date date default sysdate
);

--1�� �Խù��� ��� �߰�  (���� 100���� ���� ���� ������ �������� ������ foreign key�����߾���)
insert into board_comment
(comment_num,board_num,writer,content) values
((select nvl(max(comment_num)+1,1) from board_comment)
, 1, 'kim', '���...');
--������ insert�غ�
