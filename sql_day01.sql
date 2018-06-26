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

//실습 1) emp테이블에서 사번, 이름, 업무, 급여 컬럼을 조회하고 급여가 많은 순서대로 정렬(정렬순서는 따로 정해져있지 않으므로 기본값으로 하겠음)
SELECT e.EMPNO
      ,e.ENAME
      ,e.JOB
      ,e.COMM
 FROM emp e
ORDER BY e.COMM
;
 /*    EMPNO ENAME      JOB             COMM
---------- ---------- --------- ----------
      7844 TURNER     SALESMAN           0
      7499 ALLEN      SALESMAN         300
      7521 WARD       SALESMAN         500
      7654 MARTIN     SALESMAN        1400
      7839 KING       PRESIDENT           
      7900 JAMES      CLERK               
      7902 FORD       ANALYST             
      7782 CLARK      MANAGER             
      7934 MILLER     CLERK               
      7566 JONES      MANAGER             
      7369 SMITH      CLERK               

     EMPNO ENAME      JOB             COMM
---------- ---------- --------- ----------
      7698 BLAKE      MANAGER             
*/

//실습2) emp 테이블에서 사번, 이름, 입사일 컬럼을 조회하고 입사일이 빠른 순서대로 정렬
SELECT e.EMPNO
      ,e.ENAME
      ,e.HIREDATE
 FROM emp e
 ORDER BY e.HIREDATE
 ;
/*     EMPNO ENAME      HIREDATE
---------- ---------- --------
      7369 SMITH      80/12/17
      7499 ALLEN      81/02/20
      7521 WARD       81/02/22
      7566 JONES      81/04/02
      7698 BLAKE      81/05/01
      7782 CLARK      81/06/09
      7844 TURNER     81/09/08
      7654 MARTIN     81/09/28
      7839 KING       81/11/17
      7900 JAMES      81/12/03
      7902 FORD       81/12/03

     EMPNO ENAME      HIREDATE
---------- ---------- --------
      7934 MILLER     82/01/23
 */
 
//실습3) emp 테이블에서 수당이 적은 순서대로 사번,이름,수당 칼럼을 조회
 SELECT e.EMPNO
      ,e.ENAME
      ,e.COMM
  FROM emp e
ORDER BY e.COMM 
;
 /*
EMPNO ENAME            COMM
---------- ---------- ----------
      7844 TURNER              0
      7499 ALLEN             300
      7521 WARD              500
      7654 MARTIN           1400
      7839 KING                 
      7900 JAMES                
      7902 FORD                 
      7782 CLARK                
      7934 MILLER               
      7566 JONES                
      7369 SMITH                

     EMPNO ENAME            COMM
---------- ---------- ----------
      7698 BLAKE                
*/

//실습 4) emp 테이블에서 수당이 큰 순서대로 사번, 이름, 수당 칼럼을 조회
SELECT e.EMPNO
      ,e.ENAME
      ,e.COMM
  FROM emp e
ORDER BY e.COMM DESC
;
/*
     EMPNO ENAME            COMM
---------- ---------- ----------
      7369 SMITH                
      7698 BLAKE                
      7902 FORD                 
      7900 JAMES                
      7839 KING                 
      7566 JONES                
      7934 MILLER               
      7782 CLARK                
      7654 MARTIN           1400
      7521 WARD              500
      7499 ALLEN             300

     EMPNO ENAME            COMM
---------- ---------- ----------
      7844 TURNER              0
 */
 
 //실습 5) emp 테이블의 모든 정보 조회
 SELECT *
  FROM emp
;
/*
      EMPNO ENAME      JOB              MGR HIREDATE        SAL       COMM     DEPTNO
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
      7934 MILLER     CLERK           7782 82/01/23       1300                    10
 */
 
 //실습 7) emp테이블에서 직원 이름이 ALLEN인 사람의 모든 정보 조회
SELECT e.ENAME
FROM emp e
WHERE e.ENAME = ALLEN
;
 //12 테이블에 붙이는 별칭을 주지 않았을때
