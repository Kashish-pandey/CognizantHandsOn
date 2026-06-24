```sql
CREATE OR REPLACE PACKAGE CustomerManagement AS

 PROCEDURE AddCustomer(
  cid NUMBER,
  cname VARCHAR2,
  dob DATE,
  bal NUMBER
 );

 PROCEDURE UpdateCustomer(
  cid NUMBER,
  newBal NUMBER
 );

 FUNCTION GetCustomerBalance(
  cid NUMBER
 ) RETURN NUMBER;

END CustomerManagement;
/

CREATE OR REPLACE PACKAGE BODY CustomerManagement AS

 PROCEDURE AddCustomer(
  cid NUMBER,
  cname VARCHAR2,
  dob DATE,
  bal NUMBER
 )
 IS
 BEGIN
  INSERT INTO Customers
  VALUES(cid,cname,dob,bal,SYSDATE,NULL);
 END;

 PROCEDURE UpdateCustomer(
  cid NUMBER,
  newBal NUMBER
 )
 IS
 BEGIN
  UPDATE Customers
  SET Balance = newBal
  WHERE CustomerID = cid;
 END;

 FUNCTION GetCustomerBalance(
  cid NUMBER
 )
 RETURN NUMBER
 IS
  bal NUMBER;
 BEGIN
  SELECT Balance INTO bal
  FROM Customers
  WHERE CustomerID = cid;
  RETURN bal;
 END;

END CustomerManagement;
/


CREATE OR REPLACE PACKAGE EmployeeManagement AS

 PROCEDURE HireEmployee(
  eid NUMBER,
  ename VARCHAR2,
  pos VARCHAR2,
  sal NUMBER,
  dept VARCHAR2
 );

 PROCEDURE UpdateEmployee(
  eid NUMBER,
  newSal NUMBER
 );

 FUNCTION AnnualSalary(
  eid NUMBER
 ) RETURN NUMBER;

END EmployeeManagement;
/

CREATE OR REPLACE PACKAGE BODY EmployeeManagement AS

 PROCEDURE HireEmployee(
  eid NUMBER,
  ename VARCHAR2,
  pos VARCHAR2,
  sal NUMBER,
  dept VARCHAR2
 )
 IS
 BEGIN
  INSERT INTO Employees
  VALUES(eid,ename,pos,sal,dept,SYSDATE);
 END;

 PROCEDURE UpdateEmployee(
  eid NUMBER,
  newSal NUMBER
 )
 IS
 BEGIN
  UPDATE Employees
  SET Salary = newSal
  WHERE EmployeeID = eid;
 END;

 FUNCTION AnnualSalary(
  eid NUMBER
 )
 RETURN NUMBER
 IS
  sal NUMBER;
 BEGIN
  SELECT Salary INTO sal
  FROM Employees
  WHERE EmployeeID = eid;
  RETURN sal * 12;
 END;

END EmployeeManagement;
/


CREATE OR REPLACE PACKAGE AccountOperations AS

 PROCEDURE OpenAccount(
  aid NUMBER,
  cid NUMBER,
  accType VARCHAR2,
  bal NUMBER
 );

 PROCEDURE CloseAccount(
  aid NUMBER
 );

 FUNCTION TotalBalance(
  cid NUMBER
 ) RETURN NUMBER;

END AccountOperations;
/

CREATE OR REPLACE PACKAGE BODY AccountOperations AS

 PROCEDURE OpenAccount(
  aid NUMBER,
  cid NUMBER,
  accType VARCHAR2,
  bal NUMBER
 )
 IS
 BEGIN
  INSERT INTO Accounts
  VALUES(aid,cid,accType,bal,SYSDATE);
 END;

 PROCEDURE CloseAccount(
  aid NUMBER
 )
 IS
 BEGIN
  DELETE FROM Accounts
  WHERE AccountID = aid;
 END;

 FUNCTION TotalBalance(
  cid NUMBER
 )
 RETURN NUMBER
 IS
  bal NUMBER;
 BEGIN
  SELECT SUM(Balance) INTO bal
  FROM Accounts
  WHERE CustomerID = cid;
  RETURN bal;
 END;

END AccountOperations;
/
```
