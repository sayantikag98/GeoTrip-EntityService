ALTER TABLE booking
    ADD scheduled_at datetime NULL;

ALTER TABLE driver
    DROP COLUMN approval_status;

ALTER TABLE driver
    ADD approval_status ENUM ('PENDING', 'APPROVED', 'REJECTED') DEFAULT 'APPROVED' NOT NULL;

ALTER TABLE booking
    DROP COLUMN booking_status;

ALTER TABLE booking
    ADD booking_status ENUM ('REQUESTED', 'SEARCHING_DRIVER', 'DRIVER_ASSIGNED', 'DRIVER_ARRIVING', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED', 'SCHEDULED') NOT NULL;

ALTER TABLE car
    DROP COLUMN car_type;

ALTER TABLE car
    ADD car_type ENUM ('SEDAN', 'HATCHBACK', 'SUV', 'MUV') NOT NULL;

ALTER TABLE booking
    MODIFY driver_id BINARY(16) NULL;

ALTER TABLE booking
    MODIFY dropoff_location_id BINARY(16) NOT NULL;

ALTER TABLE booking
    MODIFY pickup_location_id BINARY(16) NOT NULL;