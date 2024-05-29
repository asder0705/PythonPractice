CREATE TABLE stock (
        code VARCHAR2(10) PRIMARY KEY
       ,name VARCHAR2(100)
       ,market VARCHAR2(10)
       ,marcap NUMBER
       ,stocks NUMBER
       ,use_yn VARCHAR2(1) DEFAULT 'N'
 );
CREATE TABLE stock_price (
       code VARCHAR2(10) 
      ,seq  NUMBER
      ,price NUMBER
      ,create_dt DATE DEFAULT SYSDATE
);
CREATE SEQUENCE stock_seq 
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999999;
select *
from stock;

    INSERT INTO stock (code, name, market, marcap, stocks)
    VALUES ('1234', '', '', '','');

UPDATE stock
SET use_yn ='Y'
WHERE name LIKE '%»ï¼º%';


SELECT *
FROM stock
WHERE USE_YN ='Y';



    
INSERT INTO stock_price (code, seq, price)
VALUES (:1, stock_seq.NEXTVAL, :2);
;
SELECT stock_seq.NEXTVAL
FROm dual;

SELECT a.name, b.price
     , TO_CHAR(b.create_dt, 'YYYYMMDD HH24:MI:SS') as dt
FROM stock a
   , stock_price b
WHERE a.code = b.code 
AND a.name = '»ï¼ºÀüÀÚ'
ORDER BY b.create_dt DESC;



delete stock_price;
drop sequence stock_seq;

select count(*)
from stock_price
ORDER BY create_dt asc;




delete stock_price 
where seq in (1804, 1805);


drop table stock_bbs;

CREATE TABLE stock_bbs (
    CODE VARCHAR2(10),
    DISCUSSION_ID VARCHAR2(20),
    TITLE VARCHAR2(200),
    CONTENTS VARCHAR2(4000),
    READ_COUNT NUMBER,
    GOOD_COUNT NUMBER,
    BAD_COUNT NUMBER,
    COMMENT_COUNT NUMBER,
    CREATE_DT DATE,
    UPDATE_DT DATE DEFAULT SYSDATE,
    CONSTRAINT pk_your_table_name PRIMARY KEY (CODE, DISCUSSION_ID)
);



--Ãß°¡ 
ALTER TABLe stock_bbs ADD(CLOB_CONTENTS CLOB);



SELECT *
FROM stock_bbs;

delete stock_bbs;
MERGE INTO stock_bbs a
USING dual 
ON (a.code =:1
    and a.discussion_Id =:2)
WHEN MATCHED THEN 
   UPDATE SET a.read_Count = :3
            , a.good_Count = :4
            , a.bad_Count = :5
            , a.comment_Count = :6
WHEN NOT MATCHED THEN 
   INSERT (a.code, a.discussion_Id, a.read_Count, a.good_Count
         , a.bad_Count, a.comment_Count, a.title, a.contents, a.create_dt)
   VALUES (:1, :2, :3, :4, :5, :6, :7, :8, to_date(:9,'YYYY-MM-DD HH24:MI:SS'));