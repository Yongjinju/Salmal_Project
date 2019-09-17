-- 회원  MEMBER
insert into MEMBER(memberNum,email,nickname,password,gender,birth,joinDate) values (member_seq.nextval, 'gildong@naver.com', 'gildong', 'a1234', 'M', '2015-01-01', sysdate);
insert into MEMBER(memberNum,email,nickname,password,gender,birth,joinDate) values (member_seq.nextval, 'lime@naver.com', 'lime', 'a1234', 'F', '2011-01-02', sysdate);
insert into MEMBER(memberNum,email,nickname,password,gender,birth,joinDate) values (member_seq.nextval, 'juwon@naver.com', 'juwon', 'a1234', 'F', '2012-01-03', sysdate);
insert into MEMBER values (member_seq.nextval, 'gosolbi960904@gmail.com', 'solbi', '1111', 'F', '1996-09-04', sysdate);
select * from MEMBER;

-- 카테고리 CATEGORY
insert into CATEGORY(categoryNum,categoryName) values (category_seq.nextval, '기타');
insert into CATEGORY(categoryNum,categoryName) values (category_seq.nextval, '컴퓨터');
insert into CATEGORY(categoryNum,categoryName) values (category_seq.nextval, '디지털');
insert into CATEGORY(categoryNum,categoryName) values (category_seq.nextval, '식품/건강');
insert into CATEGORY(categoryNum,categoryName) values (category_seq.nextval, '서적');
insert into CATEGORY(categoryNum,categoryName) values (category_seq.nextval, '육아');
insert into CATEGORY(categoryNum,categoryName) values (category_seq.nextval, '카메라');
insert into CATEGORY(categoryNum,categoryName) values (category_seq.nextval, '의류잡화');
insert into CATEGORY(categoryNum,categoryName) values (category_seq.nextval, '화장품');
insert into CATEGORY(categoryNum,categoryName) values (category_seq.nextval, '가전');


-- 게시글 ARTICLE
insert into ARTICLE(articleNum,memberNum,categoryNum,articleTitle,articleContent,articleHits,articleDate) values (article_seq.nextval, 1, 1, '테스트1', '테스트테스트1', 0, sysdate);

insert into ARTICLE(articleNum,memberNum,categoryNum,articleTitle,articleContent,articleHits,articleDate) values (article_seq.nextval, 2, 1, '테스트2-1', '테스트테스트2-1', 0, sysdate);
insert into ARTICLE(articleNum,memberNum,categoryNum,articleTitle,articleContent,articleHits,articleDate) values (article_seq.nextval, 2, 2, '테스트2-2', '테스트테스트2-2', 0, sysdate);

insert into ARTICLE(articleNum,memberNum,categoryNum,articleTitle,articleContent,articleHits,articleDate) values (article_seq.nextval, 3, 1, '테스트3-1', '테스트테스트3', 0, sysdate);
insert into ARTICLE(articleNum,memberNum,categoryNum,articleTitle,articleContent,articleHits,articleDate) values (article_seq.nextval, 3, 2, '테스트3-2', '테스트테스트3', 0, sysdate);
insert into ARTICLE(articleNum,memberNum,categoryNum,articleTitle,articleContent,articleHits,articleDate) values (article_seq.nextval, 3, 3, '테스트3-3', '테스트테스트3', 0, sysdate);


-- 상품 PRODUCT
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage) values (product_seq.nextval, 1, '글1-상품제목1-1(의류)', 'www.naver.com', '/resources/productImage/product1.jpg');

insert into PRODUCT(productNum,articleNum,productName,productLink,productImage) values (product_seq.nextval, 2, '글2-상품제목1-1(의류)', 'www.nate.com', '/resources/productImage/product3');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage) values (product_seq.nextval, 2, '글2-상품제목1-2(의류)', 'www.daum.net', '/resources/productImage/product2');

