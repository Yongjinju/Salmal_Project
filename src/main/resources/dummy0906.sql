--기존 글 데이터 삭제 및 시퀀스 초기화

delete from article;
drop sequence article_seq;
create sequence article_seq
       start with 1
       increment by 1
       nocycle
       nocache;
   
 select * from ARTICLE;      
       
--기존 상품 데이터 삭제 및 시퀀스 초기화      
       
delete from product;      
drop sequence product_seq;
create sequence product_seq
       start with 1
       increment by 1
       nocycle
       nocache;   
       
select * from product;       
   
--기존 댓글 데이터 삭제 및 시퀀스 초기화 
       
delete from reply;       
drop sequence reply_seq;
create sequence reply_seq
       start with 1
       increment by 1
       nocycle
       nocache;
       
--기존 멤버 데이터 삭제 및 시퀀스 초기화 
       
delete from member;       
drop sequence member_seq;
create sequence member_seq
       start with 1
       increment by 1
       nocycle
       nocache;
 
delete from CATEGORY;
drop sequence category_seq;
create sequence category_seq
       start with 1
       increment by 1
       nocycle
       nocache;

       
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
       
select * from CATEGORY order by CATEGORYNUM;

-- 회원  MEMBER
insert into MEMBER(memberNum,email,nickname,password,gender,birth,joinDate) values (member_seq.nextval, 'moon@gmail.com', 'moon', 'a123a123', 'M', '2000-03-12', '2018-08-15');
insert into MEMBER(memberNum,email,nickname,password,gender,birth,joinDate) values (member_seq.nextval, 'hana@naver.com', 'hana', 'a12345', 'F', '1991-11-11', '2018-07-05');
insert into MEMBER(memberNum,email,nickname,password,gender,birth,joinDate) values (member_seq.nextval, 'jirgana@gmail.com', 'Yongjin', 'a12345', 'M', '2002-12-13', '2018-06-25');
insert into MEMBER(memberNum,email,nickname,password,gender,birth,joinDate) values (member_seq.nextval, 'jiwnim@gmail.com', 'Jiwoo', '123qwe', 'M', '2002-04-24', '2018-09-23');
insert into MEMBER(memberNum,email,nickname,password,gender,birth,joinDate) values (member_seq.nextval, 'gosolbi@gmail.com', 'solbi', '1234qwer', 'F', '1996-09-04', '2018-02-12');
insert into MEMBER(memberNum,email,nickname,password,gender,birth,joinDate) values (member_seq.nextval, 'jimingoal@gmail.com', 'JM', 'a1234', 'M', '1987-08-27', '2018-08-25');

select * from member order by memberNum;


