package com.geotrip.entityservice.models;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "exact_location")
public class ExactLocation extends BaseModel {

    @Column(nullable = false)
    private Double latitude;


    @Column(nullable = false)
    private Double longitude;
}
