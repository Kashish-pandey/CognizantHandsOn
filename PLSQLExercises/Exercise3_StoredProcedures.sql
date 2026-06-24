--ProcessMonthlyInterest
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
AS
BEGIN
 UPDATE Accounts
 SET Balance = Balance + (Balance*0.01)
 WHERE AccountType='Savings';

 COMMIT;
END;
/


--UpdateEmployeeBonus
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
 dept VARCHAR2,
 bonus NUMBER
)
AS
BEGIN
 UPDATE Employees
 SET Salary = Salary + (Salary*bonus/100)
 WHERE Department=dept;

 COMMIT;
END;
/

--TransferFunds
CREATE OR REPLACE PROCEDURE TransferFunds(
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

 IF bal >= amt THEN
   UPDATE Accounts
   SET Balance=Balance-amt
   WHERE AccountID=fromAcc;
   UPDATE Accounts
   SET Balance=Balance+amt
   WHERE AccountID=toAcc;

   COMMIT;

 ELSE

   DBMS_OUTPUT.PUT_LINE('Insufficient Balance');

 END IF;
END;
/