-- 게시글 article
insert into ARTICLE(articleNum,memberNum,categoryNum,articleTitle,articleContent,articleHits,articleDate)
values (article_seq.nextval, 1, 3, '에어팟 무선 모델 어때요?', '에어팟 2세대 무선 모델인데, 혹시 써보신 분 계시면 살지말지 알려주세요', 1, '2019-08-25');
insert into ARTICLE (articleNum,memberNum, categoryNum,articleTitle,articleContent,articleHits,articleDate)
values (article_seq.nextval, 1, 4, '커피 뭐사죠...', '라바짜랑 일리커피랑 둘 중에 뭐 살까요?', 5, '2019-08-26');
insert into ARTICLE (articleNum,memberNum, categoryNum,articleTitle,articleContent,articleHits,articleDate)
values (article_seq.nextval, 2, 5, '책.....', '이 책 1권을 읽었는데 그냥 그래서.. 2권을 마저 읽을까요 말까요?', 4, '2019-08-29');
insert into ARTICLE (articleNum,memberNum, categoryNum,articleTitle,articleContent,articleHits,articleDate)
values (article_seq.nextval, 2, 6, '유모차 고민입니다', '유모차 둘 중에 어떤게 좋나요?', 3, '2019-08-31');
insert into ARTICLE (articleNum,memberNum, categoryNum,articleTitle,articleContent,articleHits,articleDate)
values (article_seq.nextval, 3, 9, '여자친구 선물로 산타마리아노벨라 향수 어떤가요?', '여자친구 선물로 고려중인데 어떤지 알려주세요 다른 괜찮은 상품이 있다면 추천 부탁드립니다', 7, '2019-09-01');
insert into ARTICLE (articleNum,memberNum, categoryNum,articleTitle,articleContent,articleHits,articleDate)
values (article_seq.nextval, 3, 10, '의류건조기 뭐 살까요? ', 'LG스타일러랑, 삼성 에어드레서랑 뭐 살까요? 스타일러가 판매량은 1위인데 스타일러가 나을까요?', 16, '2019-09-02');
insert into ARTICLE (articleNum,memberNum, categoryNum,articleTitle,articleContent,articleHits,articleDate)
values (article_seq.nextval, 4, 7, '카메라 입문용으로 살려는데 괜찮을까요?', '카메라에 입문했는데 바로 이 상품으로 시작해도 되겠죠?', 9, '2019-09-03');
insert into ARTICLE (articleNum,memberNum, categoryNum,articleTitle,articleContent,articleHits,articleDate)
values (article_seq.nextval, 4, 8, '신발 사고 싶은데 돈이 없어서 둘다 못 살것 같아요...아무튼 골라주세요!', '일상화로 둘 중 하나만 추천받습니다!!', 10, '2019-09-04');
insert into ARTICLE(articleNum,memberNum,categoryNum,articleTitle,articleContent,articleHits,articleDate)
values (article_seq.nextval, 5,1, '캣타워살건데', '아직 아깽인데 이거 사는거 오바인가?', 20, '2019-09-04');
insert into ARTICLE(articleNum,memberNum,categoryNum,articleTitle,articleContent,articleHits,articleDate)
values (article_seq.nextval, 5, 3, '브이로그시작할건데 셀카봉','그냥 싸고 이쁜게 나아 아니면 뭐 제대로 된거 사야해?', 20, '2019-09-05');
insert into ARTICLE(articleNum,memberNum,categoryNum,articleTitle,articleContent,articleHits,articleDate)
values (article_seq.nextval, 6, 1, '이케아 MARKUS 회전의자 어떤가요???', '이케아 MARKUS 회전의자 구매하려고 하는데 사용할만 한가요?? ', 15, '2019-09-05');
insert into ARTICLE (articleNum, memberNum, categoryNum,articleTitle,articleContent,articleHits,articleDate)
values (article_seq.nextval, 6, 2, '개발자 노트북 고민입니다', '개발자용으로 어떤 노트북이 좋을까요???', 17, '2019-09-05');

select * from article order by articleNum;

-- 상품 product

