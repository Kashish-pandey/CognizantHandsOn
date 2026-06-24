--GenerateMonthlyStatements
DECLARE
 CURSOR GenerateMonthlyStatements IS
 SELECT *
 FROM Transactions
 WHERE EXTRACT(MONTH FROM TransactionDate)=EXTRACT(MONTH FROM SYSDATE);

 t Transactions%ROWTYPE;

BEGIN
 OPEN GenerateMonthlyStatements;

 LOOP
  FETCH GenerateMonthlyStatements INTO t;
  EXIT WHEN GenerateMonthlyStatements%NOTFOUND;

  DBMS_OUTPUT.PUT_LINE(
  'Transaction ID: ' || t.TransactionID ||
  ' Amount: ' || t.Amount
  );

 END LOOP;

 CLOSE GenerateMonthlyStatements;
END;
/


--ApplyAnnualFee
DECLARE
 CURSOR ApplyAnnualFee IS
 SELECT AccountID
 FROM Accounts;

 a ApplyAnnualFee%ROWTYPE;

BEGIN
 OPEN ApplyAnnualFee;

 LOOP
  FETCH ApplyAnnualFee INTO a;
  EXIT WHEN ApplyAnnualFee%NOTFOUND;

  UPDATE Accounts
  SET Balance = Balance - 100
  WHERE AccountID = a.AccountID;

 END LOOP;

 CLOSE ApplyAnnualFee;

 COMMIT;
END;
/


--UpdateLoanInterestRates
DECLARE
 CURSOR UpdateLoanInterestRates IS
 SELECT LoanID
 FROM Loans;

 l UpdateLoanInterestRates%ROWTYPE;

BEGIN
 OPEN UpdateLoanInterestRates;

 LOOP
  FETCH UpdateLoanInterestRates INTO l;
  EXIT WHEN UpdateLoanInterestRates%NOTFOUND;

  UPDATE Loans
  SET InterestRate = InterestRate + 0.5
  WHERE LoanID = l.LoanID;

 END LOOP;

 CLOSE UpdateLoanInterestRates;

 COMMIT;
END;
/