SELECT EMPNO
 FROM emp
 ;
 SELECT emp.EMPNO
 FROM emp
 ;
 
 //13) 영문별칭 사용시 특수기호 _ 사용하는 경우
 SELECT e.EMPNO Employee_No // 무조건 소문자로만 나온다
       ,e.ENAME "Employee Name" // 큰따옴표 안에 적은 대소문자 구분대로 출력
       FROM emp e
       ;
       
       //14) 별칭과 정렬의 조합 : SELECT 절에 별칭을 준 경우 ORDER BY 절에서 사용가능
       // emp 테이블에서 사번, 이름, 직무,입사일 ,커미션을 조회할때
       //각 컬럼에 대해서 한글 별칭을 주어 조회
       // 정렬은 커미션, 직무, 이름을 오름차순 정렬
       SELECT e.사번
             ,e.ENAME 이름
             ,e.JOB 직무
             ,e.HIREDATE 입사일
             ,e.COMM 커미션
             FROM emp e
             ORDER BY 커미션,직무,이름
             ;
             
             //15)DISTINCT 별칭,정렬의 조합
            //OB을 중복을 제거하여 직무라는 별칭을 조회하고
            //내림차순으로 정렬
            SELECT e.JOB 직무
            FROM emp e
            ORDER BY 직무 DESC
            ;
            
            //(5) WHERE 조건절
            //16) emp테이블에서 empno 가 7900인 사원의 사번,이름,직무,입사일,그여,부서번호까지만 조회
            SELECT e.EMPNO
                ,e.ENAME
                ,e.JOB
                ,e.HIREDATE
                ,e.SAL
                ,e.DEPTNO
            FROM emp e
             WHERE e.EMPNO = 7900
             ;
/*
  EMPNO ENAME      JOB       HIREDATE        SAL     DEPTNO
---------- ---------- --------- -------- ---------- ----------
      7900 JAMES      CLERK     81/12/03        950         30

*/

//17) emp 테이블에서 empno는 7900이거나 deptno가 20인 직원의 정보를 ㅈ회
// 사번,이름,직무,입사일,급여,부서번호 조회
SELECT e.EMPNO
     ,e.ENAME
     ,e.JOB
     ,e.HIREDATE
     ,e.SAL
     ,e.DEPTNO
 FROM emp e
      WHERE e.EMPNO = 7900
      OR e.COMM = 20
      ;
      
 /*    EMPNO ENAME      JOB       HIREDATE        SAL     DEPTNO
---------- ---------- --------- -------- ---------- ----------
      7900 JAMES      CLERK     81/12/03        950         30


     EMPNO ENAME      JOB       HIREDATE        SAL     DEPTNO
---------- ---------- --------- -------- ---------- ----------
      7900 JAMES      CLERK     81/12/03        950         30

    */  
///////////////////////////////////////////////////////////////////////////////////////  

//18) 17번의 조회조건을 AND 조건으로 조합
SELECT e.EMPNO
      ,e.ENAME
      ,e.JOB
      ,e.HIREDATE
      ,e.SAL
      ,e.DEPTNO
 FROM emp e
 WHERE e.ENPNO = 7900
 AND e.DEPTNO = 20
 ;
 
 //
/* SELECT e.EMPNO
       ,e.ENAME
       ,e.JOB
       ,e.HIREDATE
       ,e.SAL
       ,e.COMM
       ,e.DEPTNO
  FROM emp e
  WHERE e.ENAME = 'ALLEN'
  */
/*SELECT e.EMPNO
      ,e.ENAME
      ,e.DEPTNO
FROM emp e
WHERE e.DEPTNO = 20
*/
SELECT e.EMPNO
      ,e.ENAME
      ,e.COMM
      ,e.DEPTNO
FROM emp e
WHERE e.DEPTNO = '20'
AND e.COMM < '3000'
;

//19)  JOB이 CLERK이면서 DEPTNO 가 10인 직원의 사번, 이름, 직무, 부서번호를 조회
SELECT e.EMPNO
      ,e.ENAME
      ,e.JOB
      ,e.DEPTNO
      FROM emp e
      WHERE e.JOB = 'CLERK'
      AND e.DEPTNO = 10
      ;
      /*
           EMPNO ENAME      JOB           DEPTNO
---------- ---------- --------- ----------
      7934 MILLER     CLERK             10
*/

//20)19번에서 직무 비교 값을 소문자 CLERK 과 비교하여 결과를 확인
SELECT e.EMPNO
      ,e.ENAME
      ,e.JOB
      ,e.DEPTNO
FROM emp e
WHERE e.JOB = 'clerk'
AND e.DEPTNO = 10
;
/*선택된 행 없음*/
///////////////////////////////////////////////////////////////////////////////////////

SELECT e.EMPNO as 사번
      ,e.ENAME as 이름
      ,e.SAL as 급여
      ,e.SAL * 0.033 as 원천징수세금
FROM emp e
;

