-- ============================================
-- Exercise 2 : Error Handling
-- Name : Noti Venkata Shubhakar Reddy
-- ============================================

SET SERVEROUTPUT ON;

-- ============================================
-- Drop Existing Objects (Ignore errors if not exist)
-- ============================================

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

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE BankCustomers';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP PROCEDURE SafeTransferFunds';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP PROCEDURE UpdateSalary';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP PROCEDURE AddNewCustomer';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

-- ============================================
-- Create Tables
-- ============================================

CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    Balance NUMBER(10,2)
);

CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(50),
    Salary NUMBER(10,2)
);

CREATE TABLE BankCustomers (
    CustomerID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    City VARCHAR2(30)
);

-- ============================================
-- Insert Sample Data
-- ============================================

INSERT INTO Accounts VALUES (1,'Ravi',15000);
INSERT INTO Accounts VALUES (2,'Priya',5000);

INSERT INTO Employees VALUES (101,'Arjun',40000);
INSERT INTO Employees VALUES (102,'Neha',50000);

INSERT INTO BankCustomers VALUES (1,'Rahul','Chennai');
INSERT INTO BankCustomers VALUES (2,'Sneha','Bangalore');

COMMIT;

-- ============================================
-- Scenario 1 : SafeTransferFunds
-- ============================================

CREATE OR REPLACE PROCEDURE SafeTransferFunds(
    p_from NUMBER,
    p_to NUMBER,
    p_amount NUMBER
)
IS
    v_balance NUMBER;
BEGIN

    SELECT Balance
    INTO v_balance
    FROM Accounts
    WHERE AccountID = p_from;

    IF v_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(-20001,'Insufficient Funds');
    END IF;

    UPDATE Accounts
    SET Balance = Balance - p_amount
    WHERE AccountID = p_from;

    UPDATE Accounts
    SET Balance = Balance + p_amount
    WHERE AccountID = p_to;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Fund Transfer Successful');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

BEGIN
    SafeTransferFunds(1,2,3000);
END;
/

SELECT * FROM Accounts;

-- ============================================
-- Scenario 2 : UpdateSalary
-- ============================================

CREATE OR REPLACE PROCEDURE UpdateSalary(
    p_empid NUMBER,
    p_percent NUMBER
)
IS
BEGIN

    UPDATE Employees
    SET Salary = Salary + (Salary*p_percent/100)
    WHERE EmployeeID = p_empid;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20002,'Employee ID Not Found');
    END IF;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Salary Updated');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

BEGIN
    UpdateSalary(101,10);
END;
/

SELECT * FROM Employees;

-- ============================================
-- Scenario 3 : AddNewCustomer
-- ============================================

CREATE OR REPLACE PROCEDURE AddNewCustomer(
    p_id NUMBER,
    p_name VARCHAR2,
    p_city VARCHAR2
)
IS
BEGIN

    INSERT INTO BankCustomers(CustomerID,CustomerName,City)
    VALUES(p_id,p_name,p_city);

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Customer Added Successfully');

EXCEPTION

    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: Customer ID Already Exists');

    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);

END;
/

BEGIN
    AddNewCustomer(3,'Kiran','Hyderabad');
END;
/

SELECT * FROM BankCustomers;