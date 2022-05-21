SET SERVEROUTPUT ON;
SET VERIFY OFF;

drop table mcq;

create table mcq(
qid number  Primary Key,
ques varchar2(100));

CREATE OR REPLACE TRIGGER starting 
BEFORE INSERT 
ON mcq
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Mcq table create staring');
END;
/

insert into mcq values(1,'I do not talk a lot.');
insert into mcq values(2,'I have a soft heart.');
insert into mcq values(3,'I am always prepared');
insert into mcq values(4,'I seldom feel blue.');
insert into mcq values(5,'I have a vivid imagination.');

commit;

