DROP DATABASE FRESH2U;
CREATE DATABASE FRESH2U;
USE FRESH2U;

-- Question 2
-- Table 1: Code for the farmers table
CREATE TABLE Farmers (
    farmer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    id_number VARCHAR(13) NOT NULL,
    email VARCHAR(255) NOT NULL,
    cellphone_number VARCHAR(15) NOT NULL
);

-- Table 2: Code for the farms table
CREATE TABLE Farms (
    farm_id INT PRIMARY KEY AUTO_INCREMENT,
    farmer_id INT NOT NULL,
    product_type VARCHAR(100) NOT NULL,
    province VARCHAR(50) NOT NULL,
    hectares DECIMAL(10, 2) NOT NULL,
    revenue_percentage DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (farmer_id) REFERENCES Farmers(farmer_id)
);

-- Table 3: Code for the clients table
CREATE TABLE Clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    client_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    cellphone_number VARCHAR(15) NOT NULL,
    date_joined DATE NOT NULL
);

-- Table 4: Code for the drivers table
CREATE TABLE Drivers (
    driver_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    employee_type ENUM('Full-Time', 'Part-Time') NOT NULL,
    cellphone_number VARCHAR(15) NOT NULL
);

-- Table 5: Code for the orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
	farm_id INT NOT NULL,
    client_id INT NOT NULL,
    driver_id INT NOT NULL,
    date_placed DATE NOT NULL,
    date_fulfilled DATE NOT NULL,
    total_cost DECIMAL(10, 2) NOT NULL,
	FOREIGN KEY (farm_id) REFERENCES Farms(farm_id),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

-- Table 6: Code for the bankingdetails table
CREATE TABLE BankingDetails (
    bankingdetail_id INT PRIMARY KEY AUTO_INCREMENT,
    farmer_id INT,
    client_id INT,
    bank VARCHAR(100) NOT NULL,
    account_number VARCHAR(20) NOT NULL,
    account_holder_name VARCHAR(100) NOT NULL,
    branch_code VARCHAR(10) NOT NULL,
    FOREIGN KEY (farmer_id) REFERENCES Farmers(farmer_id),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
    );
    
-- Table 7: Code for the payments table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    bankingdetail_id INT NOT NULL,
    payment_type ENUM('Incoming', 'Outgoing') NOT NULL,
    payment_amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    FOREIGN KEY (bankingdetail_id) REFERENCES BankingDetails(bankingdetail_id)
);

-- Question 3
-- Inserting data into the farmers table
INSERT INTO Farmers (first_name, last_name, id_number, email, cellphone_number)
VALUES 
    ('Melody', 'Daniels', '9801011234080', 'melody.daniels@gmail.com', '0781235432'),			-- Farmer Melody Daniels
    ('Silindile', 'Makgopa', '7702055678090', 'silindile.makgopa@gmail.com', '0827654598'),		-- Farmer Silindile Makgopa
    ('Nazir', 'Moosa', '8506169876025', 'nazir.moosa@gmail.com', '0799877896'),					-- Farmer Nazir Moosa
    ('Zaahid', 'De-Almeida', '0503055232082', 'zaahid.de-almeida@gmail.com', '0844564123'),		-- Farmer Zaahid De-Almeida
    ('Bella', 'Williams', '9408284567123', 'jane.smith@gmail.com', '0765435566');				-- Farmer Bella Williams

-- Inserting data into the farms table
INSERT INTO Farms (product_type, province, hectares, revenue_percentage, farmer_id)
VALUES 
    ('Apples', 'Western Cape', 2.90, 20.00, 1), 		-- Farm producing Apples, managed by Melody Daniels		
    ('Sheep', 'Karoo', 10.50, 30.00, 2),  				-- Farm with Sheep, managed by Silindile Makgopa	     
    ('Pecan Nuts', 'Mpumalanga', 4.50, 25.00, 3),		-- Farm with Pecan Nuts, managed by Nazir Moosa
    ('Strawberries', 'Free State', 2.00, 15.00, 4),     -- Farm with Strawberries, managed by Zaahid De-Almeida
    ('Maize', 'North West', 10.75, 35.00, 5);  			-- Farm producing Maize, managed by Bella Williams			

