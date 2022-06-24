SELECT student.STU_ID 
FROM STUDENT, DEPARTMENT
WHERE student.DEPT_ID = department.DEPT_ID AND 
	  student.YEAR = 3 AND 
	  department.DEPT_NAME =  '��ǻ�Ͱ��а�';
	  	 
SELECT name, stu_id
FROM STUDENT s 
WHERE YEAR = 3 OR YEAR = 4
	 
SELECT name, stu_id
FROM STUDENT s 
WHERE YEAR = 3 OR YEAR = 4
ORDER BY name, STU_ID

SELECT name, stu_id
FROM STUDENT s 
WHERE YEAR = 3 OR YEAR = 4
ORDER BY 1 desc, STU_ID

SELECT s2.name
FROM STUDENT s1, STUDENT s2
WHERE s1.ADDRESS = s2.ADDRESS AND s1.NAME = '�豤��'

SELECT name, POSITION, 2022-YEAR_emp
FROM PROFESSOR

SELECT name �̸�, POSITION ����, 2012-YEAR_emp ��������
FROM PROFESSOR

SELECT *
FROM STUDENT
WHERE name LIKE '��%'	--�达���� ���� �л��� ������

SELECT * 
FROM STUDENT 
WHERE RESIDENT_ID LIKE '%*2%'	--���л��� ã��

SELECT * FROM STUDENT WHERE RESIDENT_ID LIKE '8%'

SELECT name FROM STUDENT
UNION ALL	--all�� ���̸� �ߺ��� �������� �ʰ� �����
SELECT name FROM PROFESSOR

SELECT s.stu_id
FROM STUDENT s, DEPARTMENT d, takes t
WHERE s.DEPT_ID = d.DEPT_ID AND 
	  t.STU_ID = s.STU_ID AND 
	  dept_name='��ǻ�Ͱ��а�' AND 
	  grade = 'A+'	--��ǻ�Ͱ��а� �л��� �߿��� ������ ������� ������ 'A+'���� �л����� �й�
	  
SELECT stu_id
FROM STUDENT s, DEPARTMENT d 
WHERE s.DEPT_ID = d.DEPT_ID AND dept_name = '��ǻ�Ͱ��а�'
INTERSECT 
SELECT STU_ID 
FROM TAKES t 
WHERE grade = 'A+';	--���� ���� ���� ���ϴµ� �ٸ� ���


SELECT stu_id FROM STUDENT s , DEPARTMENT d 
WHERE s.DEPT_ID = d.DEPT_ID AND dept_name='������а�'
MINUS 
SELECT STU_ID FROM TAKES t
WHERE grade = 'A+';	--������а� �л��� �߿��� �ѹ��̶� A+�� ���� ���� �л����� �й��� �˻�

SELECT title, credit, YEAR, semester
FROM course, CLASS
WHERE course.COURSE_ID = class.COURSE_ID 

SELECT title, credit, YEAR, semester
FROM course LEFT OUTER JOIN CLASS
USING (course_id)

SELECT title, credit, YEAR, semester
FROM course, CLASS
WHERE course.COURSE_ID = class.COURSE_ID (+)

SELECT title, credit, YEAR, semester
FROM course RIGHT OUTER JOIN CLASS
USING (course_id)

SELECT title, credit, YEAR, semester
FROM course, CLASS
WHERE course.COURSE_ID (+) = class.COURSE_ID 

--���� �ܺ�����
SELECT title, credit, YEAR, semester
FROM course FULL OUTER JOIN CLASS c
USING (course_id)

--�����Լ� - count
SELECT count(*)
FROM STUDENT s 
WHERE YEAR = 3

--null ���� ������ �����ϴ� ������ count
SELECT count(COMM)
FROM EMP

SELECT * FROM EMP e

SELECT count(DISTINCT dept_id)
FROM STUDENT s 

SELECT * FROM STUDENT s 

SELECT count(*)
FROM STUDENT s, DEPARTMENT d 
WHERE s.DEPT_ID = d.DEPT_ID
	  AND d.DEPT_NAME = '��ǻ�Ͱ��а�'

--sum ��ü �������� �������� ��
SELECT sum(2022-year_emp)
FROM PROFESSOR p 

--sum emp���̺� ����� ��� �������� �޿� ���� ���
SELECT sum(sal)
FROM EMP e 

--sum ����(job�ʵ�)�� 'ANALYST'�� �������� �޿� ���� ���
SELECT sum(sal)
FROM EMP e 
WHERE job = 'ANALYST'

--sum �μ� �̸��� 'RESEARCH'�� �������� �޿� ���� ���
SELECT sum(sal)
FROM EMP e, DEPT d
WHERE e.DEPTNO = d.DEPTNO AND dname = 'RESEARCH'

--�� �������� �ߺ� ���� ���
SELECT DISTINCT job FROM EMP e 

--sum �� ������ �޿� �հ�
SELECT sum(sal) FROM EMP e WHERE e.JOB = 'SALESMAN'

SELECT sum(sal) FROM EMP e WHERE e.JOB = 'CLERK'

SELECT sum(sal) FROM EMP e WHERE e.JOB = 'MANAGER'

SELECT sum(sal) FROM EMP e WHERE e.JOB = 'ANALYST'

SELECT sum(sal) FROM EMP e WHERE e.JOB = 'PRESIDENT'

