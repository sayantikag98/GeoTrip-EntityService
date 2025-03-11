package com.geotrip.entityservice.models;


import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "car")
public class Car extends BaseModel {


    @Column(nullable = false, unique = true)
    private String plateNumber;



    private String color;


    private String brand;

    private String model;


    @Enumerated(EnumType.STRING)
    @Column(columnDefinition = "ENUM ('SEDAN', 'HATCHBACK', 'SUV', 'MUV') NOT NULL")
    private CarType carType;

    @OneToOne(fetch = FetchType.LAZY)
    private Driver driver;

}
