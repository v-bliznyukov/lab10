--TASK 1--
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

SELECT * FROM Credits;

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
VALUES (2,1,0,700,CURRENT_TIMESTAMP);

UPDATE Credits
SET credit=credit - 100
WHERE user_id=2;
UPDATE Credits
SET credit=credit + 100
WHERE user_id=3;

INSERT INTO Ledger(Sender,Receiver,Fee,Amount,Transactiontime)
VALUES (2,3,0,100,CURRENT_TIMESTAMP);

--SELECT * FROM Credits;
--SELECT * FROM Ledger;
ROLLBACK;
