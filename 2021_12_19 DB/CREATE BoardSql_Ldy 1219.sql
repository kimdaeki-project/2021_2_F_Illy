-- DROP TABLE event;
DROP TABLE notice;
DROP TABLE noticefile;
DROP TABLE qna;
DROP TABLE qnafile;
DROP TABLE faq;
DROP TABLE review;
DROP TABLE reviewfile;

-- --------------------------------
-- 2. create notice Table
-- --------------------------------
CREATE TABLE notice (
  notice_id INT NOT NULL AUTO_INCREMENT,
  notice_title VARCHAR(255),
  notice_contents LONGTEXT,
  notice_regDate DATE,
  notice_type VARCHAR(255),
  notice_hits INT,
  notice_top INT,
  PRIMARY KEY (notice_id)
  );

-- --------------------------------
-- 3. create noticefile Table 
-- --------------------------------
CREATE TABLE noticefile (
  noticeFile_id INT NOT NULL AUTO_INCREMENT,
  noticeFile_name VARCHAR(255),
  noticeFile_oriName VARCHAR(255),
  notice_id INT, -- FK
  PRIMARY KEY (noticeFile_id)
) ;

-- --------------------------------
-- 4. create qna Table 
-- --------------------------------
CREATE TABLE qna (
  qna_id INT NOT NULL AUTO_INCREMENT,
  qna_type VARCHAR(255),
  qna_title VARCHAR(255),
  qna_phone VARCHAR(255),
  qna_contents LONGTEXT,
  qna_regDate DATE,
  qna_state VARCHAR(255),
  qna_answer_regDate DATE,
  qna_answer VARCHAR(255),
  product_id INT, -- FK
  member_id INT, -- FK
  PRIMARY KEY (qna_id)
  );
-- --------------------------------
-- 5. create qnafile Table 
-- --------------------------------
CREATE TABLE qnafile (
  qnaFile_id int NOT NULL AUTO_INCREMENT,
  qnaFile_name VARCHAR(255),
  qnaFile_oriName VARCHAR(255),
  qna_id INT, -- FK
  PRIMARY KEY (qnaFile_id)
) ;
-- --------------------------------
-- 6. create faq Table 
-- --------------------------------
CREATE TABLE faq (
  faq_id INT NOT NULL AUTO_INCREMENT,
  faq_title VARCHAR(255),
  faq_contents LONGTEXT,
  faq_type VARCHAR(255),
  faq_type_code VARCHAR(255),
  PRIMARY KEY (faq_id)
  );
-- --------------------------------
-- 7. create review Table 
-- --------------------------------
CREATE TABLE review (
review_id INT NOT NULL AUTO_INCREMENT,
review_star INT,
review_title VARCHAR(255),
review_contents LONGTEXT,
cart_id INT,  -- FK
review_regDate DATE,
PRIMARY KEY (review_id)
);
-- --------------------------------
-- 8. create reviewfile Table 
-- --------------------------------
CREATE TABLE reviewfile (
  reviewFile_id INT NOT NULL AUTO_INCREMENT,
  reviewFile_name VARCHAR(255),
  reviewFile_oriName VARCHAR(255),
  review_id INT, -- FK
  PRIMARY KEY (reviewFile_id)
);

