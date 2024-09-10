package ru.otus.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.otus.ecommerce.entity.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
}
