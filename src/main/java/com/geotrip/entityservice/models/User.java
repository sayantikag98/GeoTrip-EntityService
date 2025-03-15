package com.geotrip.entityservice.models;

import jakarta.persistence.Column;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.MappedSuperclass;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;


@Getter
@Setter
@MappedSuperclass
public abstract class User extends BaseModel implements UserDetails {

    @Column(nullable = false)
    private String name;


    @Column(unique = true, nullable = false)
    private String email;


    @Column(nullable = false)
    private String password;


    @Column(nullable = false)
    private String phoneNumber;


    @Column(nullable = false, columnDefinition = "BIT(1) DEFAULT 0 NOT NULL")
    private Boolean isEmailVerified;


    @Column(nullable = false, columnDefinition = "BIT(1) DEFAULT 0 NOT NULL")
    private Boolean isPhoneNumberVerified;


    @Column(nullable = false, columnDefinition = "DOUBLE DEFAULT 0.0 NOT NULL")
    private Double averageRating;


    @Enumerated(EnumType.STRING)
    @Column(columnDefinition = "ENUM ('ROLE_DRIVER', 'ROLE_PASSENGER') NOT NULL")
    private Role role;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(() -> role.name());
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isEnabled() {
        return isEmailVerified && isPhoneNumberVerified;
    }
}
