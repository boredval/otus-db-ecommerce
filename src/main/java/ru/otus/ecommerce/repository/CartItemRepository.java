package ru.otus.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.otus.ecommerce.entity.CartItem;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Long> {
}

