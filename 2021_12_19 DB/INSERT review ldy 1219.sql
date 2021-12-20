-- -------------------------------------------------------------------------------
-- 전제조건 - member_id 가 1,2 를 가지고 있는 두명의 멤버가 있어야 함 
-- cart table이랑 review table 새로 create 할것 
-- 가지고 있는 데이터중 cart_id 가 30 이후로 없어야 함 (그래야 중복되지 않고 생성될수 있음)
-- 리뷰 관련된 부분에만 적용 가능 / 예를 들어 인서트 해도 주문목록에 가면 없음 (payment_id 생성 안해서)
-- 같이 보낸 사진 폴더는 upload/review 폴더 안에 넣어주면 됨 
-- --------------------------------------------------------------------------------

INSERT INTO cart(cart_id,product_id,member_id,cart_state,cart_review_state) VALUES(30,2,1,'done',1);

INSERT INTO cart(cart_id,product_id,member_id,cart_state,cart_review_state) VALUES(31,3,1,'done',1);

INSERT INTO cart(cart_id,product_id,member_id,cart_state,cart_review_state) VALUES(32,4,1,'done',1);

INSERT INTO cart(cart_id,product_id,member_id,cart_state,cart_review_state) VALUES(33,5,1,'done',1);

INSERT INTO cart(cart_id,product_id,member_id,cart_state,cart_review_state) VALUES(34,2,2,'done',1);

INSERT INTO cart(cart_id,product_id,member_id,cart_state,cart_review_state) VALUES(35,2,2,'done',1);

INSERT INTO cart(cart_id,product_id,member_id,cart_state,cart_review_state) VALUES(36,4,2,'done',1);

INSERT INTO cart(cart_id,product_id,member_id,cart_state,cart_review_state) VALUES(37,29,2,'done',1);

INSERT INTO cart(cart_id,product_id,member_id,cart_state,cart_review_state) VALUES(38,1,1,'done',1);

INSERT INTO cart(cart_id,product_id,member_id,cart_state,cart_review_state) VALUES(39,1,1,'done',1);

INSERT INTO cart(cart_id,product_id,member_id,cart_state,cart_review_state) VALUES(40,3,1,'done',1);

INSERT INTO cart(cart_id,product_id,member_id,cart_state,cart_review_state) VALUES(41,2,1,'done',1);

INSERT INTO cart(cart_id,product_id,member_id,cart_state,cart_review_state) VALUES(42,6,2,'done',1);

INSERT INTO cart(cart_id,product_id,member_id,cart_state,cart_review_state) VALUES(43,7,2,'done',1);

INSERT INTO cart(cart_id,product_id,member_id,cart_state,cart_review_state) VALUES(44,2,2,'done',1);

INSERT INTO cart(cart_id,product_id,member_id,cart_state,cart_review_state) VALUES(45,2,2,'done',1); 

INSERT INTO review (review_id,cart_id,review_star,review_title,review_contents,review_regDate)
VALUES(0,30,5,'일리커피가 제일 맛있어요!','캡슐커피 브랜드 중에 일리커피가 가장 맛있는거 같아요! 또 시킬께요!!',sysdate()); 

INSERT INTO review (review_id,cart_id,review_star,review_title,review_contents,review_regDate)
VALUES(0,31,1,'별로에요','어떻게 공식사이트에서 시킨 제품에 하자가 있을수 있죠? 실망이에요',sysdate()); 

INSERT INTO review (review_id,cart_id,review_star,review_title,review_contents,review_regDate)
VALUES(0,32,2,'음...','항상 시켜먹던거 말고 다른거 시켰더니 이번에 막 맛있진 않네요.',sysdate());

INSERT INTO review (review_id,cart_id,review_star,review_title,review_contents,review_regDate)
VALUES(0,33,5,'존맛!','역시 캡슐커피는 일리가 진리',sysdate());

INSERT INTO review (review_id,cart_id,review_star,review_title,review_contents,review_regDate)
VALUES(0,34,3,'쏘쏘','이번엔 그냥 그럭저럭~',sysdate()); 

INSERT INTO review (review_id,cart_id,review_star,review_title,review_contents,review_regDate)
VALUES(0,35,3,'괜찮아요','맛은 좋아요.근데 배송이 늦어서 2점 깎았어요',sysdate()); 

