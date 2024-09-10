CREATE TABLE Users (
    user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    role ENUM('CUSTOMER', 'ADMIN') DEFAULT 'CUSTOMER',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Category (
    category_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);
CREATE TABLE Product (
    product_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT DEFAULT 0,
    category_id BIGINT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);
CREATE TABLE `Order` (
    order_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('PENDING', 'PROCESSING', 'SHIPPED', 'DELIVERED', 'CANCELLED') DEFAULT 'PENDING',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE OrderItem (
    order_item_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT,
    product_id BIGINT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
CREATE TABLE ShoppingCart (
    cart_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE CartItem (
    cart_item_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    cart_id BIGINT,
    product_id BIGINT,
    quantity INT NOT NULL,
    FOREIGN KEY (cart_id) REFERENCES ShoppingCart(cart_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
CREATE TABLE Address (
    address_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT,
    street VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE Payment (
    payment_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method ENUM('CREDIT_CARD', 'PAYPAL', 'STRIPE'),
    status ENUM('PENDING', 'COMPLETED', 'FAILED') DEFAULT 'PENDING',
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id)
);
CREATE TABLE ProductReview (
    review_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT,
    user_id BIGINT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE Role (
    role_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL
);
CREATE TABLE UserRole (
    user_role_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT,
    role_id BIGINT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (role_id) REFERENCES `Role`(role_id)
);
