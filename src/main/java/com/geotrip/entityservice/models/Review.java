package com.geotrip.entityservice.models;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@MappedSuperclass
public class Review extends BaseModel {

    //Value between 1 and 5
    @Column(nullable = false)
    private int rating;

    private String comment;

}
