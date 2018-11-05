--------------------------------------------------------
--  파일이 생성됨 - 월요일-11월-05-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CF_S_EXCHANGE_NO
--------------------------------------------------------

   CREATE SEQUENCE  "CF_S_EXCHANGE_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence CF_S_EXC_NO
--------------------------------------------------------

   CREATE SEQUENCE  "CF_S_EXC_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence CF_S_EXF_NO
--------------------------------------------------------

   CREATE SEQUENCE  "CF_S_EXF_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence CF_S_GALLERY_NO
--------------------------------------------------------

   CREATE SEQUENCE  "CF_S_GALLERY_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence CF_S_MEMBER_NO
--------------------------------------------------------

   CREATE SEQUENCE  "CF_S_MEMBER_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Table CF_EXCHANGE
--------------------------------------------------------

  CREATE TABLE "CF_EXCHANGE" 
   (	"EX_NO" NUMBER, 
	"WRITER" VARCHAR2(30), 
	"EX_TITLE" VARCHAR2(100), 
	"EX_CONTENT" VARCHAR2(4000), 
	"EX_REG_DATE" DATE DEFAULT sysdate, 
	"EX_COMPLETE" CHAR(1) DEFAULT 'n', 
	"EX_VIEW_CNT" NUMBER DEFAULT 0
   )
--------------------------------------------------------
--  DDL for Table CF_EXCHANGE_COMMENT
--------------------------------------------------------

  CREATE TABLE "CF_EXCHANGE_COMMENT" 
   (	"EXC_NO" NUMBER, 
	"EX_NO" NUMBER, 
	"EXC_WRITER" VARCHAR2(30), 
	"EXC_CONTENT" VARCHAR2(300), 
	"EXC_REG_DATE" DATE DEFAULT sysdate, 
	"EXC_REF" NUMBER DEFAULT 0, 
	"EXC_PARENT_NO" NUMBER DEFAULT 0
   )
--------------------------------------------------------
--  DDL for Table CF_EXCHANGE_FILE
--------------------------------------------------------

  CREATE TABLE "CF_EXCHANGE_FILE" 
   (	"EXF_NO" NUMBER, 
	"EX_NO" NUMBER, 
	"EXF_ORI_NAME" VARCHAR2(100), 
	"EXF_SYS_NAME" VARCHAR2(100), 
	"EXF_PATH" VARCHAR2(100), 
	"EXF_SIZE" NUMBER
   )
--------------------------------------------------------
--  DDL for Table CF_GALLERY
--------------------------------------------------------

  CREATE TABLE "CF_GALLERY" 
   (	"GA_NO" NUMBER, 
	"GA_TITLE" VARCHAR2(100), 
	"WRITER" VARCHAR2(30), 
	"GA_CONTENT" VARCHAR2(4000), 
	"GA_REC_CNT" NUMBER DEFAULT 0, 
	"GA_VIEW_CNT" NUMBER DEFAULT 0, 
	"GA_REG_DATE" DATE DEFAULT sysdate
   )
--------------------------------------------------------
--  DDL for Table CF_MEMBER
--------------------------------------------------------

  CREATE TABLE "CF_MEMBER" 
   (	"MEMBER_NO" NUMBER, 
	"ID" VARCHAR2(30), 
	"NAME" VARCHAR2(30), 
	"PASS" VARCHAR2(100), 
	"FILE_PATH" VARCHAR2(100) DEFAULT '', 
	"FILE_NAME" VARCHAR2(100) DEFAULT ''
   )
