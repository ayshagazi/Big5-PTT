SET SERVEROUTPUT ON;
SET VERIFY OFF;

drop table mcq1;
drop table UserInput;
drop table UserInfo;

create table UserInfo(
	userid int,
	name VARCHAR2(500), 
	gender VARCHAR2(500),
	age int,
	PRIMARY KEY (userid));

create table mcq1(
qid number  Primary Key,
ques varchar2(100));

CREATE OR REPLACE TRIGGER done 
AFTER INSERT 
ON mcq1
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Mcq table created successfully');
END;
/

insert into mcq1 values(6,'I am not interested in abstract ideas.');
insert into mcq1 values(7,'I am easily disturbed. .');
insert into mcq1 values(8,'I make a mess of things.');
insert into mcq1 values(9,'I feel little concern for others.');
insert into mcq1 values(10,' Have difficulty understanding abstract ideas');	

create table UserInput(
    userid int,
    extro1 int,
	agree1 int,
	cons1 int,
	neuro1 int,
	open1 int,
	open2 int,
	neuro2 int,
	cons2 int,
	agree2 int,
	extro2 int,
	FOREIGN KEY (userid) REFERENCES UserInfo (userid));
	
commit;


CREATE OR REPLACE PACKAGE pack5 AS
    FUNCTION calculation(A IN UserInput.userid%TYPE)
	RETURN UserInput.userid%TYPE;
	
	
	PROCEDURE info(A IN UserInfo.userid%TYPE,B IN UserInfo.name%TYPE,C IN UserInfo.gender%TYPE,D IN UserInfo.age%TYPE);
	PROCEDURE Mvalues(N99 IN UserInput.userid%TYPE,N1 IN UserInput.extro1%TYPE,N2 IN UserInput.agree1%TYPE,N3 IN UserInput.cons1%TYPE,N4 IN UserInput.neuro1%TYPE,N5 IN UserInput.open1%TYPE,N6 IN UserInput.open2%TYPE, N7 IN UserInput.neuro2%TYPE, N8 IN UserInput.cons2%TYPE, N9 IN UserInput.agree2%TYPE, N10 IN UserInput.extro2%TYPE);

END pack5;
/


CREATE OR REPLACE PACKAGE BODY pack5 AS

 FUNCTION calculation(A IN UserInput.userid%TYPE)
 
	RETURN UserInput.userid%TYPE
	IS
	B UserInput.userid%TYPE;
   
    CURSOR find_score
    IS
    select sum(extro1+agree1+cons1+neuro1+open1-open2-neuro2-cons2-agree2-extro2) as e from UserInput where userid=A;
    BEGIN
	 OPEN find_score;
        FETCH find_score INTO B;
	 CLOSE find_score;
	
	RETURN B;
	
	END calculation;
	

	
	
	PROCEDURE info(A IN UserInfo.userid%TYPE,B IN UserInfo.name%TYPE,C IN UserInfo.gender%TYPE,D IN UserInfo.age%TYPE)
	IS
	BEGIN
    
	INSERT INTO UserInfo VALUES(A,B,C,D);

	END info;
	
	
	PROCEDURE Mvalues(N99 IN UserInput.userid%TYPE,N1 IN UserInput.extro1%TYPE,N2 IN UserInput.agree1%TYPE,N3 IN UserInput.cons1%TYPE,N4 IN UserInput.neuro1%TYPE,N5 IN UserInput.open1%TYPE,N6 IN UserInput.open2%TYPE, N7 IN UserInput.neuro2%TYPE, N8 IN UserInput.cons2%TYPE, N9 IN UserInput.agree2%TYPE, N10 IN UserInput.extro2%TYPE)
	IS
	BEGIN
    insert into UserInput values (N99,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10);
	
	
    END Mvalues;


END pack5;
/





CREATE OR REPLACE PACKAGE pack4 AS
    FUNCTION extro(A IN UserInput.userid%TYPE)
	RETURN UserInput.userid%TYPE;
	
	FUNCTION agree(A IN UserInput.userid%TYPE)
	RETURN UserInput.userid%TYPE;
	
	FUNCTION consci(A IN UserInput.userid%TYPE)
	RETURN UserInput.userid%TYPE;
	
	
	FUNCTION neuro(A IN UserInput.userid%TYPE)
	RETURN UserInput.userid%TYPE;
	
	 FUNCTION openn(A IN UserInput.userid%TYPE)
	RETURN UserInput.userid%TYPE;
	
END pack4;
/



