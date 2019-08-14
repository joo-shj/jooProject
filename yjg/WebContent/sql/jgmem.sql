drop table jgmem;

create table jgmem (
userid varchar2(50) not null primary key,
passwd varchar2(100) not null,
name varchar2(50) not null,
email varchar2(200) not null,
hp varchar2(100) not null,
zipcode varchar2(10),
address1 varchar2(500),
address2 varchar2(500),
jgm_group varchar2(2) default '1',
join_date date default sysdate
);

--jgm_group ȸ������(1)
insert into jgmem 
(userid,passwd,name,email,hp,zipcode,address1,address2,jgm_group) 
values
('kim001','1234','��ö��','kim001@naver.com','010-222-3333','04705','���� ������ ����ڷ� 305','������� 2��','1');

--jgm_group �����ڰ���(2)
insert into jgmem 
(userid,passwd,name,email,hp,zipcode,address1,address2,jgm_group) 
values
('admin','admin','������','admin@admin.com','010-111-2222','06267','���� ������ ������� 238','3��','2');

select * from jgmem ;

select * from jgmem order by join_date desc;
select userid from jgmem where userid='kim001' and passwd='1234';
select userid,passwd,name,email,hp,zipcode,address1,address2
		from jgmem
		where userid like 'kim001' 
		order by join_date desc;
select count(*) from jgmem 
	    where userid='kim001';
update jgmem set 
         jgm_group='2' where userid='admin';        
   

        
        
--��ȸ
select * from jgmem;
--����
update jgmem set passwd='1350' 
where userid='kim001'; 

--����
delete from jgmem where userid='admin'; 

--��� ���ڵ� ����
delete from jgmem;


select userid,name,email,hp,zipcode,address1,address2
		from jgmem
		where userid like '%'||'admin'||'%';


select * from jgmem where
		userid='admin';

commit;