-- Inserting data into the clients table
INSERT INTO Clients (client_name, email, cellphone_number, date_joined)
VALUES 
    ('Checkers', 'supply@checkers.co.za', '0813543256', '2020-01-01'),						-- Client Checkers
    ('Woolworths', 'supply@woolworths.co.za', '0825553232', '2019-01-07'),					-- Client Woolworths
    ('Ucook', 'supply@ucook.co.za', '0835669987', '2021-04-07'),							-- Client UCook
    ('Food Lovers Market', 'supply@foodloversmarket.co.za', '0741239945', '2023-09-12'),	-- Client Food Lovers Market
    ('Farmers Market', 'supply@farmersmarket.co.za', '0829253360', '2022-01-01');			-- Client Farmers Market

-- Inserting data into the driverstable
INSERT INTO Drivers (first_name, last_name, employee_type, cellphone_number)
VALUES 
    ('Zack', 'Smith', 'Full-Time', '0815556363'),		-- Driver Zack Smith
    ('Nick', 'Johnson', 'Part-Time', '0824444545'),		-- Driver Nick Johnson
    ('Sarah', 'Williams', 'Full-Time', '0768885599'),	-- Driver Sarah Williams
    ('Rose', 'Jones', 'Part-Time', '0812323636'),		-- Driver Rose Jones
    ('David', 'Taylor', 'Full-Time', '0877302548');		-- Driver David Taylor

-- Inserting data into the orders table
INSERT INTO Orders (date_placed, date_fulfilled, total_cost, client_id, farm_id, driver_id)
VALUES 
    ('2024-05-01', '2024-05-05', 2500.00, 1, 1, 1), 	-- Order for Checkers from Melody's farm, delivered by Zack
    ('2024-06-02', '2024-06-06', 9000.00, 2, 2, 2), 	-- Order for Woolworths from Silindile's farm, delivered by Nick
    ('2024-07-03', '2024-07-07', 6000.00, 3, 3, 3),		-- Order for UCook from Nazir's farm, delivered by Sarah
    ('2024-08-04', '2024-08-08', 8000.00, 4, 4, 4),		-- Order for Food Lovers Market from Zaahid's farm, delivered by Rose
    ('2024-09-05', '2024-09-09', 3000.00, 5, 5, 5); 	-- Order for Farmers Market from Bella's farm, delivered by David

-- Inserting data into the bankingdetails table
INSERT INTO BankingDetails (bank, account_number, account_holder_name, branch_code, farmer_id, client_id)
VALUES 
    ('FNB', '1523478965', 'Melody Daniels', '789456', 1, NULL),			-- Banking details for Melody Daniels
    ('Nedbank', '9853241258', 'Silindile Makgopa', '147258', 2, NULL),	-- Banking details for Silindile Makgopa
    ('Standard Bank', '7512304235', 'Nazir Moosa', '963852', 3, NULL), 	-- Banking details for Nazir Moosa
    ('FNB', '5623212030', 'Zaahid De-Almeida', '745228', 4, NULL),		-- Banking details for Zaahid De-Almeida
    ('Capitec', '5421035785', 'Bella Williams', '524791', 5, NULL),		-- Banking details for Bella Williams
    ('ABSA', '7893254165', 'Farmers Market', '278412', NULL, 1);		-- Banking details for Farmers Market

-- Inserting data into the payments table
INSERT INTO Payments (payment_type, payment_amount, payment_date, bankingdetail_id)
VALUES 
    ('Outgoing', 2000.00, '2024-05-03', 1),  -- Payment to farmer Melody Daniels after fulfilling an order
    ('Outgoing', 6300.00, '2024-06-04', 2),  -- Payment to farmer Silindile Makgopa after fulfilling an order
    ('Outgoing', 4500.00, '2024-07-05', 3),	 -- Payment to farmer Nazir Moosa after fulfilling an order
    ('Outgoing', 6800.00, '2024-08-06', 4),	 -- Payment to farmer Zaahid De-Almeida after fulfilling an order
    ('Outgoing', 1950.00, '2024-09-07', 5),  -- Payment to Bella Williams for order fulfillment
    ('Incoming', 3000.00, '2024-09-06', 6);  -- Incoming payment from Checkers for orders fulfilled
    
