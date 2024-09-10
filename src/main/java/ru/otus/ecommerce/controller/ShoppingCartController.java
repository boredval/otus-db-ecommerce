package ru.otus.ecommerce.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ru.otus.ecommerce.entity.CartItem;
import ru.otus.ecommerce.entity.ShoppingCart;
import ru.otus.ecommerce.repository.CartItemRepository;
import ru.otus.ecommerce.repository.ShoppingCartRepository;

@RestController
@RequestMapping("/api/cart")
@RequiredArgsConstructor
public class ShoppingCartController {

    private final ShoppingCartRepository shoppingCartRepository;
    private final CartItemRepository cartItemRepository;

    @GetMapping("/{userId}")
    public ResponseEntity<ShoppingCart> getCartByUserId(@PathVariable Long userId) {
        return ResponseEntity.ok(shoppingCartRepository.findByUserId(userId));
    }

    @PostMapping("/{userId}/items")
    public CartItem addCartItem(@PathVariable Long userId, @RequestBody CartItem cartItem) {
        ShoppingCart cart = shoppingCartRepository.findByUserId(userId);
        cartItem.setCart(cart);
        return cartItemRepository.save(cartItem);
    }

    @DeleteMapping("/items/{cartItemId}")
    public ResponseEntity<Object> removeCartItem(@PathVariable Long cartItemId) {
        return cartItemRepository.findById(cartItemId)
                .map(item -> {
                    cartItemRepository.delete(item);
                    return ResponseEntity.ok().build();
                }).orElse(ResponseEntity.notFound().build());
    }
}