INSERT INTO review (review_id,cart_id,review_star,review_title,review_contents,review_regDate)
VALUES(0,36,4,'마시씀','일리가 가장 커피맛이 진해요',sysdate());

INSERT INTO review (review_id,cart_id,review_star,review_title,review_contents,review_regDate)
VALUES(0,37,5,'오오 신세계','돌체먹어보다가 일리 이번에 사서 먹어봤는데 확실히 맛있네여;; 진작 살껄 .. 너무 앗있어여 ㅠ',sysdate());
 

INSERT INTO review (review_id,cart_id,review_star,review_title,review_contents,review_regDate)
VALUES(0,38,1,'정말 별로','다 찌그러져서 옴; 어이없음;',sysdate()); 

INSERT INTO review (review_id,cart_id,review_star,review_title,review_contents,review_regDate)
VALUES(0,39,5,'맛좋아요','항상 시켜먹어도 맛있음',sysdate()); 

INSERT INTO review (review_id,cart_id,review_star,review_title,review_contents,review_regDate)
VALUES(0,40,1,'배송 좀 신경써주세요','아무리 택배 파업중이라지만 기다리다 목 빠지는줄',sysdate());

INSERT INTO review (review_id,cart_id,review_star,review_title,review_contents,review_regDate)
VALUES(0,41,1,'ㅡㅡ','캡슐이 왜 자꾸 터짐 ㅡㅡ? 불량???',sysdate());

INSERT INTO review (review_id,cart_id,review_star,review_title,review_contents,review_regDate)
VALUES(0,42,4,'좋아요','좋아요.포인트주세요',sysdate()); 

INSERT INTO review (review_id,cart_id,review_star,review_title,review_contents,review_regDate)
VALUES(0,43,2,'그냥그럼','그냥 그래여',sysdate()); 

INSERT INTO review (review_id,cart_id,review_star,review_title,review_contents,review_regDate)
VALUES(0,44,3,'너무비싸여','맛은 좋은데 좀 비쌈',sysdate());

INSERT INTO review (review_id,cart_id,review_star,review_title,review_contents,review_regDate)
VALUES(0,45,5,'돈 안아까운맛!','좀 비싸긴 해도 돈이 아깝지 않은맛이에요!',sysdate()); 


insert into reviewfile(reviewFile_id,review_id,reviewFile_name) values(0,1,'일리머신01.jpg');
insert into reviewfile(reviewFile_id,review_id,reviewFile_name) values(0,1,'일리캡슐01.jpg');

insert into reviewfile(reviewFile_id,review_id,reviewFile_name) values(0,7,'일리머신02.jpg');
insert into reviewfile(reviewFile_id,review_id,reviewFile_name) values(0,9,'일리캡슐03.jpg');

insert into reviewfile(reviewFile_id,review_id,reviewFile_name) values(0,10,'일리머신03.jpg');
insert into reviewfile(reviewFile_id,review_id,reviewFile_name) values(0,11,'일리캡슐04.jpg');

insert into reviewfile(reviewFile_id,review_id,reviewFile_name) values(0,3,'일리머신02.jpg');
insert into reviewfile(reviewFile_id,review_id,reviewFile_name) values(0,3,'일리캡슐04.jpg');

insert into reviewfile(reviewFile_id,review_id,reviewFile_name) values(0,8,'일리머신01.jpg');
insert into reviewfile(reviewFile_id,review_id,reviewFile_name) values(0,8,'일리캡슐06.jpg');

insert into reviewfile(reviewFile_id,review_id,reviewFile_name) values(0,11,'일리머신03.jpg');
insert into reviewfile(reviewFile_id,review_id,reviewFile_name) values(0,11,'일리캡슐07.jpg');

insert into reviewfile(reviewFile_id,review_id,reviewFile_name) values(0,12,'일리머신01.jpg');
insert into reviewfile(reviewFile_id,review_id,reviewFile_name) values(0,12,'일리캡슐06.jpg');

insert into reviewfile(reviewFile_id,review_id,reviewFile_name) values(0,13,'일리머신01.jpg');
insert into reviewfile(reviewFile_id,review_id,reviewFile_name) values(0,14,'일리캡슐05.jpg');



