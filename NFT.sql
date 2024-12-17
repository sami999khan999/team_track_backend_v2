-- Active: 1730477691279@@127.0.0.1@3306@nft_management


CREATE DATABASE nft_management


CREATE TABLE catagory(
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(100),
    unit VARCHAR(50) NOT NULL DEFAULT 'yds',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)


CREATE TABLE products(
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    rate INT NOT NULL,
    production_cost FLOAT NOT NULL,
    other_cost FLOAT DEFAULT 0 NOT NULL,
    catagory_id BIGINT UNSIGNED NOT NULL,
    Foreign Key (`catagory_id`) REFERENCES catagory (`id`),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

CREATE TABLE employee(
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    nid_no VARCHAR(50) NOT NULL,
    mobile VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

CREATE TABLE production(
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    products_id BIGINT UNSIGNED NOT NULL,
    employee_id BIGINT UNSIGNED NOT NULL,
    quantity FLOAT NOT NULL,
    rate FLOAT NOT NULL,
    payment VARCHAR(50) DEFAULT 'NOT-PAID' NOT NULL,
    Foreign Key (`products_id`) REFERENCES products (`id`),
    Foreign Key (`employee_id`) REFERENCES employee (`id`),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

CREATE TABLE inventory(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    employee_id BIGINT UNSIGNED NOT NULL,
    products_id BIGINT UNSIGNED NOT NULL,
    production_id BIGINT UNSIGNED NOT NULL,
    current_status VARCHAR(50) DEFAULT 'IN-STOCK' NOT NULL,                     -- Check if it is sold or not if it is sold then change it to SOLD
    Foreign Key (`employee_id`) REFERENCES employee (`id`),
    Foreign Key (`products_id`) REFERENCES products (`id`),
    Foreign Key (`production_id`) REFERENCES production (`id`),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

CREATE TABLE employee_bill(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    employee_id BIGINT UNSIGNED NOT NULL,
    total_amount FLOAT NOT NULL,
    current_status VARCHAR(50) DEFAULT 'NOT-PAID' NOT NULL,
    Foreign Key (`employee_id`) REFERENCES employee (`id`),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

CREATE TABLE employee_bill_production (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    employee_bill_id BIGINT UNSIGNED NOT NULL,
    products_id BIGINT UNSIGNED NOT NULL,
    production_id BIGINT UNSIGNED NOT NULL,
    rate FLOAT NOT NULL,
    quantity FLOAT NOT NULL,
    amount FLOAT NOT NULL,
    FOREIGN KEY (`employee_bill_id`) REFERENCES employee_bill (`id`),
    FOREIGN KEY (`products_id`) REFERENCES products (`id`),
    FOREIGN KEY (`production_id`) REFERENCES production (`id`),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)


CREATE TABLE customer(
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    company_name VARCHAR(100) DEFAULT 'NONE' NOT NULL,
    address VARCHAR(100) NOT NULL,
    mobile VARCHAR(50) NOT NULL,
    email VARCHAR(50) DEFAULT 'NONE' NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

CREATE TABLE challan(
    id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id BIGINT UNSIGNED NOT NULL,
    total VARCHAR(100) NOT NULL,
    current_status VARCHAR(50) DEFAULT 'NOT-PAID' NOT NULL,
    Foreign Key (`customer_id`) REFERENCES customer (`id`),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

CREATE TABLE challan_production (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    challan_id BIGINT UNSIGNED NOT NULL,
    products_id BIGINT UNSIGNED NOT NULL,
    employee_id BIGINT UNSIGNED NOT NULL,
    production_id BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (`challan_id`) REFERENCES challan (`id`),
    FOREIGN KEY (`products_id`) REFERENCES products (`id`),
    FOREIGN KEY (`employee_id`) REFERENCES employee (`id`),
    FOREIGN KEY (`production_id`) REFERENCES production (`id`),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)


CREATE TABLE cash_memo(
    id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id BIGINT UNSIGNED NOT NULL,
    total_yds BIGINT NOT NULL,
    total_amount BIGINT NOT NULL,
    Foreign Key (`customer_id`) REFERENCES customer (`id`),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)


CREATE TABLE cashmemo_Challan(
    id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cash_memo_id BIGINT UNSIGNED NOT NULL,
    products_id BIGINT UNSIGNED NOT NULL,
    challan_id BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (`cash_memo_id`) REFERENCES cash_memo (`id`),
    FOREIGN KEY (`products_id`) REFERENCES products (`id`),
    Foreign Key (`challan_id`) REFERENCES challan (`id`),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)


