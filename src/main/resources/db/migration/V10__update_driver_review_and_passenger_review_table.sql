ALTER TABLE driver_review
    DROP FOREIGN KEY FK_DRIVERREVIEW_ON_DRIVERREVIEWEE;

ALTER TABLE driver_review
    DROP FOREIGN KEY FK_DRIVERREVIEW_ON_PASSENGERREVIEWER;

ALTER TABLE passenger_review
    DROP FOREIGN KEY FK_PASSENGERREVIEW_ON_DRIVERREVIEWER;

ALTER TABLE passenger_review
    DROP FOREIGN KEY FK_PASSENGERREVIEW_ON_PASSENGERREVIEWEE;

ALTER TABLE driver_review
    ADD driver_id BINARY(16) NULL;

ALTER TABLE driver_review
    ADD passenger_id BINARY(16) NULL;

ALTER TABLE driver_review
    MODIFY driver_id BINARY(16) NOT NULL;

ALTER TABLE passenger_review
    ADD driver_id BINARY(16) NULL;

ALTER TABLE passenger_review
    ADD passenger_id BINARY(16) NULL;

ALTER TABLE passenger_review
    MODIFY driver_id BINARY(16) NOT NULL;

ALTER TABLE driver_review
    MODIFY passenger_id BINARY(16) NOT NULL;

ALTER TABLE passenger_review
    MODIFY passenger_id BINARY(16) NOT NULL;

ALTER TABLE driver_review
    ADD CONSTRAINT FK_DRIVERREVIEW_ON_DRIVER FOREIGN KEY (driver_id) REFERENCES driver (id);

ALTER TABLE driver_review
    ADD CONSTRAINT FK_DRIVERREVIEW_ON_PASSENGER FOREIGN KEY (passenger_id) REFERENCES passenger (id);

ALTER TABLE passenger_review
    ADD CONSTRAINT FK_PASSENGERREVIEW_ON_DRIVER FOREIGN KEY (driver_id) REFERENCES driver (id);

ALTER TABLE passenger_review
    ADD CONSTRAINT FK_PASSENGERREVIEW_ON_PASSENGER FOREIGN KEY (passenger_id) REFERENCES passenger (id);

ALTER TABLE driver_review
    DROP COLUMN driver_reviewee_id;

ALTER TABLE driver_review
    DROP COLUMN passenger_reviewer_id;

ALTER TABLE passenger_review
    DROP COLUMN driver_reviewer_id;

ALTER TABLE passenger_review
    DROP COLUMN passenger_reviewee_id;