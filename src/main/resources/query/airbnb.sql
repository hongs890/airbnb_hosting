-- houses
CREATE TABLE houses (
   house_seq    INT          NOT NULL, -- house_seq
   room_type    VARCHAR(10)  NOT NULL, -- room_type
   guest_cnt    INT          NOT NULL, -- guest_cnt
   bed_cnt      INT          NULL,     -- bed_cnt
   bathroom_cnt INT          NULL,     -- bathroom_cnt
   picture      VARCHAR(40)  NULL,     -- picture
   explaination TEXT         NULL,     -- explaination
   title        VARCHAR(50)  NULL,     -- title
   other_rule   VARCHAR(100) NULL,     -- other_rule
   checkin_term INT          NULL,     -- checkin_term
   checkin_time VARCHAR(15)  NULL,     -- checkin_time
   period       DATE         NULL,     -- period
   min_nights   INT          NULL,     -- min_nights
   max_nights   INT          NULL,     -- max_nights
   price        INT          NULL,     -- price
   reg_date     DATE         NULL,     -- reg_date
   rules        VARCHAR(20)  NULL,     -- rules
   convenience  VARCHAR(20)  NULL,     -- convenience
   safety_fac   VARCHAR(20)  NULL,     -- safety_fac
   space        VARCHAR(20)  NULL,     -- space
   email        VARCHAR(30)  NOT NULL, -- email
   building_seq INT          NULL      -- building_seq
);

-- houses
ALTER TABLE houses
   ADD CONSTRAINT PK_houses -- houses 기본키
      PRIMARY KEY (
         house_seq -- house_seq
      );

ALTER TABLE houses
   MODIFY COLUMN house_seq INT NOT NULL AUTO_INCREMENT;

-- address
CREATE TABLE address (
   address_seq INT          NOT NULL, -- address_seq
   country     VARCHAR(20)  NULL,     -- country
   state       VARCHAR(50)  NULL,     -- state
   city        VARCHAR(50)  NULL,     -- city
   street      VARCHAR(100) NULL,     -- street
   optional    VARCHAR(100) NULL,     -- optional
   zip_code    VARCHAR(15)  NULL,     -- zip_code
   latitude    VARCHAR(20)  NULL,     -- latitude
   longitude   VARCHAR(20)  NULL,     -- longitude
   house_seq   INT          NULL      -- house_seq
);

-- address
ALTER TABLE address
   ADD CONSTRAINT PK_address -- address 기본키
      PRIMARY KEY (
         address_seq -- address_seq
      );

ALTER TABLE address
   MODIFY COLUMN address_seq INT NOT NULL AUTO_INCREMENT;

-- building
CREATE TABLE building (
   building_seq INT         NOT NULL, -- building_seq
   type         VARCHAR(20) NULL      -- type
);

-- building
ALTER TABLE building
   ADD CONSTRAINT PK_building -- building 기본키
      PRIMARY KEY (
         building_seq -- building_seq
      );

ALTER TABLE building
   MODIFY COLUMN building_seq INT NOT NULL AUTO_INCREMENT;

-- block
CREATE TABLE block (
   block_seq  INT  NOT NULL, -- block_seq
   block_date DATE NULL,     -- block_date
   house_seq  INT  NULL      -- house_seq
);

-- block
ALTER TABLE block
   ADD CONSTRAINT PK_block -- block 기본키
      PRIMARY KEY (
         block_seq -- block_seq
      );

ALTER TABLE block
   MODIFY COLUMN block_seq INT NOT NULL AUTO_INCREMENT;

-- reservation
CREATE TABLE reservation (
   resv_seq      INT         NOT NULL, -- resv_seq
   checkin_date  DATE        NOT NULL, -- checkin_date
   checkout_date DATE        NOT NULL, -- checkout_date
   guest_cnt     INT         NOT NULL, -- guest_cnt
   house_seq     INT         NULL,     -- house_seq
   email         VARCHAR(30) NULL      -- email
);

-- reservation
ALTER TABLE reservation
   ADD CONSTRAINT PK_reservation -- reservation 기본키
      PRIMARY KEY (
         resv_seq -- resv_seq
      );

ALTER TABLE reservation
   MODIFY COLUMN resv_seq INT NOT NULL AUTO_INCREMENT;

