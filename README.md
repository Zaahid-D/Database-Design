**FRESH2U SQL Database Project**

This project contains SQL code to create and manage a relational database for FRESH2U, a platform connecting farmers, clients, and drivers to facilitate the sale and delivery of agricultural products. The database includes tables for farmers, farms, clients, drivers, orders, banking details, and payments, with several views and stored procedures to streamline data access and reporting.

**Database Structure**

**1. Tables**

**Farmers:** Stores personal information of farmers.

**Farms:** Details of farms, including product type, location, and ownership by farmers.

**Clients:** Information on clients who place orders.

**Drivers:** Data on drivers responsible for delivering orders.

**Orders:** Manages order details between farms and clients, with driver assignments.

**BankingDetails:** Stores banking information for both farmers and clients.

**Payments:** Records incoming and outgoing payments related to orders.

**2. Views**

**vwOrdersPerMonth:** Summarizes total orders placed each month in 2024.

**vwTotalRevenuePerClient:** Calculates total revenue per client from completed orders.

**3. Stored Procedures**

**GetOrdersByClientName:** Fetches order details by client name.

**GetDriverDetailsByName:** Retrieves driver details by first or last name.

**4. Triggers**

**trgCascadeDeleteOrders:** A trigger to manage order deletions (work in progress).


**Getting Started**

To set up the FRESH2U database:

Run the DROP DATABASE and CREATE DATABASE commands to reset and initialize the database.

Use the CREATE TABLE statements to set up tables as specified.

Insert sample data provided in the INSERT INTO commands to populate the database.

Create views and stored procedures as needed.

Run the provided CALL commands to test stored procedures.


**Usage Examples**

Get Orders by Client Name: CALL GetOrdersByClientName('Checkers');

Get Driver Details by Name: CALL GetDriverDetailsByName('Zack');

