SELECT student.STU_ID 
FROM STUDENT, DEPARTMENT
WHERE student.DEPT_ID = department.DEPT_ID AND 
	  student.YEAR = 3 AND 
	  department.DEPT_NAME =  '컴퓨터공학과';
	  	 
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
WHERE s1.ADDRESS = s2.ADDRESS AND s1.NAME = '김광식'

SELECT name, POSITION, 2022-YEAR_emp
FROM PROFESSOR

SELECT name 이름, POSITION 직위, 2012-YEAR_emp 재직연수
FROM PROFESSOR

SELECT *
FROM STUDENT
WHERE name LIKE '김%'	--김씨성을 가진 학생을 보여줌

SELECT * 
FROM STUDENT 
WHERE RESIDENT_ID LIKE '%*2%'	--여학생만 찾기

SELECT * FROM STUDENT WHERE RESIDENT_ID LIKE '8%'

SELECT name FROM STUDENT
UNION ALL	--all을 붙이면 중복을 제거하지 않고 출력함
SELECT name FROM PROFESSOR

SELECT s.stu_id
FROM STUDENT s, DEPARTMENT d, takes t
WHERE s.DEPT_ID = d.DEPT_ID AND 
	  t.STU_ID = s.STU_ID AND 
	  dept_name='컴퓨터공학과' AND 
	  grade = 'A+'	--컴퓨터공학과 학생들 중에서 교과목에 상관없이 학점을 'A+'받은 학생들의 학번
	  
SELECT stu_id
FROM STUDENT s, DEPARTMENT d 
WHERE s.DEPT_ID = d.DEPT_ID AND dept_name = '컴퓨터공학과'
INTERSECT 
SELECT STU_ID 
FROM TAKES t 
WHERE grade = 'A+';	--위와 같은 것을 구하는데 다른 방법


SELECT stu_id FROM STUDENT s , DEPARTMENT d 
WHERE s.DEPT_ID = d.DEPT_ID AND dept_name='산업공학과'
MINUS 
SELECT STU_ID FROM TAKES t
WHERE grade = 'A+';	--산업공학과 학생들 중에서 한번이라도 A+을 받지 못한 학생들의 학번을 검색

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

--완전 외부조인
SELECT title, credit, YEAR, semester
FROM course FULL OUTER JOIN CLASS c
USING (course_id)

--집계함수 - count
SELECT count(*)
FROM STUDENT s 
WHERE YEAR = 3

--null 값을 제외한 존재하는 값들을 count
SELECT count(COMM)
FROM EMP

SELECT * FROM EMP e

SELECT count(DISTINCT dept_id)
FROM STUDENT s 

SELECT * FROM STUDENT s 

SELECT count(*)
FROM STUDENT s, DEPARTMENT d 
WHERE s.DEPT_ID = d.DEPT_ID
	  AND d.DEPT_NAME = '컴퓨터공학과'

--sum 전체 교수들의 재직연수 합
SELECT sum(2022-year_emp)
FROM PROFESSOR p 

--sum emp테이블에 저장된 모든 직원들의 급여 합을 출력
SELECT sum(sal)
FROM EMP e 

--sum 업무(job필드)가 'ANALYST'인 직원들의 급여 합을 출력
SELECT sum(sal)
FROM EMP e 
WHERE job = 'ANALYST'

--sum 부서 이름이 'RESEARCH'인 직원들의 급여 합을 출력
SELECT sum(sal)
FROM EMP e, DEPT d
WHERE e.DEPTNO = d.DEPTNO AND dname = 'RESEARCH'

--각 직군들을 중복 없이 출력
SELECT DISTINCT job FROM EMP e 

--sum 각 직군별 급여 합계
SELECT sum(sal) FROM EMP e WHERE e.JOB = 'SALESMAN'

SELECT sum(sal) FROM EMP e WHERE e.JOB = 'CLERK'

SELECT sum(sal) FROM EMP e WHERE e.JOB = 'MANAGER'

SELECT sum(sal) FROM EMP e WHERE e.JOB = 'ANALYST'

SELECT sum(sal) FROM EMP e WHERE e.JOB = 'PRESIDENT'

--avg 전체 교수의 평균 재직연수를 출력
SELECT avg(2022-YEAR_emp) 평균재직연수 FROM PROFESSOR p 

--max, min 부서 이름이 'ACCOUNTING'인 직원들 중에서 최대, 최소 급여가 얼마인지 출력
SELECT max(sal) FROM EMP e, DEPT d WHERE e.DEPTNO = d.DEPTNO AND dname = 'ACCOUNTING'

SELECT min(sal) FROM EMP e, DEPT d WHERE e.DEPTNO = d.DEPTNO AND dname = 'ACCOUNTING'

