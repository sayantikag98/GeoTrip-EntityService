CREATE TABLE IF NOT EXISTS passenger
(
    id             BINARY(16)   NOT NULL,
    name           VARCHAR(255) NOT NULL,
    email          VARCHAR(255) NOT NULL,
    password       VARCHAR(255) NOT NULL,
    phone_number   VARCHAR(255) NOT NULL,
    created_at     datetime     NOT NULL,
    updated_at     datetime     NOT NULL,
    average_rating DOUBLE       NULL,
    CONSTRAINT pk_passenger PRIMARY KEY (id)
);