CREATE OR REPLACE PACKAGE BODY pack4 AS
 FUNCTION extro(A IN UserInput.userid%TYPE)
	RETURN UserInput.userid%TYPE
	IS
	C UserInput.userid%TYPE;
   
    CURSOR find_score
    IS
    select sum(11+extro1+agree1+cons1+neuro1+open1-open2-neuro2-cons2-agree2-extro2) as e from UserInput where userid=A;
    BEGIN
	 OPEN find_score;
        FETCH find_score INTO C;
	 CLOSE find_score;
	
	RETURN C;
	
	END extro;
	
	FUNCTION agree(A IN UserInput.userid%TYPE)
 
	RETURN UserInput.userid%TYPE
	IS
	B UserInput.userid%TYPE;
   
    CURSOR find_score
    IS
    select sum(13+extro1+agree1+cons1+neuro1+open1-open2-neuro2-cons2-agree2-extro2) as e from UserInput where userid=A;
    BEGIN
	 OPEN find_score;
        FETCH find_score INTO B;
	 CLOSE find_score;
	
	RETURN B;
	
	END agree;
	
	
	FUNCTION consci(A IN UserInput.userid%TYPE)
 
	RETURN UserInput.userid%TYPE
	IS
	B UserInput.userid%TYPE;
   
    CURSOR find_score
    IS
    select sum(14+extro1+agree1+cons1+neuro1+open1-open2-neuro2-cons2-agree2-extro2) as e from UserInput where userid=A;
    BEGIN
	 OPEN find_score;
        FETCH find_score INTO B;
	 CLOSE find_score;
	
	RETURN B;
	
	END consci;
	
	FUNCTION neuro(A IN UserInput.userid%TYPE)
 
	RETURN UserInput.userid%TYPE
	IS
	B UserInput.userid%TYPE;
   
    CURSOR find_score
    IS
    select sum(11+extro1+agree1+cons1+neuro1+open1-open2-neuro2-cons2-agree2-extro2) as e from UserInput where userid=A;
    BEGIN
	 OPEN find_score;
        FETCH find_score INTO B;
	 CLOSE find_score;
	
	RETURN B;
	
	END neuro;
	
	
	FUNCTION openn(A IN UserInput.userid%TYPE)
 
	RETURN UserInput.userid%TYPE
	IS
	B UserInput.userid%TYPE;
   
    CURSOR find_score
    IS
    select sum(10+extro1+agree1+cons1+neuro1+open1-open2-neuro2-cons2-agree2-extro2) as e from UserInput where userid=A;
    BEGIN
	 OPEN find_score;
        FETCH find_score INTO B;
	 CLOSE find_score;
	
	RETURN B;
	
	END openn;
	
	END pack4;
/

create or replace view view_mcq(view_qid,view_ques) as
 select R.qid , R.ques from mcq@site_link R;
 select * from view_mcq;




Accept u number prompt "Enter the your ID: "
Accept x char prompt "Enter Name: "
Accept y char prompt "Enter Gender (male or female):"
Accept z number prompt "Enter the your age: "


select ques from mcq@site_link where qid=1;
Accept a number prompt "1. Disagree 2. Slightly disagree 3. Neutral 4. slightly agree 5.Agree  ***Answer***="
select ques from mcq@site_link where qid=2;
Accept b number prompt "1. Disagree 2. Slightly disagree 3. Neutral 4. slightly agree 5.Agree ***Answer***="
select ques from mcq@site_link where qid=3;
Accept c number prompt "1. Disagree 2. Slightly disagree 3. Neutral 4. slightly agree 5.Agree ***Answer***="
select ques from mcq@site_link where qid=4;
Accept d number prompt "1. Disagree 2. Slightly disagree 3. Neutral 4. slightly agree 5.Agree ***Answer***="
select ques from mcq@site_link where qid=5;
Accept e number prompt "1. Disagree 2. Slightly disagree 3. Neutral 4. slightly agree 5.Agree ***Answer***="

select ques from mcq1 where qid=6;
Accept f number prompt "1. Disagree 2. Slightly disagree 3. Neutral 4. slightly agree 5.Agree ***Answer***="
select ques from mcq1 where qid=7;
Accept g number prompt "1. Disagree 2. Slightly disagree 3. Neutral 4. slightly agree 5.Agree ***Answer***="
select ques from mcq1 where qid=8;
Accept h number prompt "1. Disagree 2. Slightly disagree 3. Neutral 4. slightly agree 5.Agree ***Answer***="
select ques from mcq1 where qid=9;
Accept i number prompt "1. Disagree 2. Slightly disagree 3. Neutral 4. slightly agree 5.Agree ***Answer***="
select ques from mcq1 where qid=10;
Accept j number prompt "1. Disagree 2. Slightly disagree 3. Neutral 4. slightly agree 5.Agree ***Answer***="


DECLARE
M4 UserInfo.userid%TYPE:=&u;
M1 UserInfo.name%TYPE:='&x';
M2 UserInfo.gender%TYPE:='&y';
M3 UserInfo.age%TYPE:=&z;



