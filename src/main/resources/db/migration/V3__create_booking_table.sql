CREATE TABLE booking
(
    id           BINARY(16) NOT NULL,
    created_at   datetime   NOT NULL,
    updated_at   datetime   NOT NULL,
    driver_id    BINARY(16) NOT NULL,
    passenger_id BINARY(16) NOT NULL,
    CONSTRAINT pk_booking PRIMARY KEY (id)
);

ALTER TABLE booking
    ADD CONSTRAINT FK_BOOKING_ON_DRIVER FOREIGN KEY (driver_id) REFERENCES driver (id);

ALTER TABLE booking
    ADD CONSTRAINT FK_BOOKING_ON_PASSENGER FOREIGN KEY (passenger_id) REFERENCES passenger (id);
