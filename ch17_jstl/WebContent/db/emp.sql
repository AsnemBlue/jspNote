SELECT * FROM EMP;
SELECT COUNT(*) CNT FROM EMP;

SELECT * FROM EMP WHERE ENAME LIKE '%'||'A'||'%' AND JOB LIKE '%'||'E'||'%' ORDER BY EMPNO;

SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM EMP WHERE ENAME LIKE '%'||'A'||'%' AND JOB LIKE '%'||'E'||'%' ORDER BY EMPNO) A) 
WHERE RN BETWEEN 2 AND 3 ;

