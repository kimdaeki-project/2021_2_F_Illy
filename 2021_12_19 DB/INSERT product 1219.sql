/**************************************************
* INSERT coffee
**************************************************/
/************************* 001001-캡슐커피 *************************/
INSERT INTO product VALUES (NULL, '18P 필터 캡슐커피 [클라시코: 미디엄]', 15500, "<p><img src='/upload/product/coffee1.jpg'></p><p><img src='/upload/product/coffee2_캡슐_18p.jpg'></p>", '001001-캡슐커피', SYSDATE(), 'ILLY CAFFE S.P.A', '이탈리아', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '아라비카 볶은커피 81%, 아라비카 인스턴트커피 19%', '129.6g', 1.9);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '필터 캡슐커피 18P 클라시코.jpg', NULL);
INSERT INTO product VALUES (NULL, '18P 필터 캡슐커피 [인텐소: 다크]', 15500, "<p><img src='/upload/product/coffee1.jpg'></p><p><img src='/upload/product/coffee2_캡슐_18p.jpg'></p>", '001001-캡슐커피', SYSDATE(), 'ILLY CAFFE S.P.A', '이탈리아', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '아라비카 볶은커피 81%, 아라비카 인스턴트커피 19%', '129.6g', 1.9);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '필터 캡슐커피 18P 인텐소.jpg', NULL);
INSERT INTO product VALUES (NULL, '21P 캡슐커피 [디카프: 디카페인]', 17500, "<p><img src='/upload/product/coffee1.jpg'></p><p><img src='/upload/product/coffee2_캡슐_21p.jpg'></p>", '001001-캡슐커피', SYSDATE(), 'ILLY CAFFE S.P.A', '이탈리아', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '아라비카 원두커피 100%', '140.7g', 0.1);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '캡슐커피 21P 디카프.jpg', NULL);
INSERT INTO product VALUES (NULL, '21P 캡슐커피 [클라시코룽고: 룽고]', 17500, "<p><img src='/upload/product/coffee1.jpg'></p><p><img src='/upload/product/coffee2_캡슐_21p.jpg'></p>", '001001-캡슐커피', SYSDATE(), 'ILLY CAFFE S.P.A', '이탈리아', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '아라비카 원두커피 100%', '140.7g', 1.5);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '캡슐커피 21P 클라시코룽고.jpg', NULL);
INSERT INTO product VALUES (NULL, '21P 캡슐커피 [클라시코: 미디엄]', 17500, "<p><img src='/upload/product/coffee1.jpg'></p><p><img src='/upload/product/coffee2_캡슐_21p.jpg'></p>", '001001-캡슐커피', SYSDATE(), 'ILLY CAFFE S.P.A', '이탈리아', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '아라비카 원두커피 100%', '140.7g', 1.5);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '캡슐커피 21P 클라시코.jpg', NULL);
INSERT INTO product VALUES (NULL, '21P 캡슐커피 [인텐소: 다크]', 17500, "<p><img src='/upload/product/coffee1.jpg'></p><p><img src='/upload/product/coffee2_캡슐_21p.jpg'></p>", '001001-캡슐커피', SYSDATE(), 'ILLY CAFFE S.P.A', '이탈리아', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '아라비카 원두커피 100%', '140.7g', 1.5);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '캡슐커피 21P 인텐소.jpg', NULL);

/************************* 001002-원두커피 *************************/
INSERT INTO product VALUES (NULL, '250g 원두커피 [디카프: 디카페인]', 16500, "<p><img src='/upload/product/coffee1.jpg'></p><p><img src='/upload/product/coffee2_원두_250g.jpg'></p>", '001002-원두커피', SYSDATE(), 'ILLY CAFFE S.P.A', '이탈리아', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '아라비카 원두커피 100%', '250g', 0.1);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '원두커피 250g 디카프.jpg', NULL);
INSERT INTO product VALUES (NULL, '250g 원두커피 [인텐소: 다크]', 16500, "<p><img src='/upload/product/coffee1.jpg'></p><p><img src='/upload/product/coffee2_원두_250g.jpg'></p>", '001002-원두커피', SYSDATE(), 'ILLY CAFFE S.P.A', '이탈리아', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '아라비카 원두커피 100%', '250g', 1.5);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '원두커피 250g 인텐소.jpg', NULL);
INSERT INTO product VALUES (NULL, '250g 원두커피 [클라시코: 미디엄]', 16500, "<p><img src='/upload/product/coffee1.jpg'></p><p><img src='/upload/product/coffee2_원두_250g.jpg'></p>", '001002-원두커피', SYSDATE(), 'ILLY CAFFE S.P.A', '이탈리아', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '아라비카 원두커피 100%', '250g', 1.5);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '원두커피 250g 클라시코.jpg', NULL);

