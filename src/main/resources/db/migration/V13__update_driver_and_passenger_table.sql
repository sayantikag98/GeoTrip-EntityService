ALTER TABLE driver
    ADD is_email_verified BIT(1) DEFAULT 0 NULL;

ALTER TABLE driver
    ADD is_license_number_verified BIT(1) DEFAULT 0 NULL;

ALTER TABLE driver
    ADD is_phone_number_verified BIT(1) DEFAULT 0 NULL;

ALTER TABLE passenger
    ADD is_email_verified BIT(1) DEFAULT 0 NULL;

ALTER TABLE passenger
    ADD is_phone_number_verified BIT(1) DEFAULT 0 NULL;