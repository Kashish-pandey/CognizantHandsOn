--CalculateAge
CREATE OR REPLACE FUNCTION CalculateAge(
 dob DATE
)
RETURN NUMBER
IS
 age NUMBER;
BEGIN
 age := TRUNC(MONTHS_BETWEEN(SYSDATE,dob)/12);
 RETURN age;
END;
/


--CalculateMonthlyInstallment
CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment(
 amount NUMBER,
 rate NUMBER,
 years NUMBER
)
RETURN NUMBER
IS
 emi NUMBER;
BEGIN
 emi := (amount + (amount*rate/100)) / (years*12);
 RETURN emi;
END;
/


--HasSufficientBalance
CREATE OR REPLACE FUNCTION HasSufficientBalance(
 accId NUMBER,
 amt NUMBER
)
RETURN VARCHAR2
IS
 bal NUMBER;
BEGIN
 SELECT Balance INTO bal
 FROM Accounts
 WHERE AccountID=accId;

 IF bal >= amt THEN
   RETURN 'TRUE';
 ELSE
   RETURN 'FALSE';
 END IF;
END;
/