SELECT * FROM Farmers;
SELECT * FROM Farms;
SELECT * FROM Clients;
SELECT * FROM Drivers;
SELECT * FROM Orders;
SELECT * FROM BankingDetails;
SELECT * FROM Payments;

-- Question 4
-- View 1: Orders Per Month
CREATE VIEW vwOrdersPerMonth AS  										-- Create a view to count total orders per month
SELECT COUNT(*) AS total_orders, MONTH(date_placed) AS order_month  	-- Select count of orders and month
FROM Orders  															-- From the Orders table
WHERE YEAR(date_placed) = 2024  										-- Filter for orders placed in the year 2024
GROUP BY MONTH(date_placed);  											-- Group results by month

-- View 2: Total Revenue per Client
CREATE VIEW vwTotalRevenuePerClient AS  								-- Create a view to calculate total revenue from each client
SELECT Clients.client_name, 
	SUM(Orders.total_cost) AS total_revenue  							-- Select client name and total revenue
FROM Orders  															-- From the Orders table
JOIN Clients 
ON Orders.client_id = Clients.client_id  								-- Join Orders with Clients on client ID
GROUP BY Clients.client_name;  											-- Group results by client name to get total revenue per client

SELECT * FROM vwOrdersPerMonth;
SELECT * FROM vwTotalRevenuePerClient; 

-- Question 5
-- Stored Procedure 1: GetOrdersByClientName
DELIMITER $$  
CREATE PROCEDURE GetOrdersByClientName(IN clientName VARCHAR(100))  -- Create a stored procedure to get orders by client name
BEGIN  
    SELECT Orders.*  												-- Select all details from the Orders table
    FROM Orders  													-- From the Orders table
    JOIN Clients ON Orders.client_id = Clients.client_id  			-- Join with Clients table to access client details
    WHERE Clients.client_name = clientName;  						-- Filter orders by the specified client name
END$$  
DELIMITER ; 

CALL GetOrdersByClientName('Checkers');  							-- Call the procedure for a specific client name, for example, "Checkers"

-- Stored Procedure 2: GetDriverDetailsByName
DELIMITER $$  
CREATE PROCEDURE GetDriverDetailsByName(IN driverName VARCHAR(50))  -- Create a stored procedure to get details of a driver by name
BEGIN  
    SELECT * FROM Drivers  											-- Select all information from the Drivers table
    WHERE first_name = driverName OR last_name = driverName;  		-- Filter results by the specified first or last name
END$$  
DELIMITER ; 

CALL GetDriverDetailsByName('Zack');  								-- Call the procedure for a specific driver name, for example, "Zack"

-- Question 6
-- Trigger 1: CascadeDeleteOrders
DELIMITER $$  
CREATE TRIGGER trgCascadeDeleteOrders  
AFTER DELETE ON Orders  
FOR EACH ROW  
BEGIN  
    DELETE FROM Payments WHERE bankingdetail_id = OLD.order_id;  
END$$  
DELIMITER ;

-- Trigger 2: ValidateFarmerID
DELIMITER $$  
CREATE TRIGGER trgValidateFarmerID  
BEFORE INSERT ON Farmers  
FOR EACH ROW  
BEGIN  
    IF LENGTH(NEW.id_number) != 13 THEN  
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Farmer ID must be exactly 13 digits long';  
    END IF;  
END$$  
DELIMITER ;

-- Question 7
-- Index 1: Index on farmer_id in the Farms Table
CREATE INDEX idx_farmer_id ON Farms(farmer_id);

-- Index 2: Index on client_id in the Orders Table
CREATE INDEX idx_client_id ON Orders(client_id);

