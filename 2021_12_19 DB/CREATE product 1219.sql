DROP TABLE machine;
DROP TABLE coffee;
DROP TABLE productFile;
DROP TABLE product;

/**************************************************
* CREATE product
**************************************************/
CREATE TABLE product (
	product_id					INT AUTO_INCREMENT
    ,product_name				VARCHAR(255)
    ,product_price				INT
    ,product_detail				LONGTEXT
    ,product_categoryCode		VARCHAR(255)
-- Category code
-- 	커피 001/ 머신 002
-- 	001001 캡슐커피
-- 	001002 원두커피
-- 	001003 분쇄커피
-- 	001004 스틱원두커피
    ,product_regDate			DATE
    ,product_manufacturer		VARCHAR(255) -- 제조사
    ,product_origin				VARCHAR(255) -- 원산지/제조국
    ,product_importer			VARCHAR(255) -- 수입판매원
    ,product_state				VARCHAR(255) -- sale, suspended, soldOut
    
    ,PRIMARY KEY (product_id)
);

/**************************************************
* CREATE productFile
**************************************************/
CREATE TABLE productFile (
	productFile_id				INT AUTO_INCREMENT
    ,product_id					INT
    ,productFile_name			VARCHAR(255)
    ,productFile_oriName		VARCHAR(255)
    
    ,PRIMARY KEY (productFile_id)
);

/**************************************************
* CREATE coffee
**************************************************/
CREATE TABLE coffee (
	product_id				INT
    ,coffee_material		VARCHAR(255) -- 원재료명 및 함량
    ,coffee_capacity		VARCHAR(255) -- 용량
    ,coffee_caffeine		DOUBLE -- 카페인함량(%)
    
    ,PRIMARY KEY (product_id)
    ,FOREIGN KEY (product_id) REFERENCES product (product_id)
);

/**************************************************
* CREATE machine
**************************************************/
CREATE TABLE machine (
	product_id						INT
    ,machine_material				VARCHAR(255) -- 소재
    ,machine_pump					INT -- 펌프(bar)
    ,machine_size					VARCHAR(255) -- 사이즈(W*D*H)
    ,machine_weight					DOUBLE -- 무게(kg)
    ,machine_capacity				DOUBLE -- 물탱크 용량(L)
    ,machine_powerV					INT -- 정격전압(V)
    ,machine_powerHz				INT -- 정격전압(Hz)
    ,machine_powerConsumption		INT -- 소비전력(W)
    ,machine_safetyInfo				VARCHAR(255) -- KC안전인증정보
    
    ,PRIMARY KEY (product_id)
    ,FOREIGN KEY (product_id) REFERENCES product (product_id)
);
