package ru.otus.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.otus.ecommerce.entity.Payment;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Long> {
}
