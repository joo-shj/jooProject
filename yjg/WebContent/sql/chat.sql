create table chat(
chatID number primary key,
chatName varchar(20),
chatContent varchar(100),
chatTime date default sysdate
);

commit;
--drop table chat;

create sequence chatID_seq
start with 1
increment by 1;