SELECT max(sal) 최대급여, min(sal) 최소급여, avg(sal) 급여평균 FROM EMP e, DEPT d WHERE e.DEPTNO = d.DEPTNO AND dname = 'ACCOUNTING';

--group by : student테이블에서 학과번호(dept_id필드) 별로 레코드 개수를 출력
SELECT dept_id, count(*) FROM STUDENT s GROUP BY DEPT_ID 

--group by : 학과번호 대신 department 테이블과 조인하여 학과 이름이 출력
SELECT dept_name, COUNT(*) FROM STUDENT s, DEPARTMENT d WHERE s.DEPT_ID = d.DEPT_ID GROUP BY DEPT_name

--group by : emp, dept 테이블에서 부서별 직원수, 평균급여, 최대급여, 최소급여를 출력
SELECT dname, count(*) 직원수, avg(sal) 평균급여, max(sal) 최대급여, min(sal) 최소급여 FROM EMP e, DEPT d WHERE e.DEPTNO = d.DEPTNO GROUP BY dname

--group by : 학사 데이터베이스에서 학과별 교수 숫자와 평균 재직연수, 최대 재직연수를 출력
SELECT dept_name, count(*) 학과별교수숫자, avg(2022-YEAR_emp) 평균재직연수, max(2022-year_emp) 최대재직연수 FROM PROFESSOR p , DEPARTMENT d  WHERE p.DEPT_id = d.DEPT_id GROUP BY dept_name ORDER BY dept_name

--HAVING having 절을 이용하여 다시 작성
SELECT dept_name, count(*), avg(2012-year_emp), max(2012-year_emp) 
FROM PROFESSOR p, DEPARTMENT d 
WHERE p.DEPT_ID = d.DEPT_ID 
GROUP BY dept_name 
having avg(2012-year_emp) >= 10

--HAVING 직원 숫자가 5명 이상인 부서에 대해서 부서별 직원수, 평균급여, 최대급여, 최소급여를 출력
SELECT dname, count(*) 직원수, avg(sal) 평균급여, max(sal) 최대급여, min(sal) 최소급여
FROM EMP e, DEPT d 
WHERE e.DEPTNO = d.DEPTNO 
GROUP BY dname
HAVING COUNT(*) >= 5 --그룹에 대한 조건

--NULL 검색
SELECT * FROM emp WHERE COMM IS NULL 

SELECT * FROM emp WHERE COMM IS NOT NULL 

--null의 처리 : takes 테이블에서 학점이 A+가 아닌 학생들의 학번을 검색
SELECT stu_id FROM TAKES t WHERE grade<> 'A+'

SELECT stu_id FROM TAKES t WHERE NOT grade = 'A+'

SELECT stu_id FROM TAKES t WHERE grade != 'A+'

--in : 301호 강의실에서 개설된 강좌의 과목명을 출력
SELECT title FROM course WHERE course_id IN (
											SELECT DISTINCT COURSE_ID
											FROM CLASS 
											WHERE classroom='301호')
											 
--위와 동일한 표현
SELECT DISTINCT TITLE
FROM COURSE C1, CLASS C2
WHERE C1.COURSE_ID = C2.COURSE_ID AND CLASSROOM = '301호'

--2012년 2학기에 개설되지 않은 과목명을 검색
SELECT title
FROM COURSE c 
WHERE COURSE_ID NOT IN (
					SELECT DISTINCT COURSE_ID
					FROM CLASS
					WHERE YEAR = 2012 AND semester=2)
							
--뷰 생성
CREATE OR REPLACE VIEW V_TAKES AS
SELECT stu_id, class_id FROM takes

--뷰 보기
SELECT * FROM V_TAKES

--뷰 생성
CREATE OR REPLACE VIEW cs_student AS
SELECT s.stu_id, s.resident_id, s.name, s.YEAR, s.address, s.dept_id
FROM student s, department d
WHERE s.DEPT_ID = d.DEPT_ID AND d.DEPT_NAME = '컴퓨터공학과'

SELECT * FROM V_TAKES vt WHERE STU_ID = '1292001'

--뷰에 삽입
INSERT INTO V_TAKES values('1292502', 'C101-01')

SELECT * FROM V_TAKES vt 

SELECT * FROM TAKES t 

-- 뷰 삭제
DROP VIEW V_TAKES 

-- 읽기 전용 view
CREATE OR REPLACE VIEW V_TAKES AS
SELECT stu_id, class_id
FROM takes
WITH READ ONLY

-- 읽기 전용 view에 insert 시도하기 (에러)
INSERT INTO V_TAKES values('1292052', 'C101-01')