/************************* 001003-분쇄커피 *************************/
INSERT INTO product VALUES (NULL, '125g 분쇄커피 [디카프: 디카페인]', 8500, "<p><img src='/upload/product/coffee1.jpg'></p><p><img src='/upload/product/coffee2_분쇄_125g.jpg'></p>", '001003-분쇄커피', SYSDATE(), 'ILLY CAFFE S.P.A', '이탈리아', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '아라비카 원두커피 100%', '125g', 0.1);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '분쇄커피 125g 디카프.jpg', NULL);
INSERT INTO product VALUES (NULL, '125g 분쇄커피 [인텐소: 다크]', 8500, "<p><img src='/upload/product/coffee1.jpg'></p><p><img src='/upload/product/coffee2_분쇄_125g.jpg'></p>", '001003-분쇄커피', SYSDATE(), 'ILLY CAFFE S.P.A', '이탈리아', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '아라비카 원두커피 100%', '125g', 1.5);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '분쇄커피 125g 인텐소.jpg', NULL);
INSERT INTO product VALUES (NULL, '125g 분쇄커피 [클라시코: 미디엄]', 8500, "<p><img src='/upload/product/coffee1.jpg'></p><p><img src='/upload/product/coffee2_분쇄_125g.jpg'></p>", '001003-분쇄커피', SYSDATE(), 'ILLY CAFFE S.P.A', '이탈리아', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '아라비카 원두커피 100%', '125g', 1.5);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '분쇄커피 125g 클라시코.jpg', NULL);
INSERT INTO product VALUES (NULL, '250g 분쇄커피 [디카프: 디카페인]', 16500, "<p><img src='/upload/product/coffee1.jpg'></p><p><img src='/upload/product/coffee2_분쇄_250g.jpg'></p>", '001003-분쇄커피', SYSDATE(), 'ILLY CAFFE S.P.A', '이탈리아', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '아라비카 원두커피 100%', '250g', 0.1);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '분쇄커피 250g 디카프.jpg', NULL);
INSERT INTO product VALUES (NULL, '250g 분쇄커피 [클라시코: 미디엄]', 16500, "<p><img src='/upload/product/coffee1.jpg'></p><p><img src='/upload/product/coffee2_분쇄_250g.jpg'></p>", '001003-분쇄커피', SYSDATE(), 'ILLY CAFFE S.P.A', '이탈리아', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '아라비카 원두커피 100%', '250g', 1.5);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '분쇄커피 250g 클라시코.jpg', NULL);
INSERT INTO product VALUES (NULL, '250g 분쇄 필터커피 [클라시코: 미디엄]', 16500, "<p><img src='/upload/product/coffee1.jpg'></p><p><img src='/upload/product/coffee2_분쇄필터_250g.jpg'></p>", '001003-분쇄커피', SYSDATE(), 'ILLY CAFFE S.P.A', '이탈리아', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '아라비카 원두커피 100%', '250g', 1.5);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '분쇄 필터커피 250g 클라시코.jpg', NULL);
INSERT INTO product VALUES (NULL, '250g 분쇄 필터커피 [인텐소: 다크]', 16500, "<p><img src='/upload/product/coffee1.jpg'></p><p><img src='/upload/product/coffee2_분쇄필터_250g.jpg'></p>", '001003-분쇄커피', SYSDATE(), 'ILLY CAFFE S.P.A', '이탈리아', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '아라비카 원두커피 100%', '250g', 1.5);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '분쇄 필터커피 250g 인텐소.jpg', NULL);

