package com.geotrip.entityservice.models;


import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;


//TODO: payment, price, ride type (go, moto, shuttle, premium)
//TODO: add index on BookingStatus

@Entity
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "booking")
public class Booking extends BaseModel{


    @Enumerated(EnumType.STRING)
    @Column(nullable = false, columnDefinition = "ENUM ('REQUESTED', 'SEARCHING_DRIVER', 'DRIVER_ASSIGNED', 'DRIVER_ARRIVING', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED', 'SCHEDULED') NOT NULL")
    private BookingStatus bookingStatus;


    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime startTime;


    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime endTime;


    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime scheduledAt;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "pickup_location_id", nullable = false)
    private ExactLocation pickupLocation;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "dropoff_location_id", nullable = false)
    private ExactLocation dropoffLocation;


    @JsonBackReference
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "driver_id")
    private Driver driver;


    @JsonBackReference
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "passenger_id", nullable = false)
    private Passenger passenger;


    @OneToOne(mappedBy = "booking", cascade = CascadeType.ALL, orphanRemoval = true)
    private DriverReview driverReviews;


    @OneToOne(mappedBy = "booking", cascade = CascadeType.ALL, orphanRemoval = true)
    private PassengerReview passengerReviews;

}
