--TASK 2--
CREATE TABLE Credits (
	user_id INT PRIMARY KEY,
	name VARCHAR ( 50 ) NOT NULL,
	credit INT NOT NULL
);

INSERT INTO Credits(user_id, name, credit)
VALUES (1,'John', 1000);

INSERT INTO Credits(user_id, name, credit)
VALUES (2,'Alex', 1000);

INSERT INTO Credits(user_id, name, credit)
VALUES (3,'Cooper', 1000);

ALTER TABLE Credits
ADD BankName VARCHAR (50);

UPDATE Credits
SET BankName='SpearBank'
WHERE user_id = 1;
UPDATE Credits
SET BankName='SpearBank'
WHERE user_id = 3;
UPDATE Credits
SET BankName='Tinkoff'
WHERE user_id = 2;

INSERT INTO Credits(user_id, name, credit)
VALUES (4,'Cashier', 0);

START TRANSACTION;

UPDATE Credits
SET credit=credit - 500
WHERE user_id=1;
UPDATE Credits
SET credit=credit + 500
WHERE user_id=3;

INSERT INTO Ledger(Sender,Receiver,Fee,Amount,Transactiontime)
VALUES (1,3,0,500,CURRENT_TIMESTAMP);

UPDATE Credits
SET credit=credit - 700
WHERE user_id=2;
UPDATE Credits
SET credit=credit + 700
WHERE user_id=1;

INSERT INTO Ledger(Sender,Receiver,Fee,Amount,Transactiontime)
VALUES (2,1,30,700,CURRENT_TIMESTAMP);

UPDATE Credits
SET credit=credit - 30
WHERE user_id=2;
UPDATE Credits
SET credit=credit + 30
WHERE user_id=4;

UPDATE Credits
SET credit=credit - 100
WHERE user_id=2;
UPDATE Credits
SET credit=credit + 100
WHERE user_id=3;

INSERT INTO Ledger(Sender,Receiver,Fee,Amount,Transactiontime)
VALUES (2,3,30,100,CURRENT_TIMESTAMP);

UPDATE Credits
SET credit=credit - 30
WHERE user_id=2;
UPDATE Credits
SET credit=credit + 30
WHERE user_id=4;
--SELECT * FROM Credits;
--SELECT * FROM Ledger;
ROLLBACK;

--TASK 3--

CREATE TABLE Ledger (
	ID serial PRIMARY KEY,
	Sender INT,
	Receiver INT,
	Fee INT,
	Amount INT NOT NULL, 
	Transactiontime TIMESTAMP NOT NULL
	
);