insert into PRODUCT(productNum,articleNum,productName,productLink,productImage) values (product_seq.nextval, 3, '글3-상품제목2-1(컴퓨터)', 'www.daum.net', '/resources/productImage/product2');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage) values (product_seq.nextval, 3, '글3-상품제목2-2(컴퓨터)', 'www.daum.net', '/resources/productImage/product2');

insert into PRODUCT(productNum,articleNum,productName,productLink,productImage) values (product_seq.nextval, 4, '글4-상품제목1-1(의류)', 'www.nate.com', '/resources/productImage/product3');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage) values (product_seq.nextval, 4, '글4-상품제목1-2(의류)', 'www.naver.com', '/resources/productImage/product1');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage) values (product_seq.nextval, 4, '글4-상품제목1-3(의류)', 'www.daum.net', '/resources/productImage/product2');

insert into PRODUCT(productNum,articleNum,productName,productLink,productImage) values (product_seq.nextval, 5, '글5-상품제목2-1(컴퓨터)', 'www.nate.com', '/resources/productImage/product3');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage) values (product_seq.nextval, 5, '글5-상품제목2-2(컴퓨터)', 'www.naver.com', '/resources/productImage/product1');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage) values (product_seq.nextval, 5, '글5-상품제목2-3(컴퓨터)', 'www.daum.net', '/resources/productImage/product2');

insert into PRODUCT(productNum,articleNum,productName,productLink,productImage) values (product_seq.nextval, 6, '글6-상품제목3-1(화장품)', 'www.nate.com', '/resources/productImage/product3');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage) values (product_seq.nextval, 6, '글6-상품제목3-2(화장품)', 'www.naver.com', '/resources/productImage/product1');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage) values (product_seq.nextval, 6, '글6-상품제목3-3(화장품)', 'www.daum.net', '/resources/productImage/product2');


-- 평가 RATING
insert into RATING(productNum,memberNum,choice) values (1, 2, 0);
insert into RATING(productNum,memberNum,choice) values (1, 3, 1);
insert into RATING(productNum,memberNum,choice) values (2, 3, 0);
insert into RATING(productNum,memberNum,choice) values (2, 1, 1);
insert into RATING(productNum,memberNum,choice) values (3, 1, 0);
insert into RATING(productNum,memberNum,choice) values (3, 2, 1);


-- 댓글 REPLY
insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 1, 1, '상품1-댓글쓴이1', sysdate, 0);

insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 1, 2, '상품2-댓글쓴이1', sysdate, 0);
insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 2, 2, '상품2-댓글쓴이2', sysdate, 1);
insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 1, 3, '상품3-댓글쓴이1', sysdate, 1);
insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 2, 3, '상품3-댓글쓴이2', sysdate, 0);

insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 1, 4, '상품4-댓글쓴이1', sysdate, 1);
insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 2, 4, '상품4-댓글쓴이2', sysdate, 0);
insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 3, 4, '상품4-댓글쓴이3', sysdate, 1);
insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 1, 5, '상품5-댓글쓴이1', sysdate, 1);
insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 2, 5, '상품5-댓글쓴이2', sysdate, 0);
insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 3, 5, '상품5-댓글쓴이3', sysdate, 1);
insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 1, 6, '상품6-댓글쓴이1', sysdate, 1);
insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 2, 6, '상품6-댓글쓴이2', sysdate, 0);
insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 3, 6, '상품6-댓글쓴이3', sysdate, 1);


select * from MEMBER order by memberNum;
select * from CATEGORY order by categoryNum;
select * from ARTICLE order by articleNum;
select * from PRODUCT order by productNum;
select * from RATING order by productNum, memberNum;
select * from REPLY order by replyNum;


-- 조회수 변경 
update article set articleHits = 1 where articleNum=1;

update article set articleHits = 2 where articleNum=2;
update article set articleHits = 200 where articleNum=3;

update article set articleHits = 3 where articleNum=4;
update article set articleHits = 300 where articleNum=5;
update article set articleHits = 3000 where articleNum=6;
