--Scenario 1
BEGIN
 FOR c IN (SELECT CustomerID,DOB FROM Customers)
 LOOP
   IF TRUNC(MONTHS_BETWEEN(SYSDATE,c.DOB)/12) > 60
   THEN
      UPDATE Loans
      SET InterestRate = InterestRate - 1
      WHERE CustomerID = c.CustomerID;
   END IF;
 END LOOP;
END;
/

--Scenario 2
BEGIN
 FOR c IN (SELECT CustomerID,Balance FROM Customers)
 LOOP
   IF c.Balance > 10000
   THEN
      UPDATE Customers
      SET IsVIP='TRUE'
      WHERE CustomerID = c.CustomerID;
   END IF;
 END LOOP;
END;
/

--Scenario 3
BEGIN
 FOR l IN (
   SELECT CustomerID
   FROM Loans
   WHERE EndDate <= SYSDATE+30
 )
 LOOP
   DBMS_OUTPUT.PUT_LINE('Reminder for Customer ' || l.CustomerID);
 END LOOP;
END;
/