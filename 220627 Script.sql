--220627 ~
SELECT ename, round(sal/12, 1), trunc(sal/12,1)
FROM emp;

SELECT sysdate, extract(MONTH FROM sysdate), extract(DAY FROM sysdate) FROM dual;

SELECT ename, hiredate, to_char(hiredate, 'YYYY') 입사년도, to_char(hiredate, 'MM') 월, TO_CHAR(hiredate, 'DD') 일 FROM emp; 

SELECT sysdate FROM dual;

--case 표현
SELECT ename, sal FROM emp;

SELECT ename, CASE WHEN sal>2000 THEN sal ELSE 2000 END revised_salary FROM emp;


--case 표현 / 부서 정보(dept)에서 부서 위치를 미국의 동부, 중부, 서부로 구분하라
SELECT * FROM dept;

SELECT loc,
CASE loc
WHEN 'NEW YORK' THEN 'EAST'
WHEN 'BOSTON' THEN 'EAST'
WHEN 'CHICAGO' THEN 'CENTER'
WHEN 'DALLAS' THEN 'CENTER'
ELSE 'ETC'END AS AREA
FROM dept;

--case 표현 / 부서 정보(DEPT)에서 부서 위치를 미국의 동부, 중부, 서부로 구분하라
SELECT loc, 
decode( loc, 
'NEW YORK', 'EAST', 
'BOSTON', 'EAST', 
'DALLAS', 'CENTER', 
'CHICAGO', 'CENTER') area
FROM dept;

--case 표현 / 사원 정보에서 급여가 3000 이상이면 상등급으로, 1000이상이면 중등급으로, 1000미만이면 하등급으로 분류하라
SELECT ename, 
CASE WHEN sal >=3000 THEN 'high'
WHEN sal >= 1000 THEN 'mid'
ELSE 'low'
END AS salary_grade
FROM emp;

--NULL 관련 함수
--NVL(표현식1, 표현식2) 표현식1의 결과값이 NULL이면 표현식2의 값을 출력한다. 단 표현식1과 표현식2의 결과 데이터 타입이 같아야 한다
SELECT empno, ename, sal, nvl(comm, 0) FROM emp;

SELECT empno, ename, sal, 
CASE WHEN comm IS NULL
THEN 0
ELSE comm
END AS commission
FROM emp;

SELECT * FROM emp WHERE comm IS NULL;

SELECT * FROM emp WHERE comm IS NOT NULL;

--NULLIF(표현식1, 표현식2) 표현식1이 표현식2와 같으면 NULL을, 같지 않으면 표현식1을 리턴한다

--ROWNUM 
SELECT * FROM emp WHERE rownum <= 5;

SELECT ename, sal, comm, sal+nvl(comm, 0) salsum FROM EMP e ORDER BY 4 DESC;

SELECT * FROM (SELECT ename, sal, comm, sal+nvl(comm, 0) salsum FROM emp ORDER BY 4 DESC) WHERE rownum<=5;

--between / emp 테이블의 직원 중, 급여가 1500 이상이면서 2500이하인 직원을 구하시오
SELECT * FROM EMP e WHERE sal BETWEEN 1500 AND 2500;

--group function / 일반적인 group by절 사용
SELECT dname, job, count(*) "Total Empl", sum(sal) "Total Sal" FROM emp, dept WHERE dept.DEPTNO = emp.DEPTNO GROUP BY dname, job;

--group by절 + order by 절
SELECT dname, job,
count(*) "Total Empl", SUM(sal) "Total Sal" 
FROM emp, dept 
WHERE dept.DEPTNO = emp.DEPTNO 
GROUP BY dname, job 
ORDER BY dname, job;

--rollup 함수 사용
SELECT dname, job, count(*) "Total Empl", Sum(sal) "Total Sal" FROM emp, dept WHERE dept.DEPTNO = emp.DEPTNO GROUP BY ROLLUP (dname, job) ORDER BY dname, job;

SELECT MAX(DEPTNO) FROM dept;


--아이디 & 비밀번호를 저장할 테이블 생성
CREATE TABLE LOGIN (
	ID VARCHAR2(30),
	PASSWORD VARCHAR2(30) NOT NULL,
	CONSTRAINT PK_ID PRIMARY KEY(ID)
);

SELECT * FROM LOGIN WHERE id='green' AND password='green1234';

INSERT INTO LOGIN VALUES('green', 'green1234');