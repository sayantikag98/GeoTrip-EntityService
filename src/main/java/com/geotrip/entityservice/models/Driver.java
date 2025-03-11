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
@Table(name = "driver")
public class Driver extends User{

    @Column(nullable = false, unique = true)
    private String licenseNumber;

    @Column(nullable = false, columnDefinition = "BIT(1) DEFAULT 0 NOT NULL")
    private Boolean isLicenseNumberVerified;

    @OneToOne(mappedBy = "driver", cascade = CascadeType.ALL, orphanRemoval = true)
    private Car car;


    @Enumerated(EnumType.STRING)
    @Column(columnDefinition = "ENUM ('PENDING', 'APPROVED', 'REJECTED') NOT NULL DEFAULT 'PENDING'")
    private DriverApprovalStatus approvalStatus;


    @Column(nullable = false, columnDefinition = "BIT(1) DEFAULT 0 NOT NULL")
    private boolean isActive;


    @JsonManagedReference
    @OneToMany(mappedBy = "driver", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    private List<Booking> bookings;

    @JsonManagedReference
    @OneToMany(mappedBy = "driver", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    List<DriverReview> reviewsReceived;

    @JsonManagedReference
    @OneToMany(mappedBy = "driver", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    List<PassengerReview> reviewsGiven;
}
