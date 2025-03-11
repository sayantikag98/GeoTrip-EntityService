CREATE TABLE driver_review
(
    id                    BINARY(16)   NOT NULL,
    rating                INT          NOT NULL,
    comment               VARCHAR(255) NULL,
    booking_id            BINARY(16)   NULL,
    created_at            datetime     NOT NULL,
    updated_at            datetime     NOT NULL,
    passenger_reviewer_id BINARY(16)   NULL,
    driver_reviewee_id    BINARY(16)   NULL,
    CONSTRAINT pk_driverreview PRIMARY KEY (id)
);

CREATE TABLE passenger_review
(
    id                    BINARY(16)   NOT NULL,
    rating                INT          NOT NULL,
    comment               VARCHAR(255) NULL,
    booking_id            BINARY(16)   NULL,
    created_at            datetime     NOT NULL,
    updated_at            datetime     NOT NULL,
    driver_reviewer_id    BINARY(16)   NULL,
    passenger_reviewee_id BINARY(16)   NULL,
    CONSTRAINT pk_passengerreview PRIMARY KEY (id)
);

ALTER TABLE driver_review
    ADD CONSTRAINT FK_DRIVERREVIEW_ON_BOOKING FOREIGN KEY (booking_id) REFERENCES booking (id);

ALTER TABLE driver_review
    ADD CONSTRAINT FK_DRIVERREVIEW_ON_DRIVERREVIEWEE FOREIGN KEY (driver_reviewee_id) REFERENCES driver (id);

ALTER TABLE driver_review
    ADD CONSTRAINT FK_DRIVERREVIEW_ON_PASSENGERREVIEWER FOREIGN KEY (passenger_reviewer_id) REFERENCES passenger (id);

ALTER TABLE passenger_review
    ADD CONSTRAINT FK_PASSENGERREVIEW_ON_BOOKING FOREIGN KEY (booking_id) REFERENCES booking (id);

ALTER TABLE passenger_review
    ADD CONSTRAINT FK_PASSENGERREVIEW_ON_DRIVERREVIEWER FOREIGN KEY (driver_reviewer_id) REFERENCES driver (id);

ALTER TABLE passenger_review
    ADD CONSTRAINT FK_PASSENGERREVIEW_ON_PASSENGERREVIEWEE FOREIGN KEY (passenger_reviewee_id) REFERENCES passenger (id);