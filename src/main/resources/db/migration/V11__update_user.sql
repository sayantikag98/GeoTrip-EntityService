ALTER TABLE driver
    ADD role ENUM ('DRIVER', 'PASSENGER') NOT NULL;

ALTER TABLE passenger
    ADD role ENUM ('DRIVER', 'PASSENGER') NOT NULL;

ALTER TABLE driver
    ADD CONSTRAINT uc_driver_email UNIQUE (email);

ALTER TABLE passenger
    ADD CONSTRAINT uc_passenger_email UNIQUE (email);