--����
-- ����آ�ܳ��� 30 ���ַ�
-- ���������������ɶ����
-- ���е� SQL ��䶼���ԡ� ; ����β
CREATE TABLE user_test(
									id  number(4),
									password char(6),
									name char(20),
									phone char(11),
									email varchar(20)
									)
alter table user_test modify email varchar(50);

insert into user_test values(1001,'123456','����','13468857714','linglongxin24@163.com');

SELECT * from user_test;


CREATE TABLE dept_test(
dept_id NUMBER(2),
dept_name CHAR(20),
dept_location CHAR(20)
);

desc dept_test;

INSERT INTO dept_test VALUES(10,'developer','beijing');

INSERT INTO dept_test VALUES(20,'account','shanghai');

INSERT INTO dept_test VALUES(30,'sales','guangzhou');

INSERT INTO dept_test VALUES(40,'operations','tianjin');

SELECT * FROM dept_test;

CREATE TABLE emp_test(
											emp_id NUMBER(4),
											name VARCHAR(20),
											job VARCHAR(20),
											salary NUMBER(7,2),
											bonus NUMBER(7,2),
											hire_date DATE,
											manager NUMBER(4),
											dept_test_id NUMBER(2)
);

DESC emp_test;

SELECT * FROM EMP_TEST;

INSERT INTO emp_test VALUES(1001,'���޼�','Manager','10000','2000',TO_DATE('2010-01-12','yyyy-mm-dd'),1005,10);
INSERT INTO emp_test VALUES(1002,'������','Analyst', 8000 , 1000 ,TO_DATE('2011-01-12','yyyy-mm-dd'),1001,10);
INSERT INTO emp_test VALUES(1003,'���' ,'Analyst',9000 , 1000 ,TO_DATE('2010-02-11','yyyy-mm-dd'),1001,10);
INSERT INTO emp_test VALUES(1004,'��ܽ��','Programmer',5000, NULL ,TO_DATE('2010-02-11','yyyy-mm-dd'),1001,10);

INSERT INTO emp_test VALUES(1005 , '������' , 'President' ,15000 , NULL ,TO_DATE('2008-02-15','yyyy-mm-dd'),NULL,20);
INSERT INTO emp_test VALUES(1006 , '��С��' , 'Manager' ,5000 ,400 , '01-FEB-09' , 1005 , 20);
insert into emp_test values(1007 , '½��˫' , 'clerk' ,3000 , 500 , '01-FEB-09' , 1006 , 20) ;
insert into emp_test values(1008 , '����' , 'Manager' ,5000 , 500 , '1-MAY-09' , 1005 , 30) ;
insert into emp_test values(1009 , 'ΤС��' , 'salesman' ,4000 , null , '20-FEB-09' , 1008 , 30) ;
insert into emp_test values(1010 , '����' , 'salesman' ,4500 , 500 , '10-MAY-09' , 1008 , 30) ;



SELECT * FROM emp_test;
SELECT * FROM dept_test;

SELECT name,salary,salary*12 year_salary
	FROM emp_test;

SELECT name,salary,bonus,salary+ nvl(bonus,0) month_salary
	FROM emp_test;


	INSERT INTO emp_test (emp_id,name) VALUES(1011,'�����');

SELECT name,NVL(job,'no positon') job
			FROM emp_test;


SELECT name,NVL(hire_date,TO_DATE('2016-12-12','yyyy-mm-dd')) hire_date
			FROM emp_test;

--�����ַ�����CONCAT(str1,str2,...)��Oracle������Oracle��||
SELECT emp_id,name||' job is '||job detail
			FROM emp_test;
--���Ʊ�
CREATE TABLE emp_test2 AS SELECT * FROM emp_test;
SELECT * FROM emp_test2;

--DISTINCT
SELECT DISTINCT job FROM emp_test;
SELECT DISTINCT dept_test_id FROM emp_test;
SELECT DISTINCT job,dept_test_id FROM emp_test;

--нˮ��ء 10000 Ԫ��Ա�����ݣ�
SELECT * FROM emp_test WHERE salary>10000; 

--ְλ�� Analyst ��Ա�����ݣ�SQL ����Сдآ���� , ���ݴ�Сд����
SELECT * FROM emp_test WHERE LOWER(job)='analyst'; 


--нˮ��ء 5000 ����Сء 10000 ��Ա�����ݣ�>=<=��between and
SELECT * FROM emp_test WHERE salary>=5000 AND salary<=10000; 
SELECT * FROM emp_test WHERE salary BETWEEN 5000 AND 10000; 

--��ְʱ���� 2011 ���Ա����
SELECT * FROM emp_test WHERE hire_date=TO_DATE('2011','yyyy'); 
SELECT * FROM emp_test WHERE hire_date BETWEEN TO_DATE('2011-01-01','yyyy-mm-dd') AND TO_DATE('2011-12-31','yyyy-mm-dd') ; 


--�г�ְλ�� Manager ���� Analyst ��Ա��
SELECT * FROM emp_test WHERE job IN('Manager','Analyst');

--�г�ְλ�а����� sales �ַ���Ա�����ݣ�
SELECT * FROM emp_test WHERE LOWER(job) LIKE '%sales%';

--�г�ְλ�еڶ����ַ��� a ��Ա�����ݣ�
SELECT * FROM emp_test WHERE LOWER(job) LIKE '_a%';

--��ѯ���ݿ����ж��ٸ������а��� 'EMP' �ı�
SELECT COUNT(*) FROM USER_TABLES WHERE TABLE_NAME LIKE '%EMP%';

insert into emp_test values(1012 , 'text_test' , 'salesman' ,4500 , 500 , TO_DATE('2011-01-01','yyyy-mm-dd') , 1008 , 30) ;

SELECT * FROM emp_test;
--���Ҫ��ѯ���������������ַ�( ����_��% ),
-- ����ģ����ѯʱ ,
-- ��Ҫ����\���ű�ʾת�� , �����Oracle������ escape ����ָ��ת���ַ�\mysql����
SELECT name FROM emp_test WHERE name LIKE '%\_%' ESCAPE'\';
DELETE FROM emp_test WHERE emp_id=1012 

--��ѯ��ЩԱ��û�н���
SELECT * FROM emp_test WHERE bonus IS NULL;


--нˮآ�� 5000 �� 8000 ��Ա����
SELECT * FROM emp_test WHERE salary NOT BETWEEN 5000 AND 8000;


--آ�ǲ��� 20 �Ͳ��� 30 ��Ա����
SELECT * FROM emp_test WHERE dept_test_id NOT IN(20,30);