N99 UserInput.userid%TYPE:=&u;
N1 UserInput.extro1%TYPE :=&a;
N2 UserInput.agree1 %TYPE :=&b;
N3 UserInput.cons1%TYPE :=&c;
N4 UserInput.neuro1%TYPE :=&d;
N5 UserInput.open1%TYPE :=&e;
N6 UserInput.open2%TYPE :=&f;
N7 UserInput.neuro2%TYPE :=&g;
N8 UserInput.cons2%TYPE :=&h;
N9 UserInput.agree2%TYPE :=&i;
N10 UserInput.extro2%TYPE :=&j;




Y INTEGER;
FLAG NUMBER :=0;
mScore UserInput.userid%TYPE;
ext UserInput.userid%TYPE;
agr UserInput.userid%TYPE;
con UserInput.userid%TYPE;
neu UserInput.userid%TYPE;
ope UserInput.userid%TYPE;
C NUMBER;

extroversion int;
agreeableness int;
conscientiousness int;
neuroticism int;
opneness int;

userDefException EXCEPTION;
valueException EXCEPTION;
aboveException EXCEPTION;
userIdException EXCEPTION;


BEGIN
  
  IF N1<1 OR N2<1 OR N3<1 OR N4<1 OR N5<1 OR N6<1 OR N7<1 OR N8<1 OR N9<1 OR N10<1 THEN
        RAISE valueException;
  END IF;		
  
  IF N1>5 OR N2>5 OR N3>5 OR N4>5  OR N5>5 OR N6>5 OR N7>5 OR N8>5 OR N9>5 OR N10>5 THEN
        RAISE aboveException;
  END IF;
  
  IF M3<0 THEN
		RAISE userDefException;
  END IF;
  
  FOR R IN (SELECT userid FROM UserInfo) LOOP
        Y:=R.userid;
		IF Y=M4 THEN
		    FLAG:=1;
			exit;
		
		
		END IF;


    END LOOP;
   IF FLAG=1 THEN
	    RAISE userIdException;
    ELSE
      info(M4,M1,M2,M3);
  
	  Mvalues(N99,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10); 
      
	    mScore:=calculation(N99);
		
		ext :=extro(N99);
		agr :=agree(N99);
		con :=consci(N99);
		neu :=neuro(N99);
		ope:=openn(N99);
		
		
	extroversion:= mScore+20;
	agreeableness := mScore-14;
	conscientiousness:= mScore+14;
	neuroticism := mScore+38;
	opneness := mScore+8;


	
		
		
		
    IF (ext >= agr and ext >= con and ext >= neu and ext >= ope) THEN

	DBMS_OUTPUT.PUT_LINE('Personality:');
		DBMS_OUTPUT.PUT_LINE('Extroversion (E) is the personality trait of seeking fulfillment from sources outside the self or
in community. High scorers tend to be very social while low scorers prefer to work on their projects alone');
    ELSIF (agr >= ext and agr >= con and agr >= neu and agr >= ope) THEN
	DBMS_OUTPUT.PUT_LINE('Personality:');
  		DBMS_OUTPUT.PUT_LINE('Agreeableness (A) reflects much individuals adjust their behavior to suit others. High scorers
are typically polite and like people. Low scorers tend to tell it like it is');
    ELSIF (con >= ext and con >= agr and con >= neu and con >= ope) THEN
	DBMS_OUTPUT.PUT_LINE('Personality:');
  		DBMS_OUTPUT.PUT_LINE('Conscientiousness (C)  the personality trait which being honest+ hardworking. High scorers
tend follow rules  prefer clean homes. Low scorers may be messy cheat other');
      ELSIF (neu >= ext and neu >= agr and neu >= ope) THEN
  
	DBMS_OUTPUT.PUT_LINE('Personality:');
  		DBMS_OUTPUT.PUT_LINE('Neuroticism (N) the personality trait being emotional');
		
		  ELSIF (ope >= ext and ope >= agr and ope >= neu) THEN
    DBMS_OUTPUT.PUT_LINE('------');
	DBMS_OUTPUT.PUT_LINE('Personality:');
  		DBMS_OUTPUT.PUT_LINE('Openness to Experience (O) is the personality trait of seeking new experience and intellectual
pursuits. High scores may day dream a lot. Low scorers may be very down to earth');
    ELSE 
    DBMS_OUTPUT.PUT_LINE('------');
	DBMS_OUTPUT.PUT_LINE('Personality:');
		DBMS_OUTPUT.PUT_LINE('You have a mixed personality');	
    END IF;
  		
  END IF;
  
 EXCEPTION
	WHEN userDefException THEN
		DBMS_OUTPUT.PUT_LINE('Age Cannot be NEGATIVE');
	
    WHEN userIdException THEN
		DBMS_OUTPUT.PUT_LINE('User ID already exists');	
		
	WHEN valueException THEN
		DBMS_OUTPUT.PUT_LINE('Invalid input, should be greater then zero');	
		
	WHEN aboveException THEN
		DBMS_OUTPUT.PUT_LINE('Invalid input, should be less than or equal to five');		
	
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('OTHER ERRORS FOUND'); 

END;
/	
commit;