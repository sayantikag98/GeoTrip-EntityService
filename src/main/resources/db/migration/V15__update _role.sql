ALTER TABLE driver
    DROP COLUMN `role`;

ALTER TABLE driver
    ADD `role` ENUM ('ROLE_DRIVER', 'ROLE_PASSENGER') DEFAULT 'ROLE_DRIVER' NOT NULL;

ALTER TABLE passenger
    DROP COLUMN `role`;

ALTER TABLE passenger
    ADD `role` ENUM ('ROLE_DRIVER', 'ROLE_PASSENGER') DEFAULT 'ROLE_PASSENGER' NOT NULL;