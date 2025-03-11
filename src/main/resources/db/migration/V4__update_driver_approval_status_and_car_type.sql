ALTER TABLE driver
    DROP COLUMN approval_status;

ALTER TABLE driver
    ADD approval_status ENUM ('Pending', 'Approved', 'Rejected') DEFAULT 'Approved' NOT NULL;

ALTER TABLE driver
    MODIFY approval_status ENUM ('Pending', 'Approved', 'Rejected') NOT NULL;

ALTER TABLE driver
    ALTER approval_status SET DEFAULT ('Approved');

ALTER TABLE car
    DROP COLUMN car_type;

ALTER TABLE car
    ADD car_type ENUM ('Sedan', 'Hatchback', 'SUV', 'MUV') NOT NULL;

ALTER TABLE car
    MODIFY car_type ENUM ('Sedan', 'Hatchback', 'SUV', 'MUV') NOT NULL;