-- payment
CREATE TABLE payment (
   payment_seq  INT  NOT NULL, -- payment_seq
   card_num     INT  NOT NULL, -- card_num
   price        INT  NOT NULL, -- price
   payment_date DATE NOT NULL, -- payment_date
   resv_seq     INT  NOT NULL  -- resv_seq
);

-- payment
ALTER TABLE payment
   ADD CONSTRAINT PK_payment -- payment 기본키
      PRIMARY KEY (
         payment_seq -- payment_seq
      );

ALTER TABLE payment
   MODIFY COLUMN payment_seq INT NOT NULL AUTO_INCREMENT;

-- Guide_Major
CREATE TABLE Guide_Major (
   Guide_seq      INT         NOT NULL, -- Guide_seq
   Place          VARCHAR(15) NULL,     -- Place
   Major_Category VARCHAR(15) NULL,     -- Major_Category
   email          VARCHAR(30) NOT NULL  -- email
);

-- Guide_Major
ALTER TABLE Guide_Major
   ADD CONSTRAINT PK_Guide_Major -- Guide_Major 기본키
      PRIMARY KEY (
         Guide_seq -- Guide_seq
      );

ALTER TABLE Guide_Major
   MODIFY COLUMN Guide_seq INT NOT NULL AUTO_INCREMENT;

-- Guide_Minor
CREATE TABLE Guide_Minor (
   Minor_seq      INT          NOT NULL, -- Minor_seq
   Minor_category VARCHAR(15)  NOT NULL, -- Minor_Category
   Host_Comment   VARCHAR(150) NULL,     -- Host_Comment
   Guide_seq      INT          NOT NULL  -- Guide_seq
);

-- Guide_Minor
ALTER TABLE Guide_Minor
   ADD CONSTRAINT PK_Guide_Minor -- Guide_Minor 기본키
      PRIMARY KEY (
         Minor_seq -- Minor_seq
      );

ALTER TABLE Guide_Minor
   MODIFY COLUMN Minor_seq INT NOT NULL AUTO_INCREMENT;

-- member
CREATE TABLE member (
   email      VARCHAR(30) NOT NULL, -- email
   pw         VARCHAR(20) NOT NULL, -- pw
   name       VARCHAR(10) NOT NULL, -- name
   phone      VARCHAR(15) NOT NULL, -- phone
   profileImg VARCHAR(20) NULL,     -- profileImg
   reg_date   DATE        NULL      -- reg_date
);

-- member
ALTER TABLE member
   ADD CONSTRAINT PK_member -- member 기본키
      PRIMARY KEY (
         email -- email
      );

-- houses
ALTER TABLE houses
   ADD CONSTRAINT FK_member_TO_houses -- member -> houses
      FOREIGN KEY (
         email -- email
      )
      REFERENCES member ( -- member
         email -- email
      )
      ON DELETE CASCADE;

-- houses
ALTER TABLE houses
   ADD CONSTRAINT FK_building_TO_houses -- building -> houses
      FOREIGN KEY (
         building_seq -- building_seq
      )
      REFERENCES building ( -- building
         building_seq -- building_seq
      )
      ON DELETE CASCADE;

-- address
ALTER TABLE address
   ADD CONSTRAINT FK_houses_TO_address -- houses -> address
      FOREIGN KEY (
         house_seq -- house_seq
      )
      REFERENCES houses ( -- houses
         house_seq -- house_seq
      );

-- block
ALTER TABLE block
   ADD CONSTRAINT FK_houses_TO_block -- houses -> block
      FOREIGN KEY (
         house_seq -- house_seq
      )
      REFERENCES houses ( -- houses
         house_seq -- house_seq
      );

-- reservation
ALTER TABLE reservation
   ADD CONSTRAINT FK_houses_TO_reservation -- houses -> reservation
      FOREIGN KEY (
         house_seq -- house_seq
      )
      REFERENCES houses ( -- houses
         house_seq -- house_seq
      )
      ON DELETE SET NULL;

-- reservation
ALTER TABLE reservation
   ADD CONSTRAINT FK_member_TO_reservation -- member -> reservation
      FOREIGN KEY (
         email -- email
      )
      REFERENCES member ( -- member
         email -- email
      )
      ON DELETE SET NULL;

