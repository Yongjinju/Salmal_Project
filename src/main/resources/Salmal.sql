-- MEMBER

/* 회원 */
DROP TABLE MEMBER 
	CASCADE CONSTRAINTS;
/* 회원 */
CREATE TABLE MEMBER (
	memberNum NUMBER NOT NULL, /* 회원번호 */
	email VARCHAR2(50) NOT NULL, /* 메일 */
	nickname VARCHAR2(30) NOT NULL, /* 닉네임 */
	password VARCHAR2(20) NOT NULL, /* 비밀번호 */
	gender VARCHAR2(2) NOT NULL, /* 성별 */
	birth DATE NOT NULL, /* 생년월일 */
	joinDate DATE NOT NULL /* 회원가입일 */
);
ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER
		PRIMARY KEY (
			memberNum
		);
drop sequence member_seq;
create sequence member_seq
       start with 1
       increment by 1
       nocycle
       nocache;		
		
       
-- CATEGORY

/* 카테고리 */
DROP TABLE CATEGORY 
	CASCADE CONSTRAINTS;
/* 카테고리 */
CREATE TABLE CATEGORY (
	categoryNum NUMBER NOT NULL, /* 카테고리번호 */
	categoryName VARCHAR2(20) NOT NULL /* 카테고리이름 */
);
ALTER TABLE CATEGORY
	ADD
		CONSTRAINT PK_CATEGORY
		PRIMARY KEY (
			categoryNum
		);
drop sequence category_seq;
create sequence category_seq
       start with 1
       increment by 1
       nocycle
       nocache;

       
-- ARTICLE	

/* 게시글 */
DROP TABLE ARTICLE 
	CASCADE CONSTRAINTS;
/* 게시글 */
CREATE TABLE ARTICLE (
	articleNum NUMBER NOT NULL, /* 글번호 */
	memberNum NUMBER NOT NULL, /* 회원번호 */
	categoryNum NUMBER NOT NULL, /* 카테고리번호 */
	articleTitle VARCHAR2(100) NOT NULL, /* 글제목 */
	articleContent VARCHAR2(4000), /* 글내용 */
	articleHits NUMBER NOT NULL, /* 조회수 */
	articleDate DATE NOT NULL /* 날짜 */
);
ALTER TABLE ARTICLE
	ADD
		CONSTRAINT PK_ARTICLE
		PRIMARY KEY (
			articleNum
		);
ALTER TABLE ARTICLE
	ADD
		CONSTRAINT FK_MEMBER_TO_ARTICLE
		FOREIGN KEY (
			memberNum
		)
		REFERENCES MEMBER (
			memberNum
		) ON DELETE CASCADE;
ALTER TABLE ARTICLE
	ADD
		CONSTRAINT FK_CATEGORY_TO_ARTICLE
		FOREIGN KEY (
			categoryNum
		)
		REFERENCES CATEGORY (
			categoryNum
		) ON DELETE CASCADE;
drop sequence article_seq;
create sequence article_seq
       start with 1
       increment by 1
       nocycle
       nocache;
		
       
-- PRODUCT

/* 상품 */
DROP TABLE PRODUCT 
	CASCADE CONSTRAINTS;
/* 상품 */
CREATE TABLE PRODUCT (
	productNum NUMBER NOT NULL, /* 상품번호 */
	articleNum NUMBER NOT NULL, /* 글번호 */
	productName VARCHAR2(100) NOT NULL, /* 상품명 */
	productLink VARCHAR2(300) NOT NULL, /* 상품링크 */
	productImage VARCHAR2(300) /* 사진 */
);
ALTER TABLE PRODUCT
	ADD
		CONSTRAINT PK_PRODUCT
		PRIMARY KEY (
			productNum
		);
ALTER TABLE PRODUCT
	ADD
		CONSTRAINT FK_ARTICLE_TO_PRODUCT
		FOREIGN KEY (
			articleNum
		)
		REFERENCES ARTICLE (
			articleNum
		) ON DELETE CASCADE;
drop sequence product_seq;
create sequence product_seq
       start with 1
       increment by 1
       nocycle
       nocache;	
	
       
--RATING

/* 평가 */
DROP TABLE RATING 
	CASCADE CONSTRAINTS;
/* 평가 */
CREATE TABLE RATING (
	productNum NUMBER NOT NULL, /* 상품번호 */
	memberNum NUMBER NOT NULL, /* 회원번호 */
	choice NUMBER NOT NULL /* 살까 */
);
ALTER TABLE RATING
	ADD
		CONSTRAINT PK_RATING
		PRIMARY KEY (
			productNum,
			memberNum
		);
ALTER TABLE RATING
	ADD
		CONSTRAINT FK_MEMBER_TO_RATING
		FOREIGN KEY (
			memberNum
		)
		REFERENCES MEMBER (
			memberNum
		) ON DELETE CASCADE;
ALTER TABLE RATING
	ADD
		CONSTRAINT FK_PRODUCT_TO_RATING
		FOREIGN KEY (
			productNum
		)
		REFERENCES PRODUCT (
			productNum
		) ON DELETE CASCADE;
drop sequence rating_seq;
create sequence rating_seq
       start with 1
       increment by 1
       nocycle
       nocache;			
	
       
--REPLY

/* 댓글 */
DROP TABLE REPLY 
	CASCADE CONSTRAINTS;

/* 댓글 */
CREATE TABLE REPLY (
	replyNum NUMBER NOT NULL, /* 댓글번호 */
	memberNum NUMBER NOT NULL, /* 회원번호 */
	productNum NUMBER NOT NULL, /* 상품번호 */
	replyContent VARCHAR2(1000) NOT NULL, /* 내용 */
	replyDate DATE NOT NULL, /* 시간 */
	choice NUMBER NOT NULL /* 살까 */
);

ALTER TABLE REPLY
	ADD
		CONSTRAINT PK_REPLY
		PRIMARY KEY (
			replyNum
		);

ALTER TABLE REPLY
	ADD
		CONSTRAINT FK_PRODUCT_TO_REPLY
		FOREIGN KEY (
			productNum
		)
		REFERENCES PRODUCT (
			productNum
		) ON DELETE CASCADE;

ALTER TABLE REPLY
	ADD
		CONSTRAINT FK_MEMBER_TO_REPLY
		FOREIGN KEY (
			memberNum
		)
		REFERENCES MEMBER (
			memberNum
		) ON DELETE CASCADE;
drop sequence reply_seq;
create sequence reply_seq
       start with 1
       increment by 1
       nocycle
       nocache;			
       
     
       