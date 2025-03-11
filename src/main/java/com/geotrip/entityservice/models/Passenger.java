package com.geotrip.entityservice.models;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "passenger")
public class Passenger extends User {

    @JsonManagedReference
    @OneToMany(mappedBy = "passenger", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    private List<Booking> bookings;


    @JsonManagedReference
    @OneToMany(mappedBy = "passenger", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    List<PassengerReview> reviewsReceived;


    @JsonManagedReference
    @OneToMany(mappedBy = "passenger", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    List<DriverReview> reviewsGiven;
}
