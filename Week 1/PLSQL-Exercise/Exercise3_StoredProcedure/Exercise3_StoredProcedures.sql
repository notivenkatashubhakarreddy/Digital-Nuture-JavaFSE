-- Drop tables if they exist
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Accounts';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Employees';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

-- Create Accounts table
CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    AccountType VARCHAR2(20),
    Balance NUMBER(10,2)
);

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(50),
    Department VARCHAR2(30),
    Salary NUMBER(10,2)
);
INSERT INTO Accounts VALUES (1,'Ravi','Savings',10000);
INSERT INTO Accounts VALUES (2,'Priya','Savings',10000);
INSERT INTO Accounts VALUES (3,'Kiran','Current',5000);

INSERT INTO Employees VALUES (101,'Arjun','IT',40000);
INSERT INTO Employees VALUES (102,'Neha','IT',45000);
INSERT INTO Employees VALUES (103,'Rahul','HR',35000);

COMMIT;
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType='Savings';

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Monthly Interest Processed');
END;
/