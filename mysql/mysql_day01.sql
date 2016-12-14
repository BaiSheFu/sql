SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS test;

USE test;

#����
-- ����آ�ܳ��� 30 ���ַ�
-- ���������������ɶ����
-- ���е� SQL ��䶼���ԡ� ; ����β
CREATE TABLE user_test(
									id  int,
									password varchar(6),
									name varchar(20),
									phone varchar(11),
									email varchar(20)
									)
alter table user_test modify email varchar(50);

insert into user_test values(1001,'123456','����','13468857714','linglongxin24@163.com');

SELECT * from user_test;

desc user_test;

SELECT name FROM user_test where name='����';



CREATE TABLE dept_test(
dept_id int(2),
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
											emp_id INT(4),
											name VARCHAR(20),
											job VARCHAR(20),
											salary FLOAT(7,2),
											bonus FLOAT(7,2),
											hire_date DATE,
											manager INT(4),
											dept_test_id INT(2)
);

DESC emp_test;

SELECT * FROM EMP_TEST;


#��ʽ��������DATE_FORMAT(date,format)��Oracle������Oracle��TO_DATE(ch, fmt)
INSERT INTO emp_test VALUES(1001,'���޼�','Manager','10000','2000',DATE_FORMAT('2010-01-12','%y-%m-%d'),1005,10);
INSERT INTO emp_test VALUES(1002,'������','Analyst', 8000 , 1000 ,DATE_FORMAT('2011-01-12','%y-%m-%d'),1001,10);
INSERT INTO emp_test VALUES(1003, '���' ,'Analyst',9000 , 1000 ,DATE_FORMAT('2010-02-11','%y-%m-%d'),1001,10);
INSERT INTO emp_test VALUES(1004,'��ܽ��','Programmer',5000, NULL ,DATE_FORMAT('2010-02-11','%y-%m-%d'),1001,10);

INSERT INTO emp_test VALUES(1005 , '������' , 'President' ,15000 , NULL ,DATE_FORMAT('2008-02-15','%y-%m-%d'),NULL,20);
INSERT INTO emp_test VALUES(1006 , '��С��' , 'Manager' ,5000 ,400 ,DATE_FORMAT('2009-02-12','%y-%m-%d') , 1005 , 20);
insert into emp_test values(1007 , '½��˫' , 'clerk' ,3000 , 500 , DATE_FORMAT('2009-02-01','%y-%m-%d') , 1006 , 20) ;
insert into emp_test values(1008 , '����' , 'Manager' ,5000 , 500 , DATE_FORMAT('2009-11-01','%y-%m-%d') , 1005 , 30) ;
insert into emp_test values(1009 , 'ΤС��' , 'salesman' ,4000 , null , DATE_FORMAT('2009-05-20','%y-%m-%d') , 1008 , 30) ;
insert into emp_test values(1010 , '����' , 'salesman' ,4500 , 500 , DATE_FORMAT('2009-10-10','%y-%m-%d') , 1008 , 30) ;

SELECT * FROM emp_test;
SELECT * FROM dept_test;

SELECT name,salary,salary*12 year_salary
	FROM emp_test;


#�ǿ��ж���IFNULL(expr1,expr2)��Oracle������Oracle��NVL(expr1, expr2)
SELECT name,salary,bonus,salary+ IFNULL(bonus,0) month_salary
	FROM emp_test;
	INSERT INTO emp_test (emp_id,name) VALUES(1011,'�����');

SELECT name,IFNULL(job,'no positon') job
			FROM emp_test;

SELECT name,IFNULL(hire_date,'2016-12-12') hire_date
			FROM emp_test;

#�����ַ�����CONCAT(str1,str2,...)��Oracle������Oracle��||
SELECT emp_id,CONCAT(name,' job is ',job) detail
			FROM emp_test;

#���Ʊ�
CREATE TABLE emp_test2 AS SELECT * FROM emp_test;
SELECT * FROM emp_test2;

#DISTINCT
SELECT DISTINCT job FROM emp_test;
SELECT DISTINCT dept_test_id FROM emp_test;
SELECT DISTINCT job,dept_test_id FROM emp_test;

#нˮ��ء 10000 Ԫ��Ա�����ݣ�
SELECT * FROM emp_test WHERE salary>10000; 

#ְλ�� Analyst ��Ա�����ݣ�SQL ����Сдآ���� , ���ݴ�Сд����
SELECT * FROM emp_test WHERE LOWER(job)='analyst'; 

#нˮ��ء 5000 ����Сء 10000 ��Ա�����ݣ�>=<=��between and
SELECT * FROM emp_test WHERE salary>=5000 AND salary<=10000; 
SELECT * FROM emp_test WHERE salary BETWEEN 5000 AND 10000; 

#��ְʱ���� 2011 ���Ա����
SELECT * FROM emp_test WHERE hire_date=DATE_FORMAT('2011','%y'); 
SELECT * FROM emp_test WHERE hire_date BETWEEN DATE_FORMAT('2011-01-01','%y-%m-%d') AND DATE_FORMAT('2011-12-31','%y-%m-%d') ; 

#�г�ְλ�� Manager ���� Analyst ��Ա��
SELECT * FROM emp_test WHERE job IN('Manager','Analyst');

#�г�ְλ�а����� sales �ַ���Ա�����ݣ�
SELECT * FROM emp_test WHERE LOWER(job) LIKE '%sales%'

#�г�ְλ�еڶ����ַ��� a ��Ա�����ݣ�
SELECT * FROM emp_test WHERE LOWER(job) LIKE '_a%'

#��ѯ���ݿ����ж��ٸ������а��� 'EMP' �ı�
#SELECT COUNT(*) FROM USER_TABLES WHERE TABLE_NAME LIKE '%EMP%';

insert into emp_test values(1012 , 'text_test' , 'salesman' ,4500 , 500 , DATE_FORMAT('2009-10-10','%y-%m-%d') , 1008 , 30) ;

SELECT * FROM emp_test;

#mysql-- ���Ҫ��ѯ���������������ַ�( ����_��% ),
-- ����ģ����ѯʱ ,
-- ��Ҫ����\���ű�ʾת�� , �����Oracle������ escape ����ָ��ת���ַ�\mysql����
SELECT name FROM emp_test WHERE name LIKE '%\_%';
DELETE FROM emp_test WHERE emp_id=1012 

#��ѯ��ЩԱ��û�н���
SELECT * FROM emp_test WHERE bonus IS NULL;

#нˮآ�� 5000 �� 8000 ��Ա����
SELECT * FROM emp_test WHERE salary NOT BETWEEN 5000 AND 8000;

#آ�ǲ��� 20 �Ͳ��� 30 ��Ա����
SELECT * FROM emp_test WHERE dept_test_id NOT IN(20,30);