-- payment
ALTER TABLE payment
   ADD CONSTRAINT FK_reservation_TO_payment -- reservation -> payment
      FOREIGN KEY (
         resv_seq -- resv_seq
      )
      REFERENCES reservation ( -- reservation
         resv_seq -- resv_seq
      )
      ON DELETE CASCADE;

-- Guide_Major
ALTER TABLE Guide_Major
   ADD CONSTRAINT FK_member_TO_Guide_Major -- member -> Guide_Major
      FOREIGN KEY (
         email -- email
      )
      REFERENCES member ( -- member
         email -- email
      );

-- Guide_Minor
ALTER TABLE Guide_Minor
   ADD CONSTRAINT FK_Guide_Major_TO_Guide_Minor -- Guide_Major -> Guide_Minor
      FOREIGN KEY (
         Guide_seq -- Guide_seq
      )
      REFERENCES Guide_Major ( -- Guide_Major
         Guide_seq -- Guide_seq
      )
      ON DELETE CASCADE;
      

----------------------------- CRUD
--C
-- BUILDING TYPE 정의
INSERT INTO BUILDING (TYPE) VALUES('아파트'); 
INSERT INTO BUILDING (TYPE) VALUES('단독주택'); 
INSERT INTO BUILDING (TYPE) VALUES('게스트하우스'); 
INSERT INTO BUILDING (TYPE) VALUES('층 전체'); 
INSERT INTO BUILDING (TYPE) VALUES('B&B'); 
INSERT INTO BUILDING (TYPE) VALUES('아파트(콘도미니엄)'); 
INSERT INTO BUILDING (TYPE) VALUES('통나무집'); 
INSERT INTO BUILDING (TYPE) VALUES('별장/타운하우스'); 
INSERT INTO BUILDING (TYPE) VALUES('로프트'); 
INSERT INTO BUILDING (TYPE) VALUES('타운하우스'); 
INSERT INTO BUILDING (TYPE) VALUES('방갈로'); 
INSERT INTO BUILDING (TYPE) VALUES('성'); 
INSERT INTO BUILDING (TYPE) VALUES('기숙사'); 
INSERT INTO BUILDING (TYPE) VALUES('트리하우스'); 
INSERT INTO BUILDING (TYPE) VALUES('배'); 
INSERT INTO BUILDING (TYPE) VALUES('비행기'); 
INSERT INTO BUILDING (TYPE) VALUES('캠핑카'); 
INSERT INTO BUILDING (TYPE) VALUES('이글루'); 
INSERT INTO BUILDING (TYPE) VALUES('등대'); 
INSERT INTO BUILDING (TYPE) VALUES('유르트(Yurt)'); 
INSERT INTO BUILDING (TYPE) VALUES('티피(Tipi)'); 
INSERT INTO BUILDING (TYPE) VALUES('동굴'); 
INSERT INTO BUILDING (TYPE) VALUES('섬'); 
INSERT INTO BUILDING (TYPE) VALUES('샬레(Chalet)'); 
INSERT INTO BUILDING (TYPE) VALUES('흙집'); 
INSERT INTO BUILDING (TYPE) VALUES('오두막'); 
INSERT INTO BUILDING (TYPE) VALUES('기차'); 
INSERT INTO BUILDING (TYPE) VALUES('텐트'); 
INSERT INTO BUILDING (TYPE) VALUES('기타'); 
-- MEMBER 가입 
INSERT INTO MEMBER (EMAIL,PW,NAME,PHONE,PROFILEIMG,REG_DATE) VALUES('hongs890@gmail.com','1','배근홍','010-7143-0222','default.jpg','2016-10-06');
INSERT INTO HOUSES (ROOM_TYPE, GUEST_CNT, EMAIL, REG_DATE, BUILDING_SEQ) VALUES('개인실',3,'hongs890@gmail.com','2016-10-06',2); 
INSERT INTO ADDRESS (COUNTRY, STATE, CITY, STREET, OPTIONAL, ZIP_CODE, HOUSE_SEQ) VALUES ('한국','서울특별시','강남구','언주로406','35동 4층 407호','135-919', 2);
INSERT INTO ADDRESS (COUNTRY, STATE, CITY, STREET, OPTIONAL, ZIP_CODE, HOUSE_SEQ) VALUES ('한국','서울특별시','강남구','언주로406','35동 4층 407호','135-919', 2);
INSERT INTO ADDRESS (COUNTRY, STATE, CITY, STREET, OPTIONAL, ZIP_CODE, HOUSE_SEQ) VALUES ('한국','서울특별시','강남구','언주로406','35동 4층 407호','135-919', 2);
INSERT INTO ADDRESS (COUNTRY, STATE, CITY, STREET, OPTIONAL, ZIP_CODE, HOUSE_SEQ) VALUES ('한국','서울특별시','강남구','언주로406','35동 4층 407호','135-919', 2);
DELETE FROM HOUSES WHERE HOUSE_SEQ = 1;
DELETE FROM ADDRESS WHERE ADDRESS_SEQ = 1;
DELETE FROM ADDRESS WHERE ADDRESS_SEQ = 2;
DELETE FROM ADDRESS WHERE ADDRESS_SEQ = 3;
DELETE FROM ADDRESS WHERE ADDRESS_SEQ = 4;
------------------------ 1번째 호스팅
-- HOSTING 첫 번째 화면
INSERT INTO HOUSES (ROOM_TYPE, GUEST_CNT, EMAIL, REG_DATE, BUILDING_SEQ) VALUES('개인실',3,'hongs890@gmail.com','2016-10-06',2); 
-- HOSTING 두 번째 화면
UPDATE HOUSES SET BED_CNT = 2, BATHROOM_CNT = 2 WHERE HOUSE_SEQ = 2;
-- HOSTING 세 번째 화면
INSERT INTO ADDRESS (COUNTRY, STATE, CITY, STREET, OPTIONAL, ZIP_CODE, HOUSE_SEQ) VALUES ('한국','서울특별시','강남구','언주로406','35동 4층 407호','135-919', 2);
-- HOSTING 네 번째 화면
UPDATE ADDRESS SET LATITUDE = '124.12351', LONGITUDE = '125.52541' WHERE ADDRESS_SEQ = 5;
-- HOSTING 다섯 번째 화면 (편의시설 총 13종)
UPDATE HOUSES SET CONVENIENCE = 'T-F-T-F-F-F-T-F-T-F-F-T-F' WHERE HOUSE_SEQ = 2;
-- HOSTING 여섯 번째 화면 (안전시설 총 6종) 
UPDATE HOUSES SET SAFETY_FAC = 'T-T-T-T-F-F' WHERE HOUSE_SEQ = 2;
-- HOSTING 일곱 번째 화면 (공간제공 총 8종) 
UPDATE HOUSES SET SPACE = 'T-T-T-T-F-F-T-T' WHERE HOUSE_SEQ = 2;
-- HOSTING 여덟 번째 화면
UPDATE HOUSES SET PICTURE = 'default.jpg' WHERE HOUSE_SEQ = 2;
-- HOSTING 아홉 번째 화면
UPDATE HOUSES SET EXPLAINATION = '좋은 집' WHERE HOUSE_SEQ = 2;
-- HOSTING 열 번째 화면
UPDATE HOUSES SET TITLE = '오세요' WHERE HOUSE_SEQ = 2;
-- HOSTING 열한 번째 화면 (이용규칙 총 5종)
UPDATE HOUSES SET RULES = 'T-F-T-F-T', OTHER_RULE='고양이 금지' WHERE HOUSE_SEQ = 2;
-- HOSTING 열두 번째 화면
UPDATE HOUSES SET CHECKIN_TERM = 2, CHECKIN_TIME = '15:00' WHERE HOUSE_SEQ = 2;
-- HOSTING 열세 번째 화면
UPDATE HOUSES SET PERIOD ='2016-11-01' WHERE HOUSE_SEQ = 2;
-- HOSTING 열네 번째 화면
UPDATE HOUSES SET MIN_NIGHTS = 2, MAX_NIGHTS =3 WHERE HOUSE_SEQ = 2;
-- HOSTING 열다섯 번째 화면
UPDATE HOUSES SET PRICE = 50000 WHERE HOUSE_SEQ = 2;
------------------------ 2번째 호스팅
INSERT INTO HOUSES (ROOM_TYPE, GUEST_CNT, EMAIL, REG_DATE, BUILDING_SEQ) VALUES('개인실',3,'choi1@gmail.com','2016-10-06',2); 
UPDATE HOUSES SET BED_CNT = 3, BATHROOM_CNT = 4 WHERE HOUSE_SEQ = 3;
INSERT INTO ADDRESS (COUNTRY, STATE, CITY, STREET, OPTIONAL, ZIP_CODE, HOUSE_SEQ) VALUES ('한국','서울특별시','중랑구','봉화산로','2동 1호','123-456', 3);
UPDATE ADDRESS SET LATITUDE = '111.12351', LONGITUDE = '152.21541' WHERE ADDRESS_SEQ = 6;
UPDATE HOUSES SET CONVENIENCE = 'T-F-T-F-F-F-T-F-T-F-F-T-F' WHERE HOUSE_SEQ = 3;
UPDATE HOUSES SET SAFETY_FAC = 'T-T-T-T-T-T' WHERE HOUSE_SEQ = 3;
UPDATE HOUSES SET SPACE = 'T-T-T-T-F-F-T-F' WHERE HOUSE_SEQ = 3;
UPDATE HOUSES SET PICTURE = 'default.jpg' WHERE HOUSE_SEQ = 3;
UPDATE HOUSES SET EXPLAINATION = '멋진 집' WHERE HOUSE_SEQ = 3;
UPDATE HOUSES SET TITLE = '놀러오세요' WHERE HOUSE_SEQ = 3;
UPDATE HOUSES SET RULES = 'T-F-T-F-F', OTHER_RULE='강아지 금지' WHERE HOUSE_SEQ = 3;
UPDATE HOUSES SET CHECKIN_TERM = 1, CHECKIN_TIME = '14:00' WHERE HOUSE_SEQ = 3;
UPDATE HOUSES SET PERIOD ='2016-11-02' WHERE HOUSE_SEQ = 3;
UPDATE HOUSES SET MIN_NIGHTS = 3, MAX_NIGHTS = 4 WHERE HOUSE_SEQ = 3;
UPDATE HOUSES SET PRICE = 40000 WHERE HOUSE_SEQ = 3;
------------------------ 3번째 호스팅
INSERT INTO HOUSES (ROOM_TYPE, GUEST_CNT, EMAIL, REG_DATE, BUILDING_SEQ) VALUES('다인실',2,'choi2@gmail.com','2016-10-06',5); 
UPDATE HOUSES SET BED_CNT = 1, BATHROOM_CNT = 5 WHERE HOUSE_SEQ = 4;
INSERT INTO ADDRESS (COUNTRY, STATE, CITY, STREET, OPTIONAL, ZIP_CODE, HOUSE_SEQ) VALUES ('미국','워싱턴','조지부시','런던','2동 1호','555-111', 4);
UPDATE ADDRESS SET LATITUDE = '222.12351', LONGITUDE = '333.21541' WHERE ADDRESS_SEQ = 7;
UPDATE HOUSES SET CONVENIENCE = 'T-F-T-F-F-F-T-F-T-F-T-F-T' WHERE HOUSE_SEQ = 4;
UPDATE HOUSES SET SAFETY_FAC = 'F-F-T-T-T-T' WHERE HOUSE_SEQ = 4;
UPDATE HOUSES SET SPACE = 'T-T-T-T-F-F-F-T' WHERE HOUSE_SEQ = 4;
UPDATE HOUSES SET PICTURE = 'default.jpg' WHERE HOUSE_SEQ = 4;
UPDATE HOUSES SET EXPLAINATION = '우리 집' WHERE HOUSE_SEQ = 4;
UPDATE HOUSES SET TITLE = '이리오세요' WHERE HOUSE_SEQ = 4;
UPDATE HOUSES SET RULES = 'T-F-T-F-F', OTHER_RULE='음주 금지' WHERE HOUSE_SEQ = 4;
UPDATE HOUSES SET CHECKIN_TERM = 4, CHECKIN_TIME = '11:00' WHERE HOUSE_SEQ = 4;
UPDATE HOUSES SET PERIOD ='2016-11-03' WHERE HOUSE_SEQ = 4;
UPDATE HOUSES SET MIN_NIGHTS = 1, MAX_NIGHTS = 4 WHERE HOUSE_SEQ = 4;
UPDATE HOUSES SET PRICE = 30000 WHERE HOUSE_SEQ = 4;
------------------------ 4번째 호스팅
INSERT INTO HOUSES (ROOM_TYPE, GUEST_CNT, EMAIL, REG_DATE, BUILDING_SEQ) VALUES('개인실',3,'choi3@gmail.com','2016-10-07',4); 
UPDATE HOUSES SET BED_CNT = 2, BATHROOM_CNT = 4 WHERE HOUSE_SEQ = 5;
INSERT INTO ADDRESS (COUNTRY, STATE, CITY, STREET, OPTIONAL, ZIP_CODE, HOUSE_SEQ) VALUES ('런던','브리티쉬','스트릿','빅밴','5동 5호','1234-5678', 5);
UPDATE ADDRESS SET LATITUDE = '125.12351', LONGITUDE = '523.21541' WHERE ADDRESS_SEQ = 8;
UPDATE HOUSES SET CONVENIENCE = 'T-F-T-F-F-F-T-T-F-T-F-T-T' WHERE HOUSE_SEQ = 5;
UPDATE HOUSES SET SAFETY_FAC = 'T-F-F-F-T-T' WHERE HOUSE_SEQ = 5;
UPDATE HOUSES SET SPACE = 'T-T-T-F-F-T-T-T' WHERE HOUSE_SEQ = 5;
UPDATE HOUSES SET PICTURE = 'default.jpg' WHERE HOUSE_SEQ = 5;
UPDATE HOUSES SET EXPLAINATION = 'Guest House' WHERE HOUSE_SEQ = 5;
UPDATE HOUSES SET TITLE = 'Good' WHERE HOUSE_SEQ = 5;
UPDATE HOUSES SET RULES = 'T-F-T-F-F', OTHER_RULE='Make Friend' WHERE HOUSE_SEQ = 5;
UPDATE HOUSES SET CHECKIN_TERM = 2, CHECKIN_TIME = '10:00' WHERE HOUSE_SEQ = 5;
UPDATE HOUSES SET PERIOD ='2016-11-04' WHERE HOUSE_SEQ = 5;
UPDATE HOUSES SET MIN_NIGHTS = 2, MAX_NIGHTS = 4 WHERE HOUSE_SEQ = 5;
UPDATE HOUSES SET PRICE = 20000 WHERE HOUSE_SEQ = 5;
------------------------ 5번째 호스팅
INSERT INTO HOUSES (ROOM_TYPE, GUEST_CNT, EMAIL, REG_DATE, BUILDING_SEQ) VALUES('다인실',1,'choi4@gmail.com','2016-09-07',4); 
UPDATE HOUSES SET BED_CNT = 1, BATHROOM_CNT = 3 WHERE HOUSE_SEQ = 6;
INSERT INTO ADDRESS (COUNTRY, STATE, CITY, STREET, OPTIONAL, ZIP_CODE, HOUSE_SEQ) VALUES ('호주','마오쩌둥','클린턴','아일랜드','2동 1호','555-222', 6);
UPDATE ADDRESS SET LATITUDE = '80.12351', LONGITUDE = '7.21541' WHERE ADDRESS_SEQ = 9;
UPDATE HOUSES SET CONVENIENCE = 'T-F-T-F-F-F-T-T-F-T-F-T-F' WHERE HOUSE_SEQ = 6;
UPDATE HOUSES SET SAFETY_FAC = 'T-F-F-F-F-T' WHERE HOUSE_SEQ = 6;
UPDATE HOUSES SET SPACE = 'T-T-T-F-F-T-T-F' WHERE HOUSE_SEQ = 6;
UPDATE HOUSES SET PICTURE = 'default.jpg' WHERE HOUSE_SEQ = 6;
UPDATE HOUSES SET EXPLAINATION = 'Aus' WHERE HOUSE_SEQ = 6;
UPDATE HOUSES SET TITLE = 'Beautiful' WHERE HOUSE_SEQ = 6;
UPDATE HOUSES SET RULES = 'T-F-T-F-T', OTHER_RULE='Dont smoke' WHERE HOUSE_SEQ = 6;
UPDATE HOUSES SET CHECKIN_TERM = 2, CHECKIN_TIME = '16:00' WHERE HOUSE_SEQ = 6;
UPDATE HOUSES SET PERIOD ='2016-11-06' WHERE HOUSE_SEQ = 6;
UPDATE HOUSES SET MIN_NIGHTS = 3, MAX_NIGHTS = 4 WHERE HOUSE_SEQ = 6;
UPDATE HOUSES SET PRICE = 22000 WHERE HOUSE_SEQ = 6;
------------------------ 6번째 호스팅
INSERT INTO HOUSES (ROOM_TYPE, GUEST_CNT, EMAIL, REG_DATE, BUILDING_SEQ) VALUES('개인실',6,'choi5@gmail.com','2016-10-07',10); 
UPDATE HOUSES SET BED_CNT = 2, BATHROOM_CNT = 1 WHERE HOUSE_SEQ = 7;
INSERT INTO ADDRESS (COUNTRY, STATE, CITY, STREET, OPTIONAL, ZIP_CODE, HOUSE_SEQ) VALUES ('뉴질랜드','호주','미국','영국','3동 1호','444-222', 7);
UPDATE ADDRESS SET LATITUDE = '2.12351', LONGITUDE = '123.21541' WHERE ADDRESS_SEQ = 10;
UPDATE HOUSES SET CONVENIENCE = 'T-F-T-F-F-F-T-T-F-T-F-T-T' WHERE HOUSE_SEQ = 7;
UPDATE HOUSES SET SAFETY_FAC = 'T-F-F-F-F-F' WHERE HOUSE_SEQ = 7;
UPDATE HOUSES SET SPACE = 'T-T-T-F-F-T-T-F' WHERE HOUSE_SEQ = 7;
UPDATE HOUSES SET PICTURE = 'default.jpg' WHERE HOUSE_SEQ = 7;
UPDATE HOUSES SET EXPLAINATION = 'New' WHERE HOUSE_SEQ = 7;
UPDATE HOUSES SET TITLE = 'Power' WHERE HOUSE_SEQ = 7;
UPDATE HOUSES SET RULES = 'T-F-T-F-T', OTHER_RULE='Hello' WHERE HOUSE_SEQ = 7;
UPDATE HOUSES SET CHECKIN_TERM = 3, CHECKIN_TIME = '17:00' WHERE HOUSE_SEQ = 7;
UPDATE HOUSES SET PERIOD ='2016-11-07' WHERE HOUSE_SEQ = 7;
UPDATE HOUSES SET MIN_NIGHTS = 4, MAX_NIGHTS = 5 WHERE HOUSE_SEQ = 7;
UPDATE HOUSES SET PRICE = 25000 WHERE HOUSE_SEQ = 7;
------------------------ 7번째 호스팅
INSERT INTO HOUSES (ROOM_TYPE, GUEST_CNT, EMAIL, REG_DATE, BUILDING_SEQ) VALUES('다인실',2,'choi6@gmail.com','2016-10-08',11); 
UPDATE HOUSES SET BED_CNT = 3, BATHROOM_CNT = 4 WHERE HOUSE_SEQ = 8;
INSERT INTO ADDRESS (COUNTRY, STATE, CITY, STREET, OPTIONAL, ZIP_CODE, HOUSE_SEQ) VALUES ('아프리카','아마존','브라질','메시','2동 1호','333-222', 8);
UPDATE ADDRESS SET LATITUDE = '20.12351', LONGITUDE = '44.21541' WHERE ADDRESS_SEQ = 11;
UPDATE HOUSES SET CONVENIENCE = 'T-T-F-T-F-F-T-T-F-T-F-T-T' WHERE HOUSE_SEQ = 8;
UPDATE HOUSES SET SAFETY_FAC = 'T-F-F-F-T-F' WHERE HOUSE_SEQ = 8;
UPDATE HOUSES SET SPACE = 'T-T-T-F-F-T-F-F' WHERE HOUSE_SEQ = 8;
UPDATE HOUSES SET PICTURE = 'default.jpg' WHERE HOUSE_SEQ = 8;
UPDATE HOUSES SET EXPLAINATION = 'Afreeca' WHERE HOUSE_SEQ = 8;
UPDATE HOUSES SET TITLE = 'Black' WHERE HOUSE_SEQ = 8;
UPDATE HOUSES SET RULES = 'T-F-T-F-F', OTHER_RULE='Hi' WHERE HOUSE_SEQ = 8;
UPDATE HOUSES SET CHECKIN_TERM = 2, CHECKIN_TIME = '15:00' WHERE HOUSE_SEQ = 8;
UPDATE HOUSES SET PERIOD ='2016-11-08' WHERE HOUSE_SEQ = 8;
UPDATE HOUSES SET MIN_NIGHTS = 5, MAX_NIGHTS = 6 WHERE HOUSE_SEQ = 8;
UPDATE HOUSES SET PRICE = 28000 WHERE HOUSE_SEQ = 8;
------------------------ 8번째 호스팅
INSERT INTO HOUSES (ROOM_TYPE, GUEST_CNT, EMAIL, REG_DATE, BUILDING_SEQ) VALUES('개인실',3,'choi7@gmail.com','2016-10-10',10); 
UPDATE HOUSES SET BED_CNT = 2, BATHROOM_CNT = 6 WHERE HOUSE_SEQ = 9;
INSERT INTO ADDRESS (COUNTRY, STATE, CITY, STREET, OPTIONAL, ZIP_CODE, HOUSE_SEQ) VALUES ('프랑스','파리','마드리드','바르셀로나','5동 5호','332-222', 9);
UPDATE ADDRESS SET LATITUDE = '50.12351', LONGITUDE = '7.21541' WHERE ADDRESS_SEQ = 12;
UPDATE HOUSES SET CONVENIENCE = 'T-T-F-T-F-F-T-T-F-T-F-T-F' WHERE HOUSE_SEQ = 9;
UPDATE HOUSES SET SAFETY_FAC = 'T-F-F-F-T-T' WHERE HOUSE_SEQ = 9;
UPDATE HOUSES SET SPACE = 'T-T-T-F-F-T-F-T' WHERE HOUSE_SEQ = 9;
UPDATE HOUSES SET PICTURE = 'default.jpg' WHERE HOUSE_SEQ = 9;
UPDATE HOUSES SET EXPLAINATION = 'Franch' WHERE HOUSE_SEQ = 9;
UPDATE HOUSES SET TITLE = 'Come on' WHERE HOUSE_SEQ = 9;
UPDATE HOUSES SET RULES = 'T-F-T-F-F', OTHER_RULE='푸아그라' WHERE HOUSE_SEQ = 9;
UPDATE HOUSES SET CHECKIN_TERM = 2, CHECKIN_TIME = '12:00' WHERE HOUSE_SEQ = 9;
UPDATE HOUSES SET PERIOD ='2016-11-09' WHERE HOUSE_SEQ = 9;
UPDATE HOUSES SET MIN_NIGHTS = 2, MAX_NIGHTS = 3 WHERE HOUSE_SEQ = 9;
UPDATE HOUSES SET PRICE = 100000 WHERE HOUSE_SEQ = 9;


