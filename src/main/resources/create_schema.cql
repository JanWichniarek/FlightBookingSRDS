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
	id	uuid,
	flight_id		uuid,
	passenger		text,
  seat_no		int,
	PRIMARY KEY (flight_id, id)
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
 SET count = count + 8
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

INSERT INTO reservations (id, flight_id, passenger, seat_no)
  VALUES (e0b843ac-ffdc-11e8-8eb2-f2801f1b9fd1, 15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 'Brad Pitt', 1);

INSERT INTO reservations (id, flight_id, passenger, seat_no)
  VALUES (09805478-ffdd-11e8-8eb2-f2801f1b9fd1, 15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 'Katie Melua', 2);

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

