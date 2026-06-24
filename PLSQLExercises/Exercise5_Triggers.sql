--UpdateCustomerLastModified
CREATE OR REPLACE TRIGGER UpdateCustomerLastModified
BEFORE UPDATE ON Customers
FOR EACH ROW
BEGIN
 :NEW.LastModified := SYSDATE;
END;
/


--LogTransaction
CREATE OR REPLACE TRIGGER LogTransaction
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
 INSERT INTO AuditLog
 VALUES(:NEW.TransactionID,:NEW.TransactionID,SYSDATE);
END;
/


--CheckTransactionRules
CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW
DECLARE
 bal NUMBER;
BEGIN

 IF :NEW.TransactionType='Withdrawal' THEN

   SELECT Balance INTO bal
   FROM Accounts
   WHERE AccountID=:NEW.AccountID;

   IF :NEW.Amount > bal THEN
      RAISE_APPLICATION_ERROR(-20010,'Insufficient Balance');
   END IF;

 ELSIF :NEW.TransactionType='Deposit' THEN

   IF :NEW.Amount <= 0 THEN
      RAISE_APPLICATION_ERROR(-20011,'Invalid Deposit Amount');
   END IF;

 END IF;

END;
/