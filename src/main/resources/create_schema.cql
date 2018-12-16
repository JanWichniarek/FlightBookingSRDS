CREATE KEYSPACE IF NOT EXISTS FlightBooking
  WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 2 };

USE FlightBooking;

DROP TABLE IF EXISTS FlightBooking.flights;
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

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 1, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (15a8c4be-ffd9-11e8-8eb2-f2801f1b9fd1, 2, true);

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
-- ------------------------------------------------------------------------------------------------

INSERT INTO flights (id, departure, destination, date, duration, cost)
  VALUES (739d8b9a-ffd9-11e8-8eb2-f2801f1b9fd1, 'Warsaw', 'Los Angeles', '2019-05-12', 730, 900);

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

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (19b7a9f9-b975-408c-9aa6-dbd5a9d4e9d8, 1, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (19b7a9f9-b975-408c-9aa6-dbd5a9d4e9d8, 2, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (19b7a9f9-b975-408c-9aa6-dbd5a9d4e9d8, 3, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (19b7a9f9-b975-408c-9aa6-dbd5a9d4e9d8, 4, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (19b7a9f9-b975-408c-9aa6-dbd5a9d4e9d8, 5, true);

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
-- ------------------------------------------------------------------------------------------------
INSERT INTO flights (id, departure, destination, date, duration, cost)
  VALUES (0ae9176f-a280-42de-8284-43c6a86f6a50, 'Berlin', 'Tokyo', '2019-05-12', 700, 1500);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (0ae9176f-a280-42de-8284-43c6a86f6a50, 1, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (0ae9176f-a280-42de-8284-43c6a86f6a50, 2, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (0ae9176f-a280-42de-8284-43c6a86f6a50, 3, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (0ae9176f-a280-42de-8284-43c6a86f6a50, 4, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (0ae9176f-a280-42de-8284-43c6a86f6a50, 5, true);

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

-- ------------------------------------------------------------------------------------------------
INSERT INTO flights (id, departure, destination, date, duration, cost)
  VALUES (83cafcbf-f041-4532-89bb-c3c1be134063, 'Paris', 'Tokyo', '2019-05-13', 600, 1500);

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

-- ------------------------------------------------------------------------------------------------
INSERT INTO flights (id, departure, destination, date, duration, cost)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 'Paris', 'Berlin', '2019-05-14', 600, 1500);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 1, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 2, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 3, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 4, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 5, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 6, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 7, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 8, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 9, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 10, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 11, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 12, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 13, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 14, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 15, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 16, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 17, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 18, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 19, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 20, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 21, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 22, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 23, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 24, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 25, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 26, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 27, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 28, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 29, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 30, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 31, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 32, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 33, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 34, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 35, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 36, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 37, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 38, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 39, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 40, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 41, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 42, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 43, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 44, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 45, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 46, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 47, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 48, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 49, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 50, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 51, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 52, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 53, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 54, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 55, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 56, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 57, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 58, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 59, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 60, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 61, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 62, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 63, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 64, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 65, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 66, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 67, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 68, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 69, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 70, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 71, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 72, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 73, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 74, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 75, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 76, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 77, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 78, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 79, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 80, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 81, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 82, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 83, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 84, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 85, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 86, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 87, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 88, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 89, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 90, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 91, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 92, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 93, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 94, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 95, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 96, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 97, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 98, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 99, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56236675-81f5-4da7-bae8-3bc5caf990a5, 100, true);

-- ------------------------------------------------------------------------------------------------
INSERT INTO flights (id, departure, destination, date, duration, cost)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 'Warsaw', 'Pekin', '2019-05-14', 600, 1500);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 1, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 2, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 3, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 4, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 5, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 6, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 7, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 8, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 9, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 10, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 11, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 12, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 13, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 14, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 15, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 16, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 17, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 18, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 19, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 20, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 21, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 22, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 23, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 24, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 25, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 26, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 27, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 28, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 29, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 30, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 31, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 32, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 33, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 34, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 35, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 36, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 37, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 38, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 39, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 40, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 41, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 42, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 43, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 44, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 45, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 46, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 47, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 48, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 49, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 50, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 51, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 52, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 53, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 54, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 55, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 56, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 57, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 58, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 59, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 60, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 61, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 62, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 63, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 64, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 65, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 66, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 67, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 68, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 69, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 70, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 71, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 72, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 73, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 74, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 75, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 76, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 77, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 78, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 79, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 80, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 81, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 82, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 83, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 84, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 85, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 86, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 87, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 88, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 89, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 90, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 91, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 92, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 93, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 94, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 95, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 96, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 97, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 98, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 99, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (afe94447-e2f7-4b40-8889-45c6903561ba, 100, true);

-- ------------------------------------------------------------------------------------------------
INSERT INTO flights (id, departure, destination, date, duration, cost)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 'Los Angeles', 'Pekin', '2019-05-14', 600, 1500);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 1, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 2, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 3, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 4, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 5, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 6, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 7, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 8, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 9, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 10, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 11, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 12, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 13, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 14, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 15, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 16, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 17, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 18, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 19, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 20, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 21, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 22, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 23, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 24, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 25, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 26, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 27, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 28, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 29, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 30, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 31, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 32, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 33, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 34, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 35, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 36, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 37, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 38, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 39, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 40, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 41, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 42, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 43, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 44, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 45, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 46, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 47, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 48, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 49, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 50, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 51, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 52, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 53, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 54, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 55, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 56, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 57, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 58, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 59, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 60, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 61, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 62, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 63, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 64, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 65, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 66, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 67, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 68, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 69, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 70, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 71, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 72, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 73, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 74, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 75, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 76, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 77, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 78, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 79, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 80, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 81, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 82, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 83, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 84, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 85, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 86, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 87, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 88, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 89, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 90, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 91, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 92, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 93, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 94, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 95, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 96, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 97, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 98, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 99, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (56481b0d-c67c-49b0-9916-d29d92821f2e, 100, true);

-- ------------------------------------------------------------------------------------------------
INSERT INTO flights (id, departure, destination, date, duration, cost)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 'Los Angeles', 'Warsaw', '2019-05-14', 600, 1500);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 1, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 2, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 3, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 4, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 5, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 6, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 7, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 8, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 9, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 10, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 11, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 12, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 13, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 14, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 15, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 16, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 17, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 18, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 19, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 20, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 21, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 22, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 23, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 24, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 25, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 26, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 27, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 28, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 29, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 30, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 31, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 32, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 33, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 34, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 35, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 36, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 37, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 38, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 39, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 40, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 41, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 42, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 43, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 44, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 45, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 46, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 47, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 48, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 49, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 50, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 51, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 52, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 53, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 54, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 55, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 56, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 57, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 58, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 59, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 60, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 61, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 62, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 63, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 64, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 65, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 66, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 67, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 68, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 69, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 70, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 71, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 72, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 73, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 74, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 75, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 76, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 77, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 78, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 79, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 80, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 81, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 82, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 83, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 84, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 85, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 86, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 87, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 88, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 89, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 90, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 91, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 92, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 93, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 94, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 95, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 96, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 97, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 98, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 99, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (2857465e-66f2-4a34-873d-222e09390e13, 100, true);

-- ------------------------------------------------------------------------------------------------
INSERT INTO flights (id, departure, destination, date, duration, cost)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 'Paris', 'Warsaw', '2019-05-15', 600, 1500);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 1, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 2, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 3, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 4, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 5, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 6, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 7, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 8, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 9, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 10, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 11, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 12, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 13, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 14, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 15, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 16, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 17, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 18, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 19, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 20, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 21, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 22, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 23, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 24, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 25, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 26, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 27, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 28, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 29, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 30, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 31, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 32, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 33, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 34, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 35, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 36, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 37, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 38, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 39, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 40, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 41, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 42, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 43, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 44, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 45, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 46, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 47, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 48, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 49, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 50, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 51, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 52, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 53, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 54, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 55, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 56, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 57, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 58, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 59, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 60, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 61, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 62, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 63, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 64, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 65, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 66, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 67, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 68, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 69, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 70, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 71, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 72, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 73, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 74, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 75, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 76, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 77, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 78, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 79, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 80, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 81, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 82, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 83, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 84, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 85, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 86, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 87, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 88, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 89, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 90, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 91, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 92, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 93, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 94, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 95, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 96, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 97, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 98, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 99, true);

INSERT INTO seats (flight_id, seat_no, is_free)
  VALUES (c3a73ee3-754f-4099-accc-f68b597872fb, 100, true);