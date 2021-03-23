--TASK 3--

CREATE TABLE Ledger (
	ID serial PRIMARY KEY,
	Sender INT,
	Receiver INT,
	Fee INT,
	Amount INT NOT NULL, 
	Transactiontime TIMESTAMP NOT NULL
	
);