/************************* 001004-스틱커피 *************************/
INSERT INTO product VALUES (NULL, '(미니 30P) 일리 스틱원두커피 [디카프: 디카페인]', 9900, "<p><img src='/upload/product/coffee_스틱커피.jpg'></p>", '001004-스틱커피', SYSDATE(), '(주)희망그린식품', '스위스', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '인스턴트 커피 97%, 볶은 커피 3%', '30g(1g * 30스틱)', 0.3);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '스틱원두커피 미니 30P 디카프.jpg', NULL);
INSERT INTO product VALUES (NULL, '(미니 30P) 일리 스틱원두커피 [인텐소: 다크]', 9900, "<p><img src='/upload/product/coffee_스틱커피.jpg'></p>", '001004-스틱커피', SYSDATE(), '(주)희망그린식품', '스위스', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '인스턴트커피 85%, 볶은커피 15%', '30g(1g * 30스틱)', 2.7);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '스틱원두커피 미니 30P 인텐소.jpg', NULL);
INSERT INTO product VALUES (NULL, '(미니 30P) 일리 스틱원두커피 [클라시코: 미디엄]', 9900, "<p><img src='/upload/product/coffee_스틱커피.jpg'></p>", '001004-스틱커피', SYSDATE(), '(주)희망그린식품', '스위스', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '인스턴트 커피 97%, 볶은 커피 3%', '30g(1g * 30스틱)', 2.7);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '스틱원두커피 미니 30P 클라시코.jpg', NULL);
INSERT INTO product VALUES (NULL, '(미니 70P) 일리 스틱원두커피 [인텐소: 다크]', 23000, "<p><img src='/upload/product/coffee_스틱커피.jpg'></p>", '001004-스틱커피', SYSDATE(), '(주)희망그린식품', '스위스', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '인스턴트커피 85%, 볶은커피 15%', '70g(1g * 70스틱)', 2.7);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '스틱원두커피 미니 70P 인텐소.jpg', NULL);
INSERT INTO product VALUES (NULL, '(미니 70P) 일리 스틱원두커피 [클라시코: 미디엄]', 23000, "<p><img src='/upload/product/coffee_스틱커피.jpg'></p>", '001004-스틱커피', SYSDATE(), '(주)희망그린식품', '스위스', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '인스턴트 커피 97%, 볶은 커피 3%', '70g(1g * 70스틱)', 2.7);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '스틱원두커피 미니 70P 클라시코.jpg', NULL);

INSERT INTO product VALUES (NULL, '(레귤러 30P) 일리 스틱원두커피 [디카프: 디카페인]', 15900, "<p><img src='/upload/product/coffee_스틱커피.jpg'></p>", '001004-스틱커피', SYSDATE(), '(주)희망그린식품', '스위스', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '인스턴트 커피 97%, 볶은 커피 3%', '48g(1.6g * 30스틱)', 0.3);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '스틱원두커피 레귤러 30P 디카프.jpg', NULL);
INSERT INTO product VALUES (NULL, '(레귤러 30P) 일리 스틱원두커피 [인텐소: 다크]', 15900, "<p><img src='/upload/product/coffee_스틱커피.jpg'></p>", '001004-스틱커피', SYSDATE(), '(주)희망그린식품', '스위스', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '인스턴트커피 85%, 볶은커피 15%', '48g(1.6g * 30스틱)', 2.7);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '스틱원두커피 레귤러 30P 인텐소.jpg', NULL);
INSERT INTO product VALUES (NULL, '(레귤러 30P) 일리 스틱원두커피 [클라시코: 미디엄]', 15900, "<p><img src='/upload/product/coffee_스틱커피.jpg'></p>", '001004-스틱커피', SYSDATE(), '(주)희망그린식품', '스위스', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '인스턴트 커피 97%, 볶은 커피 3%', '48g(1.6g * 30스틱)', 2.7);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '스틱원두커피 레귤러 30P 클라시코.jpg', NULL);
INSERT INTO product VALUES (NULL, '(레귤러 70P) 일리 스틱원두커피 [인텐소: 다크]', 36000, "<p><img src='/upload/product/coffee_스틱커피.jpg'></p>", '001004-스틱커피', SYSDATE(), '(주)희망그린식품', '스위스', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '인스턴트커피 85%, 볶은커피 15%', '112g(1.6g * 70스틱)', 2.7);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '스틱원두커피 레귤러 70P 인텐소.jpg', NULL);
INSERT INTO product VALUES (NULL, '(레귤러 70P) 일리 스틱원두커피 [클라시코: 미디엄]', 36000, "<p><img src='/upload/product/coffee_스틱커피.jpg'></p>", '001004-스틱커피', SYSDATE(), '(주)희망그린식품', '스위스', '㈜큐로홀딩스', 'sale');
INSERT INTO coffee VALUES ((SELECT MAX(product_id) FROM product), '인스턴트 커피 97%, 볶은 커피 3%', '112g(1.6g * 70스틱)', 2.7);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '스틱원두커피 레귤러 70P 클라시코.jpg', NULL);

