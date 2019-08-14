drop table jg_guest;

create table jg_guest(
idx int not null primary key, --�Խù� �Ϸ� ��ȣ
email varchar2(200) not null, --�̸���
passwd varchar2(50) not null, --���������� ���
content varchar2(1000) not null, --����
post_date date default sysdate --�ۼ��Ͻ�
);

drop sequence jg_guest_seq; 

create sequence jg_guest_seq
start with 1 --1���� ����
increment by 1 --1�� ����
nomaxvalue --������ ����
nocache; 

insert into jg_guest (idx, email, passwd, content) 
	    values (jg_guest_seq.nextval, 
	    'jg@gmail.com', '135', '���ǵ帳�ϴ�.');

select * from jg_guest;



commit;


