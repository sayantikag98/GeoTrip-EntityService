CREATE TABLE IF NOT EXISTS car
(
    id           BINARY(16)   NOT NULL,
    created_at   datetime     NOT NULL,
    updated_at   datetime     NOT NULL,
    plate_number VARCHAR(255) NOT NULL,
    color        VARCHAR(255) NULL,
    brand        VARCHAR(255) NULL,
    model        VARCHAR(255) NULL,
    car_type     ENUM('Sedan', 'Hatchback', 'SUV', 'MUV')  NULL,
    driver_id    BINARY(16)   NULL,
    CONSTRAINT pk_car PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS driver
(
    id              BINARY(16)   NOT NULL,
    name            VARCHAR(255) NOT NULL,
    email           VARCHAR(255) NOT NULL,
    password        VARCHAR(255) NOT NULL,
    phone_number    VARCHAR(255) NOT NULL,
    created_at      datetime     NOT NULL,
    updated_at      datetime     NOT NULL,
    license_number  VARCHAR(255) NOT NULL,
    average_rating DOUBLE NOT NULL,
    approval_status ENUM('Pending', 'Approved', 'Rejected') NULL,
    is_active       BIT(1)       NOT NULL,
    CONSTRAINT pk_driver PRIMARY KEY (id)
);

ALTER TABLE car
    ADD CONSTRAINT uc_car_platenumber UNIQUE (plate_number);

ALTER TABLE driver
    ADD CONSTRAINT uc_driver_licensenumber UNIQUE (license_number);

ALTER TABLE car
    ADD CONSTRAINT FK_CAR_ON_DRIVER FOREIGN KEY (driver_id) REFERENCES driver (id);