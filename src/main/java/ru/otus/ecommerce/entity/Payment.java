package ru.otus.ecommerce.entity;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.jpa.repository.Temporal;
import ru.otus.ecommerce.entity.enumerations.PaymentMethod;
import ru.otus.ecommerce.entity.enumerations.PaymentStatus;

import java.security.Timestamp;

@Entity
@Getter
@Setter
public class Payment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long paymentId;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;

    @Column(nullable = false)
    private Double amount;

    @Enumerated(EnumType.STRING)
    private PaymentMethod paymentMethod;

    @Enumerated(EnumType.STRING)
    private PaymentStatus status;

    private Timestamp paymentDate;

}