/**************************************************
* INSERT machine
**************************************************/
/************************* 002002-X7.1 *************************/
INSERT INTO product VALUES (NULL, '일리 X7.1 캡슐커피머신 [블랙]', 307000, "<p><img src='/upload/product/machine_X7.1_블랙.jpg'></p>", '002002-X7.1', SYSDATE(), 'OSMAP PLASTIC HARDWARE PRODUCTS CO., LTD/', '중국OEM', '㈜큐로홀딩스', 'sale');
INSERT INTO machine VALUES((SELECT MAX(product_id) FROM product), '본체: 폴리카보네이트 / 내부보일러: 합금 알루미늄', 15, '220*340*350', 4.6, 1.0, 220, 60, 1100, 'SU071511-13001A');
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '일리 X7.1 캡슐커피머신 블랙.jpg', NULL);
INSERT INTO product VALUES (NULL, '일리 X7.1 캡슐커피머신 [화이트]', 307000, "<p><img src='/upload/product/machine_X7.1_화이트.jpg'></p>", '002002-X7.1', SYSDATE(), 'OSMAP PLASTIC HARDWARE PRODUCTS CO., LTD/', '중국OEM', '㈜큐로홀딩스', 'sale');
INSERT INTO machine VALUES((SELECT MAX(product_id) FROM product), '본체: 폴리카보네이트 / 내부보일러: 합금 알루미늄', 15, '220*340*350', 4.6, 1.0, 220, 60, 1100, 'SU071511-13001A');
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '일리 X7.1 캡슐커피머신 화이트.jpg', NULL);
INSERT INTO product VALUES (NULL, '일리 X7.1 캡슐커피머신 [레드]', 307000, "<p><img src='/upload/product/machine_X7.1_레드.jpg'></p>", '002002-X7.1', SYSDATE(), 'OSMAP PLASTIC HARDWARE PRODUCTS CO., LTD/', '중국OEM', '㈜큐로홀딩스', 'sale');
INSERT INTO machine VALUES((SELECT MAX(product_id) FROM product), '본체: 폴리카보네이트 / 내부보일러: 합금 알루미늄', 15, '220*340*350', 4.6, 1.0, 220, 60, 1100, 'SU071511-13001A');
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '일리 X7.1 캡슐커피머신 레드.jpg', NULL);

/************************* 002003-Y3.3 *************************/
INSERT INTO product VALUES (NULL, '일리 Y3.3 캡슐커피머신 [화이트]', 179000, "<p><img src='/upload/product/machine_Y3.3_화이트.jpg'></p>", '002003-Y3.3', SYSDATE(), 'Capitani S.R.L', '이탈리아', '㈜큐로홀딩스', 'sale');
INSERT INTO machine VALUES((SELECT MAX(product_id) FROM product), '본체: ABS 열교환기: 알루미늄', 19, '100*298*254', 3.4, 0.75, 240, 60, 850, 'SW07557-18001');
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '일리 Y3.3 캡슐커피머신 화이트.jpg', NULL);
INSERT INTO product VALUES (NULL, '일리 Y3.3 캡슐커피머신 [블랙]', 179000, "<p><img src='/upload/product/machine_Y3.3_블랙.jpg'></p>", '002003-Y3.3', SYSDATE(), 'Capitani S.R.L', '이탈리아', '㈜큐로홀딩스', 'sale');
INSERT INTO machine VALUES((SELECT MAX(product_id) FROM product), '본체: ABS 열교환기: 알루미늄', 19, '100*298*254', 3.4, 0.75, 240, 60, 850, 'SW07557-18001');
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '일리 Y3.3 캡슐커피머신 블랙.jpg', NULL);
INSERT INTO product VALUES (NULL, '일리 Y3.3 캡슐커피머신 [레드]', 179000, "<p><img src='/upload/product/machine_Y3.3_레드.jpg'></p>", '002003-Y3.3', SYSDATE(), 'Capitani S.R.L', '이탈리아', '㈜큐로홀딩스', 'sale');
INSERT INTO machine VALUES((SELECT MAX(product_id) FROM product), '본체: ABS 열교환기: 알루미늄', 19, '100*298*254', 3.4, 0.75, 240, 60, 850, 'SW07557-18001');
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '일리 Y3.3 캡슐커피머신 레드.jpg', NULL);
INSERT INTO product VALUES (NULL, '일리 Y3.3 캡슐커피머신 [라이트블루]', 179000, "<p><img src='/upload/product/machine_Y3.3_라이트블루.jpg'></p>", '002003-Y3.3', SYSDATE(), 'Capitani S.R.L', '이탈리아', '㈜큐로홀딩스', 'sale');
INSERT INTO machine VALUES((SELECT MAX(product_id) FROM product), '본체: ABS 열교환기: 알루미늄', 19, '100*298*254', 3.4, 0.75, 240, 60, 850, 'SW07557-18001');
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), '일리 Y3.3 캡슐커피머신 라이트블루.jpg', NULL);

