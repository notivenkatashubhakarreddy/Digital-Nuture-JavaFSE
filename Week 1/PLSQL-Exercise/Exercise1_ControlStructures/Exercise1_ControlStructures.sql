-- ============================================
-- Exercise 1 : Control Structures
-- Name : Noti Venkata Shubhakar Reddy
-- ============================================

SET SERVEROUTPUT ON;

-- ============================================
-- Drop existing tables (Optional)
-- ============================================

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Loans';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Customers';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- ============================================
-- Create Customers Table
-- ============================================

CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Age NUMBER,
    Balance NUMBER(10,2),
    IsVIP VARCHAR2(5) DEFAULT 'FALSE'
);

-- ============================================
-- Create Loans Table
-- ============================================

CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    InterestRate NUMBER(5,2),
    DueDate DATE,
    CONSTRAINT fk_customer
        FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);

-- ============================================
-- Insert Sample Data into Customers
-- ============================================

INSERT INTO Customers VALUES (1,'Ravi',65,15000,'FALSE');
INSERT INTO Customers VALUES (2,'Priya',45,9000,'FALSE');
INSERT INTO Customers VALUES (3,'Arjun',70,25000,'FALSE');
INSERT INTO Customers VALUES (4,'Neha',32,8000,'FALSE');

COMMIT;

-- ============================================
-- Insert Sample Data into Loans
-- ============================================

INSERT INTO Loans VALUES (101,1,8.5,SYSDATE+15);
INSERT INTO Loans VALUES (102,2,9.0,SYSDATE+45);
INSERT INTO Loans VALUES (103,3,7.5,SYSDATE+20);
INSERT INTO Loans VALUES (104,4,8.0,SYSDATE+10);

COMMIT;

-- ============================================
-- Scenario 1
-- Apply 1% discount for customers above 60
-- ============================================

DECLARE
BEGIN
    FOR c IN (
        SELECT CustomerID, Name, Age
        FROM Customers
    )
    LOOP
        IF c.Age > 60 THEN
            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = c.CustomerID;

            DBMS_OUTPUT.PUT_LINE(
                '1% discount applied to ' || c.Name
            );
        END IF;
    END LOOP;

    COMMIT;
END;
/

-- Display Loans

SELECT * FROM Loans;

-- ============================================
-- Scenario 2
-- Promote customers with balance >10000 to VIP
-- ============================================

DECLARE
BEGIN
    FOR c IN (
        SELECT CustomerID, Name, Balance
        FROM Customers
    )
    LOOP
        IF c.Balance > 10000 THEN
            UPDATE Customers
            SET IsVIP = 'TRUE'
            WHERE CustomerID = c.CustomerID;

            DBMS_OUTPUT.PUT_LINE(
                c.Name || ' promoted to VIP.'
            );
        END IF;
    END LOOP;

    COMMIT;
END;
/

-- Display Customers

SELECT * FROM Customers;

-- ============================================
-- Scenario 3
-- Loan reminders due within next 30 days
-- ============================================

DECLARE
BEGIN
    FOR l IN (
        SELECT c.Name,
               lo.LoanID,
               lo.DueDate
        FROM Customers c
        JOIN Loans lo
            ON c.CustomerID = lo.CustomerID
        WHERE lo.DueDate BETWEEN SYSDATE AND SYSDATE + 30
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Loan ID ' || l.LoanID ||
            ' for ' || l.Name ||
            ' is due on ' ||
            TO_CHAR(l.DueDate,'DD-MON-YYYY')
        );
    END LOOP;
END;
/