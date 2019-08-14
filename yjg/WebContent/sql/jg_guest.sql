drop table jg_guest;

create table jg_guest(
idx int not null primary key, --게시물 일련 번호
email varchar2(200) not null, --이메일
passwd varchar2(50) not null, --수정삭제용 비번
content varchar2(1000) not null, --본문
post_date date default sysdate --작성일시
);

drop sequence jg_guest_seq; 

create sequence jg_guest_seq
start with 1 --1부터 시작
increment by 1 --1씩 증가
nomaxvalue --무제한 증가
nocache; 

insert into jg_guest (idx, email, passwd, content) 
	    values (jg_guest_seq.nextval, 
	    'jg@gmail.com', '135', '문의드립니다.');

select * from jg_guest;



commit;