insert into PRODUCT(productNum,articleNum,productName,productLink,productImage)
values (product_seq.nextval, 1, 'Apple 에어팟 2세대 무선 충전 모델','https://www.coupang.com/vp/products/210191353?itemId=625994316&vendorItemId=4643929947&isAddedCart=','/upload/airpods.PNG');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage)
values (product_seq.nextval, 2, '라바짜 퀼리타 오로 그라운드 커피','https://www.coupang.com/vp/products/15341333?itemId=63106236&vendorItemId=3098990371&isAddedCart=','/upload/lavazza.PNG');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage)
values (product_seq.nextval, 2, '일리 미디움 분쇄커피','https://www.coupang.com/vp/products/2719217?itemId=1077688&vendorItemId=3001038856&pickType=COU_PICK&q=%EC%9D%BC%EB%A6%AC&itemsCount=36&searchId=b7a21eeab70b47fb92bc17c535eaafd2&rank=13&isAddedCart=','/upload/illy.PNG');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage)
values (product_seq.nextval, 3, '베르나르 베르베르-고양이2', 'https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=146611305', '/upload/2019846722751.jpg');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage)
values (product_seq.nextval, 4, '[쥬비] 쥬비 카부스 울트라라이트 그라파이트 유모차+사은품', 'http://item.gmarket.co.kr/Item?goodscode=1407668973&keyword_order=%ec%9c%a0%eb%aa%a8%ec%b0%a8&keyword_seqno=20852025980&search_keyword=%c0%af%b8%f0%c2%f7', '/upload/2019846505481.PNG');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage)
values (product_seq.nextval, 4, 'NEW 벤틀리 트라이시클/세발 유아 자전거 유모차', 'http://item.gmarket.co.kr/Item?goodscode=962712119&pos_shop_cd=SH&pos_class_cd=111111111&pos_class_kind=T&keyword_seqno=20851934947&search_keyword=%ec%9c%a0%eb%aa%a8%ec%b0%a8', '/upload/2019846505506.PNG');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage)
values (product_seq.nextval, 5, '산타마리아노벨라 아쿠아 디 콜로니아 프리지아 우먼 오드코롱','http://www.ssg.com/item/itemView.ssg?itemId=1000010495837&siteNo=6009&salestrNo=1019&ckwhere=ssg_naver&appPopYn=n&NaPm=ct%3Dk04y69n4%7Cci%3D163968020b80245b059dae85f451f2cd9e3f992e%7Ctr%3Dslsc%7Csn%3D218835%7Chk%3Da1d0d0c99781705d0c01f27662935ee69f919154','/upload/santa.jpg');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage)
values (product_seq.nextval, 6, 'LG전자 TROMM 스타일러 S5MB','http://itempage3.auction.co.kr/DetailView.aspx?ItemNo=B670700553&frm3=V2','/upload/lg.jpg');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage)
values (product_seq.nextval, 6, '삼성전자 에어드레서 DF60N8700MG','http://item.gmarket.co.kr/DetailView/Item.asp?goodscode=1482286621&GoodsSale=Y&jaehuid=200002657&service_id=elecdn','/upload/samsung.jpg');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage)
values (product_seq.nextval, 7, '캐논 EOS 200D','http://shopping.interpark.com/product/productInfo.do?prdNo=6064706312&dispNo=008001083&smid1=common_prd','/upload/camera.jpg');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage)
values (product_seq.nextval, 8, 'BALENCIAGA 트리플 S 트레이너','https://www.balenciaga.com/kr/speed-shoes_cod11561808cx.html','/upload/triples.jpg');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage)
values (product_seq.nextval, 8, 'BALENCIAGA 스피드 트레이너','https://www.balenciaga.com/kr/speed-shoes_cod11561808cx.html','/upload/speed.jpg');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage)
values (product_seq.nextval, 9, '시크릿캣타워 플레이킹덤 ST-501 그레이 대형캣타워','https://www.coupang.com/vp/products/30938942?itemId=117127159&vendorItemId=4654041404&pickType=COU_PICK&q=%EC%BA%A3%ED%83%80%EC%9B%8C&itemsCount=36&searchId=9184637390e74b40abb19163d3fa05bc&rank=3&isAddedCart=','/upload/cat.jpg');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage)
values (product_seq.nextval, 10, '바나다 프리미엄 미니 셀카봉','https://www.coupang.com/vp/products/21209608?itemId=82817833&vendorItemId=3141184214&sourceType=CAMPAIGN&campaignId=82&categoryId=429523&isAddedCart=','/upload/sel.jpg');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage)
values (product_seq.nextval, 10, '지윤 스무스4 스마트폰 짐벌 셀카봉 블랙','https://www.coupang.com/vp/products/121749279?itemId=361871511&vendorItemId=3880144470&sourceType=CAMPAIGN&campaignId=82&categoryId=429523&isAddedCart=','/upload/sel2.jpg');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage)
values (product_seq.nextval, 11, '이케아 MARKUS 회전의자', 'http://shopping.interpark.com/product/productInfo.do?prdNo=6173437010&dispNo=016001&bizCd=A14551&NaPm=ct%3Dk05ypieo%7Cci%3D0yC00006kl1rmLA4pf2T%7Ctr%3Dpla%7Chk%3D3ea49d03ecbe882678870031969439986ccac381&utm_medium=cpc&utm_source=naver&utm_campaign=shop_p01397_a14551&utm_content=main_pc', '/upload/markus.jpg');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage)
values (product_seq.nextval, 12, 'LG 올데이 그램 15Z975-GA75K', 'http://www.11st.co.kr/product/SellerProductDetail.tmall?method=getSellerProductDetail&prdNo=2019041151&service_id=pcdn&utm_term=&utm_campaign=%B4%D9%B3%AA%BF%CDpc_%B0%A1%B0%DD%BA%F1%B1%B3%B1%E2%BA%BB&utm_source=%B4%D9%B3%AA%BF%CD_PC_PCS&utm_medium=%B0%A1%B0%DD%BA%F1%B1%B3', '/upload/15Z975-GA75K.jpg');
insert into PRODUCT(productNum,articleNum,productName,productLink,productImage)
values (product_seq.nextval, 12, 'Apple 2019년 맥북 프로 터치바 15 9세대 MV902KH/A', 'http://item.gmarket.co.kr/DetailView/Item.asp?goodscode=1635942807&GoodsSale=Y&jaehuid=200002657&service_id=pcdn', '/upload/MV902KH.png'); 

