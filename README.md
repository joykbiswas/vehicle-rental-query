## Vehicle Rental - SQL Queries

### Query 1: Retrieve booking information along with customer name and vehicle name:

**Concepts Used**: INNER JOIN

### Explanation:
This query combines data from the bookings, users, and vehicles tables using INNER JOIN.
It retrieves only those records where a valid relationship exists between bookings, users, and vehicles.

The result includes:

- Booking ID
- Customer name
- Vehicle name
- Booking start date
- Booking end date
- Booking status
- INNER JOIN ensures that only records with matching users and vehicles are shown.

### Query 2: Find all vehicles that have never been booked

**Concepts Used**: NOT EXISTS

### Explanation:
This query identifies vehicles that do not have any booking records.

- This query returns vehicles that do not appear in the bookings table.
- NOT EXISTS checks whether a vehicle has no booking records.

### Query 3: Retrieve all available vehicles of a specific type:

**Concepts Used**: SELECT, WHERE

### Explanation:
This query filters vehicles based on specific conditions:

- Vehicle type must be car
- Vehicle status must be available


### Query 4: Find vehicles that have more than 2 bookings: 

**Concepts Used**: GROUP BY, HAVING, COUNT

### Explanation:
This query calculates the total number of bookings for each vehicle.

Steps performed:
- GROUP BY groups bookings by vehicle
- COUNT() calculates total bookings per vehicle
-  HAVING filters only vehicles with more than 2 bookings.