--U
-- HOST 관리 : 달력
INSERT INTO BLOCK (BLOCK_DATE, HOUSE_SEQ) VALUES ('2016-10-07',2);
-- HOST 관리 : 요금 설정
UPDATE HOUSES SET PRICE = 40000 WHERE HOUSE_SEQ = 2;
-- HOST 관리 : 예약
UPDATE HOUSES SET RULES = 'T-F-T-F-T', OTHER_RULE='고양이 금지' WHERE HOUSE_SEQ = 2;
-- HOST 관리 : 체크인
UPDATE HOUSES SET CHECKIN_TIME = '14:00' WHERE HOUSE_SEQ = 2;
-- HOST 관리 : 기본 설정
UPDATE HOUSES SET ROOM_TYPE = '다인실', BUILDING_SEQ = 3, GUEST_CNT = 3, BED_CNT = 2, BATHROOM_CNT = 2 WHERE HOUSE_SEQ = 2;
-- HOST 관리 : 설명
UPDATE HOUSES SET EXPLAINATION ='좋은 집2', TITLE = '오세요2' WHERE HOUSE_SEQ = 2;
-- HOST 관리 : 위치
UPDATE ADDRESS SET LATITUDE = '124.12351', LONGITUDE = '125.52541' WHERE ADDRESS_SEQ = 5;
-- HOST 관리 : 편의 시설
UPDATE HOUSES SET CONVENIENCE = 'T-F-T-F-F-F-T-F-T-F-F-T-T' WHERE HOUSE_SEQ = 2;
-- HOST 관리 : 사진
UPDATE HOUSES SET PICTURE = 'default2.jpg' WHERE HOUSE_SEQ = 2;