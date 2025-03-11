CREATE TABLE exact_location
(
    id         BINARY(16) NOT NULL,
    created_at datetime   NOT NULL,
    updated_at datetime   NOT NULL,
    latitude   DOUBLE     NOT NULL,
    longitude  DOUBLE     NOT NULL,
    CONSTRAINT pk_exactlocation PRIMARY KEY (id)
);

ALTER TABLE booking
    ADD dropoff_location_id BINARY(16) NULL;

ALTER TABLE booking
    ADD end_time datetime NULL;

ALTER TABLE booking
    ADD pickup_location_id BINARY(16) NULL;

ALTER TABLE booking
    ADD start_time datetime NULL;

ALTER TABLE booking
    ADD CONSTRAINT FK_BOOKING_ON_DROPOFFLOCATION FOREIGN KEY (dropoff_location_id) REFERENCES exact_location (id);

ALTER TABLE booking
    ADD CONSTRAINT FK_BOOKING_ON_PICKUPLOCATION FOREIGN KEY (pickup_location_id) REFERENCES exact_location (id);

ALTER TABLE driver
    DROP COLUMN approval_status;

ALTER TABLE driver
    ADD approval_status ENUM ('Pending', 'Approved', 'Rejected') DEFAULT 'Approved' NOT NULL;

ALTER TABLE car
    DROP COLUMN car_type;

ALTER TABLE car
    ADD car_type ENUM ('Sedan', 'Hatchback', 'SUV', 'MUV') NOT NULL;