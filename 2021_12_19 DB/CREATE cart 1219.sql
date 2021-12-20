DROP TABLE point;
DROP TABLE license;
DROP TABLE wish;
DROP TABLE coupon;
DROP TABLE cart;
DROP TABLE payment;



  /* CREATE payment */
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `payment_total` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `payment_comment` varchar(255) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_name` varchar(255) DEFAULT NULL,
  `payment_email` varchar(255) DEFAULT NULL,
  `payment_phone` varchar(255) DEFAULT NULL,
  `payment_product_total` varchar(255) DEFAULT NULL,
  `payment_delivery` varchar(255) DEFAULT NULL,
  `payment_use_coupon` varchar(255) DEFAULT NULL,
  `payment_use_point` varchar(255) DEFAULT NULL,
  `payment_total_discount` varchar(255) DEFAULT NULL,
  `payment_add_point` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `payment_memberId_FK_idx` (`member_id`),
  KEY `payment_addressId_FK_idx` (`address_id`),
  CONSTRAINT `payment_memberId_FK` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payment_addressId_FK` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
);



/* CREATE cart */
CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `cart_cnt` int DEFAULT NULL,
  `cart_state` varchar(255) DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `cart_review_state` int,
  PRIMARY KEY (`cart_id`),
  KEY `cart_memberId_FK_idx` (`member_id`),
  KEY `cart_productId_FK_idx` (`product_id`),
  KEY `cart_paymentId_FK_idx` (`payment_id`),
  CONSTRAINT `cart_memberId_FK` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_paymentId_FK` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_productId_FK` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
);




/* CREATE coupon */
CREATE TABLE `coupon` (
  `coupon_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `coupon_name` varchar(255) DEFAULT NULL,
  `coupon_state` varchar(255) DEFAULT NULL,
  `coupon_type` varchar(255) DEFAULT NULL,
  `coupon_discount` int DEFAULT NULL,
  `coupon_get` date DEFAULT NULL,
  `coupon_validity` date DEFAULT NULL,
  PRIMARY KEY (`coupon_id`),
  KEY `coupon_memberId_FK_idx` (`member_id`),
  KEY `coupon_paymentId_FK_idx` (`payment_id`),
  CONSTRAINT `coupon_memberId_FK` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `coupon_paymentId_FK` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`) ON DELETE CASCADE ON UPDATE CASCADE
);




/* CREATE wish */ -- 찜하기
CREATE TABLE `wish` (
  `wish_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `wish_cnt` int DEFAULT NULL,
  PRIMARY KEY (`wish_id`),
  KEY `wish_memberId_FK_idx` (`member_id`),
  KEY `wish_productId_FK_idx` (`product_id`),
  CONSTRAINT `wish_memberId_FK` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wish_productId_FK` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
);


/* CREATE license */ -- 정품등록 serial number
CREATE TABLE `license` (
  `serial_number` varchar(255) NOT NULL,
  `product_id` int DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  PRIMARY KEY (`serial_number`),
  KEY `license_productId_FK_idx` (`product_id`),
  KEY `license_memberId_FK_idx` (`member_id`),
  KEY `license_cartId_FK_idx` (`cart_id`),
  CONSTRAINT `license_cartId_FK` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `license_memberId_FK` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `license_productId_FK` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
);


/* CREATE point */ -- 콩포인트 내역
CREATE TABLE `point` (
  `point_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `point_date` date DEFAULT NULL,
  `point_type` varchar(255) DEFAULT NULL,
  `point_history` varchar(255) DEFAULT NULL,
  `point_addOrUse` int DEFAULT NULL,
  `point_totalPoint` int DEFAULT NULL,
  PRIMARY KEY (`point_id`),
  KEY `point_memberId_FK_idx` (`member_id`),
  CONSTRAINT `point_memberId_FK` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
);


 