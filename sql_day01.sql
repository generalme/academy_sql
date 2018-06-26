 --SQL_day01 
 //1.SCOTT ���� Ȱ��ȭ : SYS �������� �����Ͽ� ��ũ��Ʈ ����
 //2. ���� ���� Ȯ�θ��
 //3. HR���� Ȱ��ȭ: sys �������� �����Ͽ� �ٸ� ����� ������ 
 //���� ���ȭ
 //���̹����� D2coding���� �ٿ�� ��Ʈ�� ����

 // 01. DQL
 //SCOTT ������ ������ ����
 //(1) EMP ���̺� ���� ��ȸ 


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
      //(2) DEPT ���̺� ���� ��ȸ
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
        //(3) SALGRADE ���̺� ���� ��ȸ
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
 // (1) SELECT ����
 // emp ���̺��� ���, �̸� ,������ ��ȸ
 SELECT  e.EMPNO 
       , e.JOB
       , e.ENAME
  FROM emp e   --�ҹ��� e�� alias(��Ī)
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

// emp���̺��� ������ ��ȸ
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

//(2)DISTINCT�� : SELECT���� ���� �ߺ��� �����ϰ� ��ȸ
//emp ���̺��� job �÷��� �ߺ��� �����Ͽ� ��ȸ
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

// * SQL SELECT ������ �۵� ���� : ���̺��� �� ���� �⺻ ������ ������.
//                               ���̺� ���� ������ŭ �ݺ� ����.

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

// emp ���̺��� job,deptno�� ���� �ߺ��� �����Ͽ� ��ȸ
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

//ORDER BY ��(ASCENDING,DESCENDING)
//emo���̺��� job�� �ߺ������Ͽ� ��ȸ�ϰ� ������������ �����ؼ� ���

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

//emp ���̺��� comm�� ���� ���� �޴� ������� ���
// ���,�̸�,����,�Ի���,Ŀ�̼� ������ ��ȸ
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

// (8) emp���̺���comm�� �����������, ������ ��������, �̸��� ������������ ��ȸ
// ���,�̸�,����,�Ի���,Ŀ�̼��� ��ȸ

SELECT e.EMPNO
      ,e.ENAME
      ,e.JOB
      ,e.HIREDATE
      ,e.COMM
 FROM emp e
 ORDER BY e.COMM,e.JOB
 
 ;

//emp���̺��� comm�� ���� �������, ������ ��������, �̸��� ������������ ����
// ���,�̸� ,���� �Ի��� Ŀ�̼��� ��ȸ
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



      




      
         
      
      
      
      