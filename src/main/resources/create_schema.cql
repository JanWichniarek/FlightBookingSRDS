CREATE KEYSPACE IF NOT EXISTS FlightBooking
  WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 3 };

USE FlightBooking;

DROP TABLE IF EXISTS FlightBooking.flights;
DROP TABLE IF EXISTS FlightBooking.free_seats;
DROP TABLE IF EXISTS FlightBooking.reservations;
DROP INDEX IF EXISTS FlightBooking.is_free_idx;
DROP TABLE IF EXISTS FlightBooking.seats;

CREATE TABLE IF NOT EXISTS flights (
  id uuid,
  departure text,
  destination text,
  date text,
  duration int,
  cost float,
  PRIMARY KEY ((departure, date), destination)
);

CREATE TABLE IF NOT EXISTS free_seats (
	flight_id	uuid,
	count counter,
	PRIMARY KEY (flight_id)
);

CREATE TABLE IF NOT EXISTS reservations (
  id uuid,
	flight_id		uuid,
	passenger		text,
  seat_no		int,
	PRIMARY KEY (flight_id, seat_no, id)
);

CREATE TABLE IF NOT EXISTS seats (
	flight_id uuid,
  seat_no int,
  is_free boolean,
  PRIMARY KEY (flight_id, seat_no)
);
CREATE INDEX IF NOT EXISTS is_free_idx ON FlightBooking.seats ( is_free );

-- ------------------------------------------------------------------------------------------------
INSERT INTO flights (id, departure, destination, date, duration, cost)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 'Warsaw', 'Tokyo', '2019-05-12', 600, 1500);

UPDATE FlightBooking.free_seats
 SET count = count + 48
 WHERE flight_id = 15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1;

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 1, false);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 2, false);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 3, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 4, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 5, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 6, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 7, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 8, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 9, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 10, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 11, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 12, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 13, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 14, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 15, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 16, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 17, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 18, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 19, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 20, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 21, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 22, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 23, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 24, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 25, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 26, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 27, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 28, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 29, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 30, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 31, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 32, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 33, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 34, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 35, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 36, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 37, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 38, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 39, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 40, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 41, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 42, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 43, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 44, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 45, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 46, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 47, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 48, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 49, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 50, true);

INSERT INTO reservations (id, flight_id, passenger, seat_no)
  VALUES (cc8fe4a4-7c68-4dbc-8ba1-63160fa84077, 15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 'Brad Pitt', 1);

INSERT INTO reservations (id, flight_id, passenger, seat_no)
  VALUES (3ed47b2f-ba2b-4f53-9bc3-36ca2cac123a, 15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 'Katie Melua', 2);

-- ------------------------------------------------------------------------------------------------

INSERT INTO flights (id, departure, destination, date, duration, cost)
  VALUES (739d8b9a-ffd9-11e8-8eb2-f2801f1b9fd1, 'Warsaw', 'Los Angeles', '2019-05-12', 730, 900);

