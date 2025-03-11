ALTER TABLE driver_review
    MODIFY booking_id BINARY(16) NOT NULL;

ALTER TABLE passenger_review
    MODIFY booking_id BINARY(16) NOT NULL;

ALTER TABLE driver_review
    MODIFY driver_reviewee_id BINARY(16) NOT NULL;

ALTER TABLE passenger_review
    MODIFY driver_reviewer_id BINARY(16) NOT NULL;

ALTER TABLE passenger_review
    MODIFY passenger_reviewee_id BINARY(16) NOT NULL;

ALTER TABLE driver_review
    MODIFY passenger_reviewer_id BINARY(16) NOT NULL;