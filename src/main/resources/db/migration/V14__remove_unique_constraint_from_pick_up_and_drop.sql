ALTER TABLE booking DROP FOREIGN KEY FK_BOOKING_ON_DROPOFFLOCATION;

ALTER TABLE booking DROP INDEX uc_booking_dropoff_location;

ALTER TABLE booking
    ADD CONSTRAINT FK_BOOKING_ON_DROPOFFLOCATION
        FOREIGN KEY (dropoff_location_id) REFERENCES exact_location(id);

ALTER TABLE booking DROP FOREIGN KEY FK_BOOKING_ON_PICKUPLOCATION;

ALTER TABLE booking DROP INDEX uc_booking_pickup_location;

ALTER TABLE booking
    ADD CONSTRAINT FK_BOOKING_ON_PICKUPLOCATION
        FOREIGN KEY (pickup_location_id) REFERENCES exact_location(id);