--cmd sqlplus에서 아래 문장을 복사 붙여 넣기 (한번에 붙여넣기 가능)


--기존 글 데이터 삭제 및 시퀀스 초기화

delete from article;

drop sequence article_seq;
create sequence article_seq
       start with 1
       increment by 1
       nocycle
       nocache;
	
--기존 상품 데이터 삭제 및 시퀀스 초기화      
       
delete from product;      
drop sequence product_seq;
create sequence product_seq
       start with 1
       increment by 1
       nocycle
       nocache;	
	
--기존 댓글 데이터 삭제 및 시퀀스 초기화 
       
delete from reply;       
drop sequence reply_seq;
create sequence reply_seq
       start with 1
       increment by 1
       nocycle
       nocache;		
       

-- 랜덤 글 500개 생성 

 declare

  begin
    FOR i IN 1..500 loop
        INSERT INTO ARTICLE(articleNum,memberNum,categoryNum,articleTitle,articleContent,articleHits,articleDate)
        VALUES(article_seq.nextval, 1, (SELECT ROUND(DBMS_RANDOM.VALUE(1, 10),0) FROM DUAL), CONCAT('글',article_seq.nextval), 
               CONCAT('글',article_seq.nextval),(SELECT ROUND(DBMS_RANDOM.VALUE(1, 100),0) FROM DUAL), CURRENT_TIMESTAMP);
    end loop;
  end;
 /
  
--랜덤 상품 500 ~ 1000개 생성
    
DECLARE
    ran NUMBER;

begin
    FOR i IN 1..500 loop 
    
       ran := ROUND(DBMS_RANDOM.VALUE (1, 2), 0);
        
                for j in 1..ran loop
        
                        insert into PRODUCT(productNum,articleNum,productName,productLink,productImage) 
                        values (product_seq.nextval, 
                        i, 
                        CONCAT('상품번호-',i),
                        CONCAT('링크-', i),
                        '/upload/'||i|| '.jpg'); 
                end loop; 
        
    end loop;
 end; 
/


--랜덤 댓글 생성


DECLARE
    cnt NUMBER := 0;
    ran NUMBER := 0;
    
begin

    select count(*) INTO cnt from product;

    FOR i IN 1..cnt loop 
    
       ran := ROUND(DBMS_RANDOM.VALUE (1,10), 0);
        
                for j in 1..ran loop
        
                       insert into REPLY(replyNum, memberNum ,productNum,replyContent,replyDate,choice) 
                       values (reply_seq.nextval, 1, i , CONCAT('댓글번호-',reply_seq.nextval), sysdate,(SELECT ROUND(DBMS_RANDOM.VALUE(0, 1),0) FROM DUAL)); 
                end loop; 
    end loop;
 end; 
/ 
commit;
