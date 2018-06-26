 --SQL_day01 
 //1.SCOTT 계정 활성화 : SYS 계정으로 접속하여 스크립트 실행
 //2. 접속 유저 확인명령
 //3. HR계정 활성화: sys 계정으로 접속하여 다른 사용자 저장후 
 //계정 비밀화
 //네이버에서 D2coding으로 다운가능 폰트와 연관

 // 01. DQL
 //SCOTT 계정의 데이터 구조
 //(1) EMP 테이블 내용 조회 


/////////////////////////////////////////////////////////////////////////////////////
/*EMPNO ENAME      JOB              MGR HIREDATE        SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 80/12/17        800                    20
      7499 ALLEN      SALESMAN        7698 81/02/20       1600        300         30
      7521 WARD       SALESMAN        7698 81/02/22       1250        500         30
      7566 JONES      MANAGER         7839 81/04/02       2975                    20
      7654 MARTIN     SALESMAN        7698 81/09/28       1250       1400         30
      7698 BLAKE      MANAGER         7839 81/05/01       2850                    30
      7782 CLARK      MANAGER         7839 81/06/09       2450                    10
      7839 KING       PRESIDENT            81/11/17       5000                    10
      7844 TURNER     SALESMAN        7698 81/09/08       1500          0         30
      7900 JAMES      CLERK           7698 81/12/03        950                    30
      7902 FORD       ANALYST         7566 81/12/03       3000                    20

     EMPNO ENAME      JOB              MGR HIREDATE        SAL       COMM     DEPTNO
---------- ---------- --------- ---------- -------- ---------- ---------- ----------
      7934 MILLER     CLERK           7782 82/01/23       1300                    10*/
 /////////////////////////////////////////////////////////////////////////////////////     
      //(2) DEPT 테이블 내용 조회
      SELECT *
       FROM dept
       ;
       
 /* DEPTNO DNAME          LOC          
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK     
        20 RESEARCH       DALLAS       
        30 SALES          CHICAGO      
        40 OPERATIONS     BOSTON  */
///////////////////////////////////////////////////////////////////////////////////////        
        //(3) SALGRADE 테이블 내용 조회
        SELECT *
        FROM salgrade
        ;
/*GRADE      LOSAL      HISAL
---------- ---------- ----------
         1        700       1200
         2       1201       1400
         3       1401       2000
         4       2001       3000
         5       3001       9999  */
/////////////////////////////////////////////////////////////////////////////////////// 

 // DQL
 // (1) SELECT 구문
 // emp 테이블에서 사번, 이름 ,직무를 조회
 SELECT  e.EMPNO 
       , e.JOB
       , e.ENAME
  FROM emp e   --소문자 e는 alias(별칭)
  ;
 /*  EMPNO JOB       ENAME     
---------- --------- ----------
      7369 CLERK     SMITH     
      7499 SALESMAN  ALLEN     
      7521 SALESMAN  WARD      
      7566 MANAGER   JONES     
      7654 SALESMAN  MARTIN    
      7698 MANAGER   BLAKE     
      7782 MANAGER   CLARK     
      7839 PRESIDENT KING      
      7844 SALESMAN  TURNER    
      7900 CLERK     JAMES     
      7902 ANALYST   FORD      

     EMPNO JOB       ENAME     
---------- --------- ----------
      7934 CLERK     MILLER */   
/////////////////////////////////////////////////////////////////////////////////////// 

// emp테이블에서 직무만 조회
  SELECT e.JOB
    FROM emp e
    ;

 /*B      
---------
CLERK
SALESMAN
SALESMAN
MANAGER
SALESMAN
MANAGER
MANAGER
PRESIDENT
SALESMAN
CLERK
ANALYST

JOB      
---------
CLERK*/

//(2)DISTINCT문 : SELECT문을 사용시 중복을 배재하고 조회
//emp 테이블에서 job 컬럼의 중복을 배제하여 조회
SELECT DISTINCT e.JOB
 FROM emp e
 ;
/*OB      
---------
CLERK
SALESMAN
PRESIDENT
MANAGER
ANALYST*/
///////////////////////////////////////////////////////////////////////////////////////

// * SQL SELECT 구문의 작동 원리 : 테이블의 한 행을 기본 단위로 실행함.
//                               테이블 행의 개수만큼 반복 실행.

SELECT 'HELLO,SQL~'
  FROM emp e
  ;