-- 댓글
delete from reply;
-- (캣타워)
insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 2, 13, '귀여운데 아직 안사도 될거같아요...', to_date('2019-09-05 10:31','yyyy-mm-dd hh24:mi'), 1);
insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 1, 13, '튼튼해보이네요', to_date('2019-09-05 15:42','yyyy-mm-dd hh24:mi'), 1);
insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 6, 13, '청소하기 힘들거같아요', to_date('2019-09-04 02:31','yyyy-mm-dd hh24:mi'), 0);
insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 3, 13, '이쁘네요', to_date('2019-09-05 18:11','yyyy-mm-dd hh24:mi'), 1);
insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 4, 13, '저거 집에 있는데 고양이들이 좋아해요', to_date('2019-09-06 07:11','yyyy-mm-dd hh24:mi'), 1);
-- (브이로그)
insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 2, 14, '저는 예쁜게 좋아요', to_date('2019-09-05 09:34','yyyy-mm-dd hh24:mi'), 1);
insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 1, 14, '튼튼한게 최고죠', to_date('2019-09-05 12:03','yyyy-mm-dd hh24:mi'), 1);
insert into REPLY(replyNum,memberNum,productNum,replyContent,replyDate,choice) values (reply_seq.nextval, 3, 14, '튼튼한거 사서 오래쓰세요', to_date('2019-09-06 01:11','yyyy-mm-dd hh24:mi'), 1);



-- 추천(rating)
delete from rating;
-- (캣타워)
insert into RATING(productNum,memberNum,choice) values (13, 2, 1);
insert into RATING(productNum,memberNum,choice) values (13, 1, 1);
insert into RATING(productNum,memberNum,choice) values (13, 6, 0);
insert into RATING(productNum,memberNum,choice) values (13, 3, 1);
insert into RATING(productNum,memberNum,choice) values (13, 4, 1);
-- (브이로그)
insert into RATING(productNum,memberNum,choice) values (14, 2, 1);
insert into RATING(productNum,memberNum,choice) values (15, 1, 1);
insert into RATING(productNum,memberNum,choice) values (15, 3, 1);
insert into RATING(productNum,memberNum,choice) values (15, 4, 1);
insert into RATING(productNum,memberNum,choice) values (15, 6, 1);
