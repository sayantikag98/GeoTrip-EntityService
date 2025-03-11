package com.geotrip.entityservice.models;

public enum BookingStatus {
    REQUESTED,
    SEARCHING_DRIVER,
    DRIVER_ASSIGNED,
    DRIVER_ARRIVING,
    IN_PROGRESS,
    COMPLETED,
    CANCELLED,
    SCHEDULED
}