/*
'HELLO,SQL
----------
HELLO,SQL~
HELLO,SQL~
HELLO,SQL~
HELLO,SQL~
HELLO,SQL~
HELLO,SQL~
HELLO,SQL~
HELLO,SQL~
HELLO,SQL~
HELLO,SQL~
HELLO,SQL~

'HELLO,SQL
----------
HELLO,SQL~*/

///////////////////////////////////////////////////////////////////////////////////////

// emp 테이블에서 job,deptno에 대해 중복을 제거하여 조회
SELECT DISTINCT e.JOB
            ,e.DEPTNO
            FROM emp e
            ;
/* JOB           DEPTNO
--------- ----------
MANAGER           20
PRESIDENT         10
CLERK             10
SALESMAN          30
ANALYST           20
MANAGER           30
MANAGER           10
CLERK             30
CLERK             20
*/

//ORDER BY 절(ASCENDING,DESCENDING)
//emo테이블에서 job을 중복배제하여 조회하고 오름차순으로 정렬해서 출력

 SELECT DISTINCT e.JOB
  FROM emp e
 ORDER BY e.JOB 
 ;
/* JOB      
---------
ANALYST
CLERK
MANAGER
PRESIDENT
SALESMAN*/

SELECT DISTINCT e.JOB
       FROM emp e
       ORDER BY e.JOB DESC
       ;
      /* JOB      
---------
SALESMAN
PRESIDENT
MANAGER
CLERK
ANALYST*/
///////////////////////////////////////////////////////////////////////////////////////

//emp 테이블에서 comm을 가장 많이 받는 순서대로 출력
// 사번,이름,직무,입사일,커미션 순으로 조회
SELECT e.EMPNO
       ,e.ENAME
       ,e.JOB
       ,e.HIREDATE
       ,e.COMM
 FROM emp e
ORDER BY e.COMM DESC
;
/*   EMPNO ENAME      JOB       HIREDATE       COMM
---------- ---------- --------- -------- ----------
      7369 SMITH      CLERK     80/12/17           
      7698 BLAKE      MANAGER   81/05/01           
      7902 FORD       ANALYST   81/12/03           
      7900 JAMES      CLERK     81/12/03           
      7839 KING       PRESIDENT 81/11/17           
      7566 JONES      MANAGER   81/04/02           
      7934 MILLER     CLERK     82/01/23           
      7782 CLARK      MANAGER   81/06/09           
      7654 MARTIN     SALESMAN  81/09/28       1400
      7521 WARD       SALESMAN  81/02/22        500
      7499 ALLEN      SALESMAN  81/02/20        300

     EMPNO ENAME      JOB       HIREDATE       COMM
---------- ---------- --------- -------- ----------
      7844 TURNER     SALESMAN  81/09/08          0
      */
///////////////////////////////////////////////////////////////////////////////////////

// (8) emp테이블에서comm이 적은순서대로, 직무별 오름차순, 이름별 오름차순으로 조회
// 사번,이름,직무,입사일,커미션을 조회

SELECT e.EMPNO
      ,e.ENAME
      ,e.JOB
      ,e.HIREDATE
      ,e.COMM
 FROM emp e
 ORDER BY e.COMM,e.JOB
 
 ;

//emp테이블에서 comm이 적은 순서대로, 직무별 오름차순, 이름별 내림차순으로 정렬
// 사번,이름 ,직무 입사일 커미션을 조회
SELECT e.EMPNO
       ,e.ENAME
       ,e.JOB
       ,e.HIREDATE
       ,e.COMM
       FROM emp e
       ORDER BY e.comm,e.ENAME,e.JOB DESC
       ;
 /*      EMPNO ENAME      JOB       HIREDATE       COMM
---------- ---------- --------- -------- ----------
      7844 TURNER     SALESMAN  81/09/08          0
      7499 ALLEN      SALESMAN  81/02/20        300
      7521 WARD       SALESMAN  81/02/22        500
      7654 MARTIN     SALESMAN  81/09/28       1400
      7698 BLAKE      MANAGER   81/05/01           
      7782 CLARK      MANAGER   81/06/09           
      7902 FORD       ANALYST   81/12/03           
      7900 JAMES      CLERK     81/12/03           
      7566 JONES      MANAGER   81/04/02           
      7839 KING       PRESIDENT 81/11/17           
      7934 MILLER     CLERK     82/01/23           

     EMPNO ENAME      JOB       HIREDATE       COMM
---------- ---------- --------- -------- ----------
      7369 SMITH      CLERK     80/12/17           
*/
///////////////////////////////////////////////////////////////////////////////////////



      




      
         
      
      
      
      