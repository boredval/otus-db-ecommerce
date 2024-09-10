package ru.otus.ecommerce.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
@Entity
public class Shipments {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @JoinColumn(name = "order_id")
    private Order order;

    @ManyToOne
    private Address address;

    private Timestamp shipmentDate;
}
