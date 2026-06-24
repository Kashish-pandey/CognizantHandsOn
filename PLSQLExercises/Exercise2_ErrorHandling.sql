--Scenario 1
CREATE OR REPLACE PROCEDURE SafeTransferFunds(
 fromAcc NUMBER,
 toAcc NUMBER,
 amt NUMBER
)
AS
 bal NUMBER;
BEGIN
 SELECT Balance INTO bal
 FROM Accounts
 WHERE AccountID=fromAcc;

 IF bal < amt THEN
   RAISE_APPLICATION_ERROR(-20001,'Insufficient Funds');
 END IF;

 UPDATE Accounts
 SET Balance=Balance-amt
 WHERE AccountID=fromAcc;

 UPDATE Accounts
 SET Balance=Balance+amt
 WHERE AccountID=toAcc;

 COMMIT;
EXCEPTION
 WHEN OTHERS THEN
   ROLLBACK;
   DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/


--Scenario 2
CREATE OR REPLACE PROCEDURE UpdateSalary(
 empId NUMBER,
 percent NUMBER
)
AS
BEGIN
 UPDATE Employees
 SET Salary=Salary+(Salary*percent/100)
 WHERE EmployeeID=empId;

 IF SQL%ROWCOUNT=0 THEN
   RAISE_APPLICATION_ERROR(-20002,'Employee Not Found');
 END IF;

EXCEPTION
 WHEN OTHERS THEN
   DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/


--Scenario 3
CREATE OR REPLACE PROCEDURE AddNewCustomer(
 cid NUMBER,
 cname VARCHAR2,
 dob DATE,
 bal NUMBER
)
AS
BEGIN
 INSERT INTO Customers
 VALUES(cid,cname,dob,bal,SYSDATE,NULL);

EXCEPTION
 WHEN DUP_VAL_ON_INDEX THEN
   DBMS_OUTPUT.PUT_LINE('Customer Already Exists');
END;
/