UPDATE FlightBooking.free_seats
 SET count = count + 5
 WHERE flight_id = 739d8b9a-ffd9-11e8-8eb2-f2801f1b9fd1;

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (739d8b9a-ffd9-11e8-8eb2-f2801f1b9fd1, 1, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (739d8b9a-ffd9-11e8-8eb2-f2801f1b9fd1, 2, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (739d8b9a-ffd9-11e8-8eb2-f2801f1b9fd1, 3, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (739d8b9a-ffd9-11e8-8eb2-f2801f1b9fd1, 4, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (739d8b9a-ffd9-11e8-8eb2-f2801f1b9fd1, 5, true);

-- ------------------------------------------------------------------------------------------------

INSERT INTO flights (id, departure, destination, date, duration, cost)
  VALUES (98d83040-ffd9-11e8-8eb2-f2801f1b9fd1, 'Warsaw', 'Tokyo', '2019-06-06', 600, 1300);

UPDATE FlightBooking.free_seats
 SET count = count + 5
 WHERE flight_id = 98d83040-ffd9-11e8-8eb2-f2801f1b9fd1;

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (98d83040-ffd9-11e8-8eb2-f2801f1b9fd1, 1, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (98d83040-ffd9-11e8-8eb2-f2801f1b9fd1, 2, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (98d83040-ffd9-11e8-8eb2-f2801f1b9fd1, 3, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (98d83040-ffd9-11e8-8eb2-f2801f1b9fd1, 4, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (98d83040-ffd9-11e8-8eb2-f2801f1b9fd1, 5, true);

-- ------------------------------------------------------------------------------------------------

INSERT INTO flights (id, departure, destination, date, duration, cost)
  VALUES (8bcdf31e-ffdc-11e8-8eb2-f2801f1b9fd1, 'Berlin', 'Tokyo', '2019-06-06', 730, 1150);

UPDATE FlightBooking.free_seats
 SET count = count + 5
 WHERE flight_id = 8bcdf31e-ffdc-11e8-8eb2-f2801f1b9fd1;

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (8bcdf31e-ffdc-11e8-8eb2-f2801f1b9fd1, 1, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (8bcdf31e-ffdc-11e8-8eb2-f2801f1b9fd1, 2, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (8bcdf31e-ffdc-11e8-8eb2-f2801f1b9fd1, 3, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (8bcdf31e-ffdc-11e8-8eb2-f2801f1b9fd1, 4, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (8bcdf31e-ffdc-11e8-8eb2-f2801f1b9fd1, 5, true);

-- ------------------------------------------------------------------------------------------------

INSERT INTO flights (id, departure, destination, date, duration, cost)
  VALUES (924b5bc8-ffdc-11e8-8eb2-f2801f1b9fd1, 'Berlin', 'Paris', '2019-06-06', 210, 100);

UPDATE FlightBooking.free_seats
 SET count = count + 5
 WHERE flight_id = 924b5bc8-ffdc-11e8-8eb2-f2801f1b9fd1;

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (924b5bc8-ffdc-11e8-8eb2-f2801f1b9fd1, 1, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (924b5bc8-ffdc-11e8-8eb2-f2801f1b9fd1, 2, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (924b5bc8-ffdc-11e8-8eb2-f2801f1b9fd1, 3, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (924b5bc8-ffdc-11e8-8eb2-f2801f1b9fd1, 4, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (924b5bc8-ffdc-11e8-8eb2-f2801f1b9fd1, 5, true);

-- ------------------------------------------------------------------------------------------------
INSERT INTO flights (id, departure, destination, date, duration, cost)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 'Warsaw', 'Berlin', '2019-05-12', 600, 1500);

UPDATE FlightBooking.free_seats
 SET count = count + 8
 WHERE flight_id = 19b7a9f9-b975-408c-9aa6-dbd5a9d4e9d8;

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (19b7a9f9-b975-408c-9aa6-dbd5a9d4e9d8, 1, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (19b7a9f9-b975-408c-9aa6-dbd5a9d4e9d8, 2, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (19b7a9f9-b975-408c-9aa6-dbd5a9d4e9d8, 3, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (19b7a9f9-b975-408c-9aa6-dbd5a9d4e9d8, 4, false);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (19b7a9f9-b975-408c-9aa6-dbd5a9d4e9d8, 5, false);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (19b7a9f9-b975-408c-9aa6-dbd5a9d4e9d8, 6, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (19b7a9f9-b975-408c-9aa6-dbd5a9d4e9d8, 7, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (19b7a9f9-b975-408c-9aa6-dbd5a9d4e9d8, 8, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (19b7a9f9-b975-408c-9aa6-dbd5a9d4e9d8, 9, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (19b7a9f9-b975-408c-9aa6-dbd5a9d4e9d8, 10, true);

INSERT INTO reservations (id, flight_id, passenger, seat_no)
  VALUES (c43e5938-f14e-4240-8935-6486ed917fc9, 19b7a9f9-b975-408c-9aa6-dbd5a9d4e9d8, 'Harry Potter', 4);

INSERT INTO reservations (id, flight_id, passenger, seat_no)
  VALUES (5347caa1-77d1-47b6-a0a3-36ffb9c1d07f, 19b7a9f9-b975-408c-9aa6-dbd5a9d4e9d8, 'Lord Voldemort', 5);


-- ------------------------------------------------------------------------------------------------
INSERT INTO flights (id, departure, destination, date, duration, cost)
  VALUES (0ae9176f-a280-42de-8284-43c6a86f6a50, 'Berlin', 'Tokyo', '2019-05-12', 700, 1500);

UPDATE FlightBooking.free_seats
 SET count = count + 8
 WHERE flight_id = 0ae9176f-a280-42de-8284-43c6a86f6a50;

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (0ae9176f-a280-42de-8284-43c6a86f6a50, 1, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (0ae9176f-a280-42de-8284-43c6a86f6a50, 2, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (0ae9176f-a280-42de-8284-43c6a86f6a50, 3, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (0ae9176f-a280-42de-8284-43c6a86f6a50, 4, false);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (0ae9176f-a280-42de-8284-43c6a86f6a50, 5, false);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (0ae9176f-a280-42de-8284-43c6a86f6a50, 6, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (0ae9176f-a280-42de-8284-43c6a86f6a50, 7, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (0ae9176f-a280-42de-8284-43c6a86f6a50, 8, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (0ae9176f-a280-42de-8284-43c6a86f6a50, 9, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (0ae9176f-a280-42de-8284-43c6a86f6a50, 10, true);

INSERT INTO reservations (id, flight_id, passenger, seat_no)
  VALUES (773809b9-cfa2-4a6b-ad32-6626cb81d0be, 0ae9176f-a280-42de-8284-43c6a86f6a50, 'Kasia Kowalska', 4);

INSERT INTO reservations (id, flight_id, passenger, seat_no)
  VALUES (a1f6ec14-cd89-429b-a590-0722e72f1b33, 0ae9176f-a280-42de-8284-43c6a86f6a50, 'Borys Szyc', 5);

-- ------------------------------------------------------------------------------------------------
INSERT INTO flights (id, departure, destination, date, duration, cost)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 'Paris', 'Tokyo', '2019-05-13', 600, 1500);

UPDATE FlightBooking.free_seats
 SET count = count + 60
 WHERE flight_id = 83cafcbf-f041-4532-89bb-c3c1be134063;

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 1, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 2, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 3, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 4, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 5, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 6, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 7, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 8, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 9, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 10, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 11, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 12, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 13, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 14, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 15, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 16, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 17, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 18, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 19, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 20, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 21, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 22, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 23, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 24, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 25, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 26, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 27, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 28, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 29, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 30, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 31, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 32, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 33, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 34, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 35, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 36, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 37, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 38, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 39, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 40, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 41, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 42, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 43, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 44, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 45, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 46, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 47, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 48, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 49, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 50, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 51, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 52, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 53, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 54, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 55, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 56, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 57, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 58, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 59, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 60, true);

-- ------------------------------------------------------------------------------------------------
INSERT INTO flights (id, departure, destination, date, duration, cost)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 'Paris', 'Tokyo', '2019-05-12', 600, 1500);

UPDATE FlightBooking.free_seats
 SET count = count + 60
 WHERE flight_id = e8781650-2be9-4020-b3d0-52e0f144e663;

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 1, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 2, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 3, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 4, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 5, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 6, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 7, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 8, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 9, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 10, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 11, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 12, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 13, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 14, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 15, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 16, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 17, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 18, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 19, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 20, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 21, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 22, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 23, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 24, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 25, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 26, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 27, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 28, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 29, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 30, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 31, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 32, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 33, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 34, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 35, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 36, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 37, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 38, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 39, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 40, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 41, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 42, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 43, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 44, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 45, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 46, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 47, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 48, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 49, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 50, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 51, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 52, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 53, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 54, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 55, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 56, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 57, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 58, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 59, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (e8781650-2be9-4020-b3d0-52e0f144e663, 60, true);

-- ------------------------------------------------------------------------------------------------
INSERT INTO flights (id, departure, destination, date, duration, cost)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 'Paris', 'Berlin', '2019-05-13', 600, 1500);

UPDATE FlightBooking.free_seats
 SET count = count + 60
 WHERE flight_id = 75e14e6e-e501-453c-be77-9d84eac5ee3d;

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 1, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 2, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 3, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 4, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 5, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 6, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 7, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 8, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 9, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 10, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 11, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 12, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 13, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 14, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 15, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 16, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 17, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 18, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 19, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 20, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 21, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 22, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 23, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 24, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 25, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 26, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 27, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 28, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 29, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 30, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 31, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 32, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 33, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 34, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 35, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 36, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 37, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 38, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 39, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 40, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 41, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 42, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 43, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 44, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 45, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 46, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 47, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 48, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 49, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 50, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 51, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 52, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 53, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 54, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 55, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 56, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 57, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 58, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 59, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (75e14e6e-e501-453c-be77-9d84eac5ee3d, 60, true);