/************************* 002001-X1 Anniversary *************************/
INSERT INTO product VALUES (NULL, 'X1 Anniversary 캡슐커피머신 [레드]', 690000, "<p><img src='/upload/product/machine_X1.jpg'></p><p><img src='/upload/product/machine_X1_레드.jpg'></p>", '002001-X1 Anniversary', SYSDATE(), 'Magic L\'Espresso S.L.', '스페인', '㈜큐로홀딩스', 'sale');
INSERT INTO machine VALUES((SELECT MAX(product_id) FROM product), 'Casing: steel /  Heat exchanger material: stainless steel', 15, '270*250*330', 7.2, 1.0, 240, 60, 1200, 'SW07718-21001');
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), 'X1 Anniversary 캡슐커피머신 레드1.jpg', NULL);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), 'X1 Anniversary 캡슐커피머신 레드2.jpg', NULL);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), 'X1 Anniversary 캡슐커피머신 레드3.jpg', NULL);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), 'X1 Anniversary 캡슐커피머신 레드4.jpg', NULL);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), 'X1 Anniversary 캡슐커피머신 레드5.jpg', NULL);
INSERT INTO product VALUES (NULL, 'X1 Anniversary 캡슐커피머신 [블랙]', 690000, "<p><img src='/upload/product/machine_X1.jpg'></p><p><img src='/upload/product/machine_X1_블랙.jpg'></p>", '002001-X1 Anniversary', SYSDATE(), 'Magic L\'Espresso S.L.', '스페인', '㈜큐로홀딩스', 'sale');
INSERT INTO machine VALUES((SELECT MAX(product_id) FROM product), 'Casing: steel /  Heat exchanger material: stainless steel', 15, '270*250*330', 7.2, 1.0, 240, 60, 1200, 'SW07718-21001');
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), 'X1 Anniversary 캡슐커피머신 블랙1.jpg', NULL);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), 'X1 Anniversary 캡슐커피머신 블랙2.jpg', NULL);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), 'X1 Anniversary 캡슐커피머신 블랙3.jpg', NULL);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), 'X1 Anniversary 캡슐커피머신 블랙4.jpg', NULL);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), 'X1 Anniversary 캡슐커피머신 블랙5.jpg', NULL);
INSERT INTO product VALUES (NULL, 'X1 Anniversary 캡슐커피머신 [이녹스]', 690000, "<p><img src='/upload/product/machine_X1.jpg'></p><p><img src='/upload/product/machine_X1_이녹스.jpg'></p>", '002001-X1 Anniversary', SYSDATE(), 'Magic L\'Espresso S.L.', '스페인', '㈜큐로홀딩스', 'sale');
INSERT INTO machine VALUES((SELECT MAX(product_id) FROM product), 'Casing: steel /  Heat exchanger material: stainless steel', 15, '270*250*330', 7.2, 1.0, 240, 60, 1200, 'SW07718-21001');
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), 'X1 Anniversary 캡슐커피머신 이녹스1.jpg', NULL);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), 'X1 Anniversary 캡슐커피머신 이녹스2.jpg', NULL);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), 'X1 Anniversary 캡슐커피머신 이녹스3.jpg', NULL);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), 'X1 Anniversary 캡슐커피머신 이녹스4.jpg', NULL);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), 'X1 Anniversary 캡슐커피머신 이녹스5.jpg', NULL);
INSERT INTO product VALUES (NULL, 'X1 Anniversary 캡슐커피머신 [아몬드]', 690000, "<p><img src='/upload/product/machine_X1.jpg'></p><p><img src='/upload/product/machine_X1_아몬드.jpg'></p>", '002001-X1 Anniversary', SYSDATE(), 'Magic L\'Espresso S.L.', '스페인', '㈜큐로홀딩스', 'sale');
INSERT INTO machine VALUES((SELECT MAX(product_id) FROM product), 'Casing: steel /  Heat exchanger material: stainless steel', 15, '270*250*330', 7.2, 1.0, 240, 60, 1200, 'SW07718-21001');
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), 'X1 Anniversary 캡슐커피머신 아몬드1.jpg', NULL);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), 'X1 Anniversary 캡슐커피머신 아몬드2.jpg', NULL);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), 'X1 Anniversary 캡슐커피머신 아몬드3.jpg', NULL);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), 'X1 Anniversary 캡슐커피머신 아몬드4.jpg', NULL);
INSERT INTO productFile VALUES (NULL, (SELECT MAX(product_id) FROM product), 'X1 Anniversary 캡슐커피머신 아몬드5.jpg', NULL);