REM INSERTING into CF_EXCHANGE
SET DEFINE OFF;
Insert into CF_EXCHANGE (EX_NO,WRITER,EX_TITLE,EX_CONTENT,EX_REG_DATE,EX_COMPLETE,EX_VIEW_CNT) values (3,'admin','2빠 글 테스트','<h2>들어갈 것인가...domain <span style="background-color: rgb(255, 255, 0);">경로를 바꿨는데도???</span></h2>',to_date('18/10/30','RR/MM/DD'),'n',0);
Insert into CF_EXCHANGE (EX_NO,WRITER,EX_TITLE,EX_CONTENT,EX_REG_DATE,EX_COMPLETE,EX_VIEW_CNT) values (1,'admin','1빠 글임','<p>들어가랏 글아!!!!</p>',to_date('18/10/29','RR/MM/DD'),'n',0);
Insert into CF_EXCHANGE (EX_NO,WRITER,EX_TITLE,EX_CONTENT,EX_REG_DATE,EX_COMPLETE,EX_VIEW_CNT) values (16,'hong','홍명보가 글쓴당','<p><img src="http://localhost:8000/app/upload/2018/11/02/15/139fb268e425446bad546faa9b554515.jpg" style="width: 762px;"></p><p><br></p><p><br></p><p>홍명보 손 예쁘당</p>',to_date('18/11/02','RR/MM/DD'),'y',3);
Insert into CF_EXCHANGE (EX_NO,WRITER,EX_TITLE,EX_CONTENT,EX_REG_DATE,EX_COMPLETE,EX_VIEW_CNT) values (17,'victory','채소가 많아용','<p><img src="http://localhost:8000/app/upload/2018/11/02/20/4417d929a7754523ac55fb2bdb60bc77.jpg" style="width: 762px;"></p><p><br></p><p>내 야채들 이쁘쥬???</p>',to_date('18/11/02','RR/MM/DD'),'n',3);
Insert into CF_EXCHANGE (EX_NO,WRITER,EX_TITLE,EX_CONTENT,EX_REG_DATE,EX_COMPLETE,EX_VIEW_CNT) values (13,'admin','양배추가 위에 좋대요!!','<p>위에 좋은 양배추가 10kg 정도 남았어요!!</p><p>저랑 바꾸실 수 있는 야채 있으신 분은 연락주세요</p><p><img style="width: 390px;" src="http://localhost:8000/app/upload/2018/10/31/18/76d185c07bd54ef98cf0f93f49664b10.png"></p>',to_date('18/10/31','RR/MM/DD'),'n',1);
Insert into CF_EXCHANGE (EX_NO,WRITER,EX_TITLE,EX_CONTENT,EX_REG_DATE,EX_COMPLETE,EX_VIEW_CNT) values (11,'admin','당근 풍년이예요~~','<p><img style="width: 437px;" src="http://localhost:8000/app/upload/2018/10/31/18/b5b26ed169fe44459cddca234cc17ae5.png"></p><p><br></p><p>당근이 풍년이 나서 20kg 정도 남을것 같은데</p><p>감자랑 교환 하실 분 계신가요???</p>',to_date('18/10/31','RR/MM/DD'),'n',7);
Insert into CF_EXCHANGE (EX_NO,WRITER,EX_TITLE,EX_CONTENT,EX_REG_DATE,EX_COMPLETE,EX_VIEW_CNT) values (12,'admin','브로콜리 좋아하시는분??','<p><img style="width: 434px;" src="http://localhost:8000/app/upload/2018/10/31/18/6ff1844d254646db88f7c0f4a300edc5.png"></p><p><br></p><p>농약 안쳤구요~~</p><p>유기농인데 필요하신 분 그냥 드릴게요!!</p><p>댓글 남겨주세요!&gt;.&lt;</p>',to_date('18/10/31','RR/MM/DD'),'n',2);
Insert into CF_EXCHANGE (EX_NO,WRITER,EX_TITLE,EX_CONTENT,EX_REG_DATE,EX_COMPLETE,EX_VIEW_CNT) values (14,'admin','방토토 가져가세요~~~','<p><img style="width: 571px;" src="http://localhost:8000/app/upload/2018/10/31/18/34b9303a55584aa6bd8a365f2d127198.png"></p><p><br></p><p>유기농이예요</p><p>생긴거는 좀 못생겼지만 맛은 좋아요!!</p><p>5kg&nbsp; 정도 주말농장에서 남았는데</p><p>저랑 감자랑 바꾸실 분 계신가요???ㅋㅋㅋㅋ</p>',to_date('18/10/31','RR/MM/DD'),'y',1);
Insert into CF_EXCHANGE (EX_NO,WRITER,EX_TITLE,EX_CONTENT,EX_REG_DATE,EX_COMPLETE,EX_VIEW_CNT) values (15,'admin','감자 20kg 남아요~~','<p><img src="http://localhost:8000/app/upload/2018/10/31/22/1d7751efc2014921a8873c75641d6344.png" style="width: 445px;"></p><p><br></p><p>감자 유기농이예요 ~~ㅋㅋ</p><p>댓글 남겨주세용</p>',to_date('18/10/31','RR/MM/DD'),'y',152);
REM INSERTING into CF_EXCHANGE_COMMENT
SET DEFINE OFF;
Insert into CF_EXCHANGE_COMMENT (EXC_NO,EX_NO,EXC_WRITER,EXC_CONTENT,EXC_REG_DATE,EXC_REF,EXC_PARENT_NO) values (7,15,'admin','토마토 좋지요~~~!!사진 보여주세요ㅋㅋㅋㅋ',to_date('18/11/02','RR/MM/DD'),0,0);
Insert into CF_EXCHANGE_COMMENT (EXC_NO,EX_NO,EXC_WRITER,EXC_CONTENT,EXC_REG_DATE,EXC_REF,EXC_PARENT_NO) values (25,15,'admin','답글 달기 후훗',to_date('18/11/04','RR/MM/DD'),9,9);
Insert into CF_EXCHANGE_COMMENT (EXC_NO,EX_NO,EXC_WRITER,EXC_CONTENT,EXC_REG_DATE,EXC_REF,EXC_PARENT_NO) values (24,15,'admin','댓글의 댓글에 수정 form 연습 중중',to_date('18/11/04','RR/MM/DD'),0,0);
Insert into CF_EXCHANGE_COMMENT (EXC_NO,EX_NO,EXC_WRITER,EXC_CONTENT,EXC_REG_DATE,EXC_REF,EXC_PARENT_NO) values (26,15,'admin','토마토 좋디요~~',to_date('18/11/04','RR/MM/DD'),4,4);
Insert into CF_EXCHANGE_COMMENT (EXC_NO,EX_NO,EXC_WRITER,EXC_CONTENT,EXC_REG_DATE,EXC_REF,EXC_PARENT_NO) values (27,15,'admin','답글했을때 돼냐고',to_date('18/11/04','RR/MM/DD'),4,4);
Insert into CF_EXCHANGE_COMMENT (EXC_NO,EX_NO,EXC_WRITER,EXC_CONTENT,EXC_REG_DATE,EXC_REF,EXC_PARENT_NO) values (10,11,'victory','당근 맛있죠잉ㅋㅋㅋㅋㅋ',to_date('18/11/02','RR/MM/DD'),0,0);
Insert into CF_EXCHANGE_COMMENT (EXC_NO,EX_NO,EXC_WRITER,EXC_CONTENT,EXC_REG_DATE,EXC_REF,EXC_PARENT_NO) values (4,15,'victory','저는 토마토 예요!! 관심있으시면 댓글주세욤zzzz@!!!!!',to_date('18/11/02','RR/MM/DD'),0,0);
Insert into CF_EXCHANGE_COMMENT (EXC_NO,EX_NO,EXC_WRITER,EXC_CONTENT,EXC_REG_DATE,EXC_REF,EXC_PARENT_NO) values (9,15,'victory','댓글을 당연히 올라가징',to_date('18/11/02','RR/MM/DD'),0,0);
Insert into CF_EXCHANGE_COMMENT (EXC_NO,EX_NO,EXC_WRITER,EXC_CONTENT,EXC_REG_DATE,EXC_REF,EXC_PARENT_NO) values (11,11,'victory','ㅋㅋㅋㅋㅋ',to_date('18/11/02','RR/MM/DD'),0,0);
Insert into CF_EXCHANGE_COMMENT (EXC_NO,EX_NO,EXC_WRITER,EXC_CONTENT,EXC_REG_DATE,EXC_REF,EXC_PARENT_NO) values (12,11,'victory','당근이당',to_date('18/11/02','RR/MM/DD'),0,0);
Insert into CF_EXCHANGE_COMMENT (EXC_NO,EX_NO,EXC_WRITER,EXC_CONTENT,EXC_REG_DATE,EXC_REF,EXC_PARENT_NO) values (13,11,'victory','쿠궁쿠궁',to_date('18/11/02','RR/MM/DD'),0,0);
Insert into CF_EXCHANGE_COMMENT (EXC_NO,EX_NO,EXC_WRITER,EXC_CONTENT,EXC_REG_DATE,EXC_REF,EXC_PARENT_NO) values (15,15,'victory','사진 어떻게 보여드리죠??',to_date('18/11/03','RR/MM/DD'),7,7);
Insert into CF_EXCHANGE_COMMENT (EXC_NO,EX_NO,EXC_WRITER,EXC_CONTENT,EXC_REG_DATE,EXC_REF,EXC_PARENT_NO) values (16,15,'hong','토마토 저랑 거래하실래요???',to_date('18/11/03','RR/MM/DD'),7,15);
Insert into CF_EXCHANGE_COMMENT (EXC_NO,EX_NO,EXC_WRITER,EXC_CONTENT,EXC_REG_DATE,EXC_REF,EXC_PARENT_NO) values (19,15,'victory','답글을 입력해주세요.',to_date('18/11/03','RR/MM/DD'),8,8);
Insert into CF_EXCHANGE_COMMENT (EXC_NO,EX_NO,EXC_WRITER,EXC_CONTENT,EXC_REG_DATE,EXC_REF,EXC_PARENT_NO) values (20,15,'victory','답글 달리나요?????',to_date('18/11/03','RR/MM/DD'),8,8);
REM INSERTING into CF_EXCHANGE_FILE
SET DEFINE OFF;
Insert into CF_EXCHANGE_FILE (EXF_NO,EX_NO,EXF_ORI_NAME,EXF_SYS_NAME,EXF_PATH,EXF_SIZE) values (31,16,'exchange.jpg','139fb268e425446bad546faa9b554515.jpg','/app/upload/2018/11/02/15',212149);
Insert into CF_EXCHANGE_FILE (EXF_NO,EX_NO,EXF_ORI_NAME,EXF_SYS_NAME,EXF_PATH,EXF_SIZE) values (32,17,'red.jpg','4417d929a7754523ac55fb2bdb60bc77.jpg','/app/upload/2018/11/02/20',2874030);
Insert into CF_EXCHANGE_FILE (EXF_NO,EX_NO,EXF_ORI_NAME,EXF_SYS_NAME,EXF_PATH,EXF_SIZE) values (26,11,'carrot.png','b5b26ed169fe44459cddca234cc17ae5.png','/app/upload/2018/10/31/18',289442);
Insert into CF_EXCHANGE_FILE (EXF_NO,EX_NO,EXF_ORI_NAME,EXF_SYS_NAME,EXF_PATH,EXF_SIZE) values (27,12,'brocoli.png','6ff1844d254646db88f7c0f4a300edc5.png','/app/upload/2018/10/31/18',191491);
Insert into CF_EXCHANGE_FILE (EXF_NO,EX_NO,EXF_ORI_NAME,EXF_SYS_NAME,EXF_PATH,EXF_SIZE) values (28,13,'cabbage.png','76d185c07bd54ef98cf0f93f49664b10.png','/app/upload/2018/10/31/18',180115);
Insert into CF_EXCHANGE_FILE (EXF_NO,EX_NO,EXF_ORI_NAME,EXF_SYS_NAME,EXF_PATH,EXF_SIZE) values (29,14,'tomato.png','34b9303a55584aa6bd8a365f2d127198.png','/app/upload/2018/10/31/18',302102);
Insert into CF_EXCHANGE_FILE (EXF_NO,EX_NO,EXF_ORI_NAME,EXF_SYS_NAME,EXF_PATH,EXF_SIZE) values (30,15,'potato.png','1d7751efc2014921a8873c75641d6344.png','/app/upload/2018/10/31/22',183512);
REM INSERTING into CF_GALLERY
SET DEFINE OFF;
REM INSERTING into CF_MEMBER
SET DEFINE OFF;
Insert into CF_MEMBER (MEMBER_NO,ID,NAME,PASS,FILE_PATH,FILE_NAME) values (22,'hong','홍명보','123',null,null);
Insert into CF_MEMBER (MEMBER_NO,ID,NAME,PASS,FILE_PATH,FILE_NAME) values (21,'victory','박아란','1313',null,null);
Insert into CF_MEMBER (MEMBER_NO,ID,NAME,PASS,FILE_PATH,FILE_NAME) values (1,'admin','관리자','admin',null,null);
--------------------------------------------------------
--  Constraints for Table CF_EXCHANGE
--------------------------------------------------------

  ALTER TABLE "CF_EXCHANGE" ADD CONSTRAINT "EXCHANGE_NO_PK" PRIMARY KEY ("EX_NO") ENABLE
  ALTER TABLE "CF_EXCHANGE" MODIFY ("EX_CONTENT" NOT NULL ENABLE)
  ALTER TABLE "CF_EXCHANGE" MODIFY ("EX_TITLE" NOT NULL ENABLE)
  ALTER TABLE "CF_EXCHANGE" MODIFY ("WRITER" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table CF_EXCHANGE_COMMENT
--------------------------------------------------------

  ALTER TABLE "CF_EXCHANGE_COMMENT" ADD CONSTRAINT "EXC_NO_PK" PRIMARY KEY ("EXC_NO") ENABLE
  ALTER TABLE "CF_EXCHANGE_COMMENT" MODIFY ("EXC_WRITER" NOT NULL ENABLE)
  ALTER TABLE "CF_EXCHANGE_COMMENT" MODIFY ("EX_NO" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table CF_EXCHANGE_FILE
--------------------------------------------------------

  ALTER TABLE "CF_EXCHANGE_FILE" ADD CONSTRAINT "EXF_NO_PK" PRIMARY KEY ("EXF_NO") ENABLE
--------------------------------------------------------
--  Constraints for Table CF_GALLERY
--------------------------------------------------------

  ALTER TABLE "CF_GALLERY" ADD CONSTRAINT "GALLERY_NO_PK" PRIMARY KEY ("GA_NO") ENABLE
  ALTER TABLE "CF_GALLERY" MODIFY ("GA_TITLE" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table CF_MEMBER
--------------------------------------------------------

  ALTER TABLE "CF_MEMBER" ADD CONSTRAINT "MEMBER_ID_UK" UNIQUE ("ID") ENABLE
  ALTER TABLE "CF_MEMBER" ADD CONSTRAINT "MEMBER_NO_PK" PRIMARY KEY ("MEMBER_NO") ENABLE
  ALTER TABLE "CF_MEMBER" MODIFY ("ID" NOT NULL ENABLE)
