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

//�ǽ� 1) emp���̺��� ���, �̸�, ����, �޿� �÷��� ��ȸ�ϰ� �޿��� ���� ������� ����(���ļ����� ���� ���������� �����Ƿ� �⺻������ �ϰ���)
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

//�ǽ�2) emp ���̺��� ���, �̸�, �Ի��� �÷��� ��ȸ�ϰ� �Ի����� ���� ������� ����
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
 
//�ǽ�3) emp ���̺��� ������ ���� ������� ���,�̸�,���� Į���� ��ȸ
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

//�ǽ� 4) emp ���̺��� ������ ū ������� ���, �̸�, ���� Į���� ��ȸ
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
 
 //�ǽ� 5) emp ���̺��� ��� ���� ��ȸ
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
 
 //�ǽ� 7) emp���̺��� ���� �̸��� ALLEN�� ����� ��� ���� ��ȸ
SELECT e.ENAME
FROM emp e
WHERE e.ENAME = ALLEN
;
 //12 ���̺� ���̴� ��Ī�� ���� �ʾ�����
SELECT EMPNO
 FROM emp
 ;
 SELECT emp.EMPNO
 FROM emp
 ;
 
 //13) ������Ī ���� Ư����ȣ _ ����ϴ� ���
 SELECT e.EMPNO Employee_No // ������ �ҹ��ڷθ� ���´�
       ,e.ENAME "Employee Name" // ū����ǥ �ȿ� ���� ��ҹ��� ���д�� ���
       FROM emp e
       ;
       
       //14) ��Ī�� ������ ���� : SELECT ���� ��Ī�� �� ��� ORDER BY ������ ��밡��
       // emp ���̺��� ���, �̸�, ����,�Ի��� ,Ŀ�̼��� ��ȸ�Ҷ�
       //�� �÷��� ���ؼ� �ѱ� ��Ī�� �־� ��ȸ
       // ������ Ŀ�̼�, ����, �̸��� �������� ����
       SELECT e.���
             ,e.ENAME �̸�
             ,e.JOB ����
             ,e.HIREDATE �Ի���
             ,e.COMM Ŀ�̼�
             FROM emp e
             ORDER BY Ŀ�̼�,����,�̸�
             ;
             
             //15)DISTINCT ��Ī,������ ����
            //OB�� �ߺ��� �����Ͽ� ������� ��Ī�� ��ȸ�ϰ�
            //������������ ����
            SELECT e.JOB ����
            FROM emp e
            ORDER BY ���� DESC
            ;
            
            //(5) WHERE ������
            //16) emp���̺��� empno �� 7900�� ����� ���,�̸�,����,�Ի���,�׿�,�μ���ȣ������ ��ȸ
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

//17) emp ���̺��� empno�� 7900�̰ų� deptno�� 20�� ������ ������ ��ȸ
// ���,�̸�,����,�Ի���,�޿�,�μ���ȣ ��ȸ
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

//18) 17���� ��ȸ������ AND �������� ����
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

//19)  JOB�� CLERK�̸鼭 DEPTNO �� 10�� ������ ���, �̸�, ����, �μ���ȣ�� ��ȸ
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

//20)19������ ���� �� ���� �ҹ��� CLERK �� ���Ͽ� ����� Ȯ��
SELECT e.EMPNO
      ,e.ENAME
      ,e.JOB
      ,e.DEPTNO
FROM emp e
WHERE e.JOB = 'clerk'
AND e.DEPTNO = 10
;
/*���õ� �� ����*/
///////////////////////////////////////////////////////////////////////////////////////

SELECT e.EMPNO as ���
      ,e.ENAME as �̸�
      ,e.SAL as �޿�
      ,e.SAL * 0.033 as ��õ¡������
FROM emp e
;

