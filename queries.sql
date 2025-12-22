
create table
  users (
    user_id serial primary KEY,
    name VARCHAR(100) not null,
    email VARCHAR(150) unique not null,
    password VARCHAR(150) not null,
    phone VARCHAR(20) not null,
    role VARCHAR(20) NOT NULL CHECK (role IN ('Admin', 'Customer'))
  );


INSERT INTO
  users (name, email, password, phone, role)
VALUES
  (
    'Joy',
    'joy@example.com',
    'hashed_password_1',
    '1234567890',
    'Customer'
  ),
  (
    'Alice',
    'alice@example.com',
    'hashed_password_21',
    '1234567890',
    'Customer'
  ),
  (
    'Bob',
    'bob@example.com',
    'hashed_password_2',
    '0987654321',
    'Admin'
  ),
  (
    'Charlie',
    'charlie@example.com',
    'hashed_password_3',
    '1122334455',
    'Customer'
  );

CREATE TABLE
  vehicles (
    vehicle_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type
      VARCHAR(20) NOT NULL CHECK (
        type
          IN ('car', 'bike', 'truck')
      ),
      model VARCHAR(100) NOT NULL,
      registration_number VARCHAR(100) UNIQUE NOT NULL,
      rental_price INT NOT NULL,
      status VARCHAR(30) NOT NULL CHECK (status IN ('available', 'rented', 'maintenance'))
  );


-- drop table vehicles
INSERT INTO
  vehicles (
    name,
    type,
      model,
      registration_number,
      rental_price,
      status
  )
VALUES
  (
    'Toyota ',
    'car',
    '2021',
    'ABC-1234',
    35,
    'available'
  ),
  (
    'Honda CB150R4',
    'bike',
    '2020',
    'XYZ-5678',
    40,
    'available'
  ),
  (
    'Tata Truck',
    'truck',
    '2020',
    'KHL-99909',
    70,
    'maintenance'
  ),
  (
    'Honda CC50',
    'car',
    2021,
    'AAB-456',
    60,
    'available'
  ),
  (
    'Yamaha R15',
    'bike',
    2023,
    'GHI-78900',
    30,
    'available'
  );



CREATE TABLE
  bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users (user_id) not null,
    vehicle_id INT REFERENCES vehicles (vehicle_id) not null,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) CHECK (
      status IN ('pending', 'confirmed', 'completed', 'cancelled')
    ),
    total_cost INT NOT NULL
  );

INSERT INTO
  bookings (user_id, vehicle_id, start_date, end_date, status, total_cost) 
  VALUES
(2, 2, '2023-10-01', '2023-10-05', 'completed', 240),
(1, 1, '2023-11-01', '2023-11-03', 'completed', 120),
(3, 2, '2023-12-10', '2023-12-12', 'confirmed', 60),
(2, 5, '2024-01-15', '2024-01-20', 'pending', 325),
(4, 3, '2024-02-01', '2024-02-03', 'cancelled', 90); 



  
-- Query: 1
SELECT
  bookings.booking_id,
  users.name AS customer_name,
  vehicles.name as vehicle_name,
  bookings.start_date,
  bookings.end_date,
  bookings.status
FROM
  bookings
  INNER JOIN users USING (user_id)
  INNER JOIN vehicles USING (vehicle_id)
ORDER BY
  booking_id;

-- Query: 2
SELECT
  *
FROM
  vehicles 
WHERE
  NOT EXISTS (
    SELECT
      1
    FROM
      bookings 
    WHERE
      bookings.vehicle_id = vehicles.vehicle_id
  );

-- Query: 3

select * 
from vehicles
where 
type = 'car'
and status = 'available';

-- Query: 4

select
  name as vehicle_name, count(*) as total_bookings
  from bookings
  inner join vehicles using (vehicle_id)
  WHERE bookings.status = 'completed'
  group by name
  HAVING count ( booking_id) >2;
  
