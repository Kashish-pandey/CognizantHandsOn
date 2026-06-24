CREATE TABLE Customers (
 CustomerID NUMBER PRIMARY KEY,
 Name VARCHAR2(100),
 DOB DATE,
 Balance NUMBER,
 LastModified DATE
);

CREATE TABLE Accounts (
 AccountID NUMBER PRIMARY KEY,
 CustomerID NUMBER,
 AccountType VARCHAR2(20),
 Balance NUMBER,
 LastModified DATE,
 FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Transactions (
 TransactionID NUMBER PRIMARY KEY,
 AccountID NUMBER,
 TransactionDate DATE,
 Amount NUMBER,
 TransactionType VARCHAR2(10),
 FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

CREATE TABLE Loans (
 LoanID NUMBER PRIMARY KEY,
 CustomerID NUMBER,
 LoanAmount NUMBER,
 InterestRate NUMBER,
 StartDate DATE,
 EndDate DATE,
 FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Employees (
 EmployeeID NUMBER PRIMARY KEY,
 Name VARCHAR2(100),
 Position VARCHAR2(50),
 Salary NUMBER,
 Department VARCHAR2(50),
 HireDate DATE
);

ALTER TABLE Customers ADD IsVIP VARCHAR2(10);

CREATE TABLE AuditLog (
 LogID NUMBER PRIMARY KEY,
 TransactionID NUMBER,
 LogDate DATE
);



INSERT INTO Customers VALUES (1,'John Doe',TO_DATE('1950-05-15','YYYY-MM-DD'),15000,SYSDATE,NULL);
INSERT INTO Customers VALUES (2,'Jane Smith',TO_DATE('1990-07-20','YYYY-MM-DD'),1500,SYSDATE,NULL);

INSERT INTO Accounts VALUES (1,1,'Savings',1000,SYSDATE);
INSERT INTO Accounts VALUES (2,2,'Checking',1500,SYSDATE);

INSERT INTO Transactions VALUES (1,1,SYSDATE,200,'Deposit');
INSERT INTO Transactions VALUES (2,2,SYSDATE,300,'Withdrawal');

INSERT INTO Loans VALUES (1,1,5000,5,SYSDATE,SYSDATE+20);

INSERT INTO Employees VALUES (1,'Alice Johnson','Manager',70000,'HR',TO_DATE('2015-06-15','YYYY-MM-DD'));
INSERT INTO Employees VALUES (2,'Bob Brown','Developer',60000,'IT',TO_DATE('2017-03-20','YYYY-MM-DD'));