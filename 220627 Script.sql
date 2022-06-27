--220627 ~
SELECT ename, round(sal/12, 1), trunc(sal/12,1)
FROM emp;

SELECT sysdate, extract(MONTH FROM sysdate), extract(DAY FROM sysdate) FROM dual;

SELECT ename, hiredate, to_char(hiredate, 'YYYY') �Ի�⵵, to_char(hiredate, 'MM') ��, TO_CHAR(hiredate, 'DD') �� FROM emp; 

SELECT sysdate FROM dual;

--case ǥ��
SELECT ename, sal FROM emp;

SELECT ename, CASE WHEN sal>2000 THEN sal ELSE 2000 END revised_salary FROM emp;


--case ǥ�� / �μ� ����(dept)���� �μ� ��ġ�� �̱��� ����, �ߺ�, ���η� �����϶�
SELECT * FROM dept;

SELECT loc,
CASE loc
WHEN 'NEW YORK' THEN 'EAST'
WHEN 'BOSTON' THEN 'EAST'
WHEN 'CHICAGO' THEN 'CENTER'
WHEN 'DALLAS' THEN 'CENTER'
ELSE 'ETC'END AS AREA
FROM dept;

--case ǥ�� / �μ� ����(DEPT)���� �μ� ��ġ�� �̱��� ����, �ߺ�, ���η� �����϶�
SELECT loc, 
decode( loc, 
'NEW YORK', 'EAST', 
'BOSTON', 'EAST', 
'DALLAS', 'CENTER', 
'CHICAGO', 'CENTER') area
FROM dept;

--case ǥ�� / ��� �������� �޿��� 3000 �̻��̸� ��������, 1000�̻��̸� �ߵ������, 1000�̸��̸� �ϵ������ �з��϶�
SELECT ename, 
CASE WHEN sal >=3000 THEN 'high'
WHEN sal >= 1000 THEN 'mid'
ELSE 'low'
END AS salary_grade
FROM emp;

--NULL ���� �Լ�
--NVL(ǥ����1, ǥ����2) ǥ����1�� ������� NULL�̸� ǥ����2�� ���� ����Ѵ�. �� ǥ����1�� ǥ����2�� ��� ������ Ÿ���� ���ƾ� �Ѵ�
SELECT empno, ename, sal, nvl(comm, 0) FROM emp;

SELECT empno, ename, sal, 
CASE WHEN comm IS NULL
THEN 0
ELSE comm
END AS commission
FROM emp;

SELECT * FROM emp WHERE comm IS NULL;

SELECT * FROM emp WHERE comm IS NOT NULL;

--NULLIF(ǥ����1, ǥ����2) ǥ����1�� ǥ����2�� ������ NULL��, ���� ������ ǥ����1�� �����Ѵ�

--ROWNUM 
SELECT * FROM emp WHERE rownum <= 5;

SELECT ename, sal, comm, sal+nvl(comm, 0) salsum FROM EMP e ORDER BY 4 DESC;

SELECT * FROM (SELECT ename, sal, comm, sal+nvl(comm, 0) salsum FROM emp ORDER BY 4 DESC) WHERE rownum<=5;

--between / emp ���̺��� ���� ��, �޿��� 1500 �̻��̸鼭 2500������ ������ ���Ͻÿ�
SELECT * FROM EMP e WHERE sal BETWEEN 1500 AND 2500;

--group function / �Ϲ����� group by�� ���
SELECT dname, job, count(*) "Total Empl", sum(sal) "Total Sal" FROM emp, dept WHERE dept.DEPTNO = emp.DEPTNO GROUP BY dname, job;

--group by�� + order by ��
SELECT dname, job,
count(*) "Total Empl", SUM(sal) "Total Sal" 
FROM emp, dept 
WHERE dept.DEPTNO = emp.DEPTNO 
GROUP BY dname, job 
ORDER BY dname, job;

--rollup �Լ� ���
SELECT dname, job, count(*) "Total Empl", Sum(sal) "Total Sal" FROM emp, dept WHERE dept.DEPTNO = emp.DEPTNO GROUP BY ROLLUP (dname, job) ORDER BY dname, job;

SELECT MAX(DEPTNO) FROM dept;


--���̵� & ��й�ȣ�� ������ ���̺� ����
CREATE TABLE LOGIN (
	ID VARCHAR2(30),
	PASSWORD VARCHAR2(30) NOT NULL,
	CONSTRAINT PK_ID PRIMARY KEY(ID)
);

SELECT * FROM LOGIN WHERE id='green' AND password='green1234';

INSERT INTO LOGIN VALUES('green', 'green1234');