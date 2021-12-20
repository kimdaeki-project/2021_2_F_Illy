use user04;

-- DROP TABLE member_role;
-- DROP TABLE role;
-- DROP TABLE member;
-- DROP TABLE address;

CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `address_name` varchar(255) DEFAULT NULL,
  `address_recipient_name` varchar(255) DEFAULT NULL,
  `address_recipient_phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address_default` int DEFAULT NULL,
  `main_address` varchar(255) NULL,
  `address_reference` varchar(255) NOT NULL,
  `address_detail` varchar(255) NULL,
  `address_postcode` varchar(255) NOT NULL,
  `member_id` int DEFAULT NULL,
  `address_myAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
);

CREATE TABLE `member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `member_name` varchar(255) DEFAULT NULL,
  `member_email` varchar(255) DEFAULT NULL,
  `member_phone` varchar(255) DEFAULT NULL,
  `member_birth` date DEFAULT NULL,
  `member_point` int DEFAULT NULL,
  `enabled` bit(1) default NULL ,
  PRIMARY KEY (`member_id`)
) ;

CREATE TABLE `role` (
 `num` int NOT NULL AUTO_INCREMENT,
 `roleName` varchar(255) DEFAULT NULL, 
 PRIMARY KEY (`num`)
) ;
insert into role values(null, 'ROLE_ADMIN');
insert into role values(null, 'ROLE_MEMBER');

CREATE TABLE `member_role` (
`username` varchar(255) NOT NULL,
`num` int NOT NULL,
PRIMARY KEY (`username`,`num`)
);