--avg ��ü ������ ��� ���������� ���
SELECT avg(2022-YEAR_emp) ����������� FROM PROFESSOR p 

--max, min �μ� �̸��� 'ACCOUNTING'�� ������ �߿��� �ִ�, �ּ� �޿��� ������ ���
SELECT max(sal) FROM EMP e, DEPT d WHERE e.DEPTNO = d.DEPTNO AND dname = 'ACCOUNTING'

SELECT min(sal) FROM EMP e, DEPT d WHERE e.DEPTNO = d.DEPTNO AND dname = 'ACCOUNTING'

SELECT max(sal) �ִ�޿�, min(sal) �ּұ޿�, avg(sal) �޿���� FROM EMP e, DEPT d WHERE e.DEPTNO = d.DEPTNO AND dname = 'ACCOUNTING';

--group by : student���̺��� �а���ȣ(dept_id�ʵ�) ���� ���ڵ� ������ ���
SELECT dept_id, count(*) FROM STUDENT s GROUP BY DEPT_ID 

--group by : �а���ȣ ��� department ���̺�� �����Ͽ� �а� �̸��� ���
SELECT dept_name, COUNT(*) FROM STUDENT s, DEPARTMENT d WHERE s.DEPT_ID = d.DEPT_ID GROUP BY DEPT_name

--group by : emp, dept ���̺��� �μ��� ������, ��ձ޿�, �ִ�޿�, �ּұ޿��� ���
SELECT dname, count(*) ������, avg(sal) ��ձ޿�, max(sal) �ִ�޿�, min(sal) �ּұ޿� FROM EMP e, DEPT d WHERE e.DEPTNO = d.DEPTNO GROUP BY dname

--group by : �л� �����ͺ��̽����� �а��� ���� ���ڿ� ��� ��������, �ִ� ���������� ���
SELECT dept_name, count(*) �а�����������, avg(2022-YEAR_emp) �����������, max(2022-year_emp) �ִ��������� FROM PROFESSOR p , DEPARTMENT d  WHERE p.DEPT_id = d.DEPT_id GROUP BY dept_name ORDER BY dept_name

--HAVING having ���� �̿��Ͽ� �ٽ� �ۼ�
SELECT dept_name, count(*), avg(2012-year_emp), max(2012-year_emp) 
FROM PROFESSOR p, DEPARTMENT d 
WHERE p.DEPT_ID = d.DEPT_ID 
GROUP BY dept_name 
having avg(2012-year_emp) >= 10

--HAVING ���� ���ڰ� 5�� �̻��� �μ��� ���ؼ� �μ��� ������, ��ձ޿�, �ִ�޿�, �ּұ޿��� ���
SELECT dname, count(*) ������, avg(sal) ��ձ޿�, max(sal) �ִ�޿�, min(sal) �ּұ޿�
FROM EMP e, DEPT d 
WHERE e.DEPTNO = d.DEPTNO 
GROUP BY dname
HAVING COUNT(*) >= 5 --�׷쿡 ���� ����

--NULL �˻�
SELECT * FROM emp WHERE COMM IS NULL 

SELECT * FROM emp WHERE COMM IS NOT NULL 

--null�� ó�� : takes ���̺��� ������ A+�� �ƴ� �л����� �й��� �˻�
SELECT stu_id FROM TAKES t WHERE grade<> 'A+'

SELECT stu_id FROM TAKES t WHERE NOT grade = 'A+'

SELECT stu_id FROM TAKES t WHERE grade != 'A+'

--in : 301ȣ ���ǽǿ��� ������ ������ ������� ���
SELECT title FROM course WHERE course_id IN (
											SELECT DISTINCT COURSE_ID
											FROM CLASS 
											WHERE classroom='301ȣ')
											 
--���� ������ ǥ��
SELECT DISTINCT TITLE
FROM COURSE C1, CLASS C2
WHERE C1.COURSE_ID = C2.COURSE_ID AND CLASSROOM = '301ȣ'

--2012�� 2�б⿡ �������� ���� ������� �˻�
SELECT title
FROM COURSE c 
WHERE COURSE_ID NOT IN (
					SELECT DISTINCT COURSE_ID
					FROM CLASS
					WHERE YEAR = 2012 AND semester=2)
							
--�� ����
CREATE OR REPLACE VIEW V_TAKES AS
SELECT stu_id, class_id FROM takes

--�� ����
SELECT * FROM V_TAKES

--�� ����
CREATE OR REPLACE VIEW cs_student AS
SELECT s.stu_id, s.resident_id, s.name, s.YEAR, s.address, s.dept_id
FROM student s, department d
WHERE s.DEPT_ID = d.DEPT_ID AND d.DEPT_NAME = '��ǻ�Ͱ��а�'

SELECT * FROM V_TAKES vt WHERE STU_ID = '1292001'

--�信 ����
INSERT INTO V_TAKES values('1292502', 'C101-01')

SELECT * FROM V_TAKES vt 

SELECT * FROM TAKES t 

-- �� ����
DROP VIEW V_TAKES 

-- �б� ���� view
CREATE OR REPLACE VIEW V_TAKES AS
SELECT stu_id, class_id
FROM takes
WITH READ ONLY

-- �б� ���� view�� insert �õ��ϱ� (����)
INSERT INTO V_TAKES values('1292052', 'C101-01')