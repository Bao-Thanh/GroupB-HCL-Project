--------------------------------------------------------
--  DDL for Table account
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."account" 
   (	"id" NUMBER(19,0), 
	"password" VARCHAR2(255 CHAR), 
	"role" VARCHAR2(255 CHAR), 
	"status" VARCHAR2(255 CHAR), 
	"username" VARCHAR2(255 CHAR)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table category
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."category" 
   (	"id" NUMBER(19,0), 
	"description" VARCHAR2(255 CHAR), 
	"name" VARCHAR2(255 CHAR), 
	"status" VARCHAR2(255 CHAR), 
	"parent_category_id" NUMBER(19,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table comment
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."comment" 
   (	"id" NUMBER(19,0), 
	"content" VARCHAR2(255 CHAR), 
	"evaluate" VARCHAR2(255 CHAR), 
	"customer_id" NUMBER(19,0), 
	"product_id" NUMBER(19,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table customer
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."customer" 
   (	"id" NUMBER(19,0), 
	"address" VARCHAR2(255 CHAR), 
	"age" NUMBER(10,0), 
	"email" VARCHAR2(255 CHAR), 
	"gender" VARCHAR2(255 CHAR), 
	"name" VARCHAR2(255 CHAR), 
	"phone" VARCHAR2(255 CHAR), 
	"status" VARCHAR2(255 CHAR), 
	"type" NUMBER(10,0), 
	"account_id" NUMBER(19,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table order
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."order" 
   (	"id" NUMBER(19,0), 
	"address" VARCHAR2(255 CHAR), 
	"order_date" DATE, 
	"payment_type" NUMBER(10,0), 
	"phone" VARCHAR2(255 CHAR), 
	"safe_off" FLOAT(126), 
	"state" NUMBER(10,0), 
	"status" VARCHAR2(255 CHAR), 
	"total_price" FLOAT(126), 
	"vat" FLOAT(126), 
	"account_id" NUMBER(19,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table orderdetail
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."orderdetail" 
   (	"id" NUMBER(10,0), 
	"amount" NUMBER(10,0), 
	"product_price" FLOAT(126), 
	"order_id" NUMBER(19,0), 
	"product_id" NUMBER(19,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table product
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."product" 
   (	"id" NUMBER(19,0), 
	"amount" NUMBER(10,0), 
	"description" VARCHAR2(255 CHAR), 
	"image" VARCHAR2(255 CHAR), 
	"name" VARCHAR2(255 CHAR), 
	"price" FLOAT(126), 
	"sale_off" FLOAT(126), 
	"status" VARCHAR2(255 CHAR), 
	"category_id" NUMBER(19,0), 
	"supplier_id" NUMBER(19,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table supplier
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."supplier" 
   (	"id" NUMBER(19,0), 
	"address" VARCHAR2(255 CHAR), 
	"name" VARCHAR2(255 CHAR), 
	"phone" VARCHAR2(255 CHAR)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007396
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007396" ON "SYSTEM"."account" ("id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007398
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007398" ON "SYSTEM"."category" ("id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007400
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007400" ON "SYSTEM"."comment" ("id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007402
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007402" ON "SYSTEM"."customer" ("id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007404
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007404" ON "SYSTEM"."order" ("id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007406
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007406" ON "SYSTEM"."orderdetail" ("id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007408
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007408" ON "SYSTEM"."product" ("id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007410
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007410" ON "SYSTEM"."supplier" ("id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table account
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."account" ADD PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."account" MODIFY ("id" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table category
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."category" ADD PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."category" MODIFY ("id" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table comment
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."comment" ADD PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."comment" MODIFY ("id" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table customer
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."customer" ADD PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."customer" MODIFY ("id" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table order
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."order" ADD PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."order" MODIFY ("id" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table orderdetail
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."orderdetail" ADD PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."orderdetail" MODIFY ("id" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table product
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."product" ADD PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."product" MODIFY ("id" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table supplier
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."supplier" ADD PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."supplier" MODIFY ("id" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table category
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."category" ADD CONSTRAINT "FK4wqwi3wgsrq5kka9k94vc5u2i" FOREIGN KEY ("parent_category_id")
	  REFERENCES "SYSTEM"."category" ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table comment
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."comment" ADD CONSTRAINT "FKk70yr2gxrskwjps661ifv5q69" FOREIGN KEY ("customer_id")
	  REFERENCES "SYSTEM"."customer" ("id") ENABLE;
  ALTER TABLE "SYSTEM"."comment" ADD CONSTRAINT "FKlo59icyee0u6jucfb68x22o3v" FOREIGN KEY ("product_id")
	  REFERENCES "SYSTEM"."product" ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table customer
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."customer" ADD CONSTRAINT "FKauxmhcwj8pwtju2xah9viynt7" FOREIGN KEY ("account_id")
	  REFERENCES "SYSTEM"."account" ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table order
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."order" ADD CONSTRAINT "FKt1vr175eqvalqdmx5x8ol0jo9" FOREIGN KEY ("account_id")
	  REFERENCES "SYSTEM"."customer" ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table orderdetail
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."orderdetail" ADD CONSTRAINT "FKbwstmjq5vwnhyk42guy4ptq1t" FOREIGN KEY ("product_id")
	  REFERENCES "SYSTEM"."product" ("id") ENABLE;
  ALTER TABLE "SYSTEM"."orderdetail" ADD CONSTRAINT "FKt5tduhnftv4ak9fff8kjhpfo7" FOREIGN KEY ("order_id")
	  REFERENCES "SYSTEM"."order" ("id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table product
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."product" ADD CONSTRAINT "FK7l29ekt1x29jup80y2iigimyy" FOREIGN KEY ("category_id")
	  REFERENCES "SYSTEM"."category" ("id") ENABLE;
  ALTER TABLE "SYSTEM"."product" ADD CONSTRAINT "FKouxxq7leu3ubng5ei1qy6peym" FOREIGN KEY ("supplier_id")
	  REFERENCES "SYSTEM"."supplier" ("id") ENABLE;


--Account
--password son123
Insert into "SYSTEM"."account" ("id","username","password","role","status") values (1,'son123','$2a$10$1iPRe.XiaFouqQsS3J752ORjGBqDYOWwQ2oJEWElzEtS177ejAbee','user','Active');
--password manh123
Insert into "SYSTEM"."account" ("id","username","password","role","status") values (2,'manh123','$2a$10$0oJJb750oXRn/yHllXa6au6KZHetLwe9KjbPR075FytXsByQvnDBu','user','Active');
--password hoang123
Insert into "SYSTEM"."account" ("id","username","password","role","status") values (3,'hoang123','$2a$10$5pOyN2I9xn9xh1LB1YkFl.2uUepRbYdijh4J71m/Zib2JtME8uWGW','user','Active');
--password van123
Insert into "SYSTEM"."account" ("id","username","password","role","status") values (4,'van123','$2a$10$A/a/D1QZSIjGR7/ygzd7pOapckB0qhHQzq/0/9OLa8ZaWV2LoZj4m','user','Active');
--password thanh123
Insert into "SYSTEM"."account" ("id","username","password","role","status") values (5,'thanh123','$2a$10$DSBUnz5voH1WZarLg/IsRu8nywU98tPSuRehQ.HrpYdb/PJx8kOJi','user','Active');
--password admin123
Insert into "SYSTEM"."account" ("id","username","password","role","status") values (6,'admin','$2a$10$OSYCi46j/gloVT688VoPbecsUwF3MwNpOf7QSzG8bwYImSLoHvJDW','admin','Active');

--Customer
--type: 0:normal; 1-VIP
Insert into "SYSTEM"."customer" ("id","name","age","gender","address","phone","email","type","status","account_id") values (1,'Ly Truong Son',18,'Male','333, Xo Viet Nghe Tinh, Binh Thanh District, Ho Chi Minh city, Viet Nam','0981761930','sontruong4200@gmail.com',0,'Active',1);
Insert into "SYSTEM"."customer" ("id","name","age","gender","address","phone","email","type","status","account_id") values (2,'Nguyen Duc Manh',18,'Male','123, Ho Xuan Huong, Ha Noi, Viet Nam','0968746560','ducmanh@gmail.com',0,'Active',2);
Insert into "SYSTEM"."customer" ("id","name","age","gender","address","phone","email","type","status","account_id") values (3,'Ngo Minh Hoang',18,'Male','223, Nguyen Trai, Binh Thanh, Ho Chi Minh city, Viet Nam','0967107960','ngohoang@gmail.com',0,'Active',3);
Insert into "SYSTEM"."customer" ("id","name","age","gender","address","phone","email","type","status","account_id") values (4,'Nguyen Dang Khanh Van',18,'Male','110, Le Thanh, Thu Dau Mot City , Viet Nam','0125458744','van@gmail.com',0,'Active',4);
Insert into "SYSTEM"."customer" ("id","name","age","gender","address","phone","email","type","status","account_id") values (5,'Nguyen Le Bao Thanh',18,'Male','110, Le Thanh, Thu Duc City , Viet Nam','0125098737','thanh@gmail.com',0,'Active',5);

--category
Insert into "SYSTEM"."category" ("id","name","description","status") values (1,'Keyboard','Keyboard','Available');
Insert into "SYSTEM"."category" ("id","name","description","status") values (2,'Laptop','Laptop for gamers','Available');
Insert into "SYSTEM"."category" ("id","name","description","status") values (3,'Mouse','Mouse type wireless use for gaming','Available');

--product
Insert into "SYSTEM"."product" ("id","name","price","sale_off","status","image","amount","description","category_id") values (1,'Logitech G Pro X Superlight Wireless Red',176,0.0,'Unavailable','https://res.cloudinary.com/doj6jxrnf/image/upload/v1667308392/IMG/chuot_logitech_do_xb5bjj.jpg',0,'Logitech G Pro X Superlight Wireless Red',3);
Insert into "SYSTEM"."product" ("id","name","price","sale_off","status","image","amount","description","category_id") values (2,'Fuhlen G90 Pro X',18.1,0.0,'Available','https://res.cloudinary.com/doj6jxrnf/image/upload/v1667308392/IMG/chuot_fulhen_sbxsuw.jpg',100,'Fuhlen, a gaming gear brand that is trusted by many gamers thanks to its perfection and affordable price segment. And in the gaming mouse segment, Fuhlen made a strong impression with G90 and G90 Pro products',3);
Insert into "SYSTEM"."product" ("id","name","price","sale_off","status","image","amount","description","category_id") values (3,'Laptop ASUS TUF Gaming F15 FX506HC HN144W',899.95,0.0,'Available','https://res.cloudinary.com/doj6jxrnf/image/upload/v1667308394/IMG/lapASus_pbw3xf.jpg',10,'ASUS TUF Gaming F15 FX506HC HN144W laptop has a very unique design with mysterious Graphite Black color. Equipped with a great configuration from top components for a great product. This promises to be a product that bombards the upcoming gamer market.',2);
Insert into "SYSTEM"."product" ("id","name","price","sale_off","status","image","amount","description","category_id") values (4,'CoolerMaster MM711 Retro',59.99,0.0,'Available','https://res.cloudinary.com/doj6jxrnf/image/upload/v1667308392/IMG/chuot_coolermt_mtzjuw.jpg',1,'Limited production',3);
Insert into "SYSTEM"."product" ("id","name","price","sale_off","status","image","amount","description","category_id") values (5,'AKKO RG325 Dragon Ball Z – Goku',49,0.0,'Available','https://res.cloudinary.com/doj6jxrnf/image/upload/v1667308392/IMG/chuot_aku_goku_lib8jy.jpg',50,'Akko\"s collaboration with Toei Animation author on the character Goku. The cheap gaming mouse model RG325 with SONGOKU version brings the color tone of the extremely lovely Songoku baby monkey.',3);
Insert into "SYSTEM"."product" ("id","name","price","sale_off","status","image","amount","description","category_id") values (6,'HyperX Alloy Origins 60 Pink Machanical Keyboard',99.95,0.0,'Available','https://res.cloudinary.com/doj6jxrnf/image/upload/v1667308393/IMG/hypex1_uk4clx.jpg',50,'Manufacturer Kingston, Model HyperX Alloy Origins 60 Pink Layout 60% key Pink',1);
Insert into "SYSTEM"."product" ("id","name","price","sale_off","status","image","amount","description","category_id") values (7,'Laptop gaming MSI GF63 Thin 11SC 665VN',683.99,0.0,'Available','https://res.cloudinary.com/doj6jxrnf/image/upload/v1667308394/IMG/lapmsi_hrhmoh.jpg',5,'The MSI GF63 Thin 11SC=665VN gaming laptop has a surprisingly thin and light design, which is rare on conventional gaming laptops. This helps to strip away the aggressive look and replace it with a luxurious and gaming beauty.',2);
Insert into "SYSTEM"."product" ("id","name","price","sale_off","status","image","amount","description","category_id") values (8,'Laptop gaming Acer Aspire 7 A715 75G 58U4',800,0.0,'Available','https://res.cloudinary.com/doj6jxrnf/image/upload/v1667308393/IMG/lapacer_kkd2u3.jpg',3,'As the best cheap gaming laptop in the segment, Acer Aspire 7 A715 75G 58U4 is equipped with GTX 1650 4GB GDDR6 graphics card, 10th generation Intel Core i5 processor',2);
Insert into "SYSTEM"."product" ("id","name","price","sale_off","status","image","amount","description","category_id") values (9,'Fuhlen Eraser Mechanical Keyboard',31.77,0.0,'Available','https://res.cloudinary.com/doj6jxrnf/image/upload/v1667308393/IMG/fulen_2_r3hhfz.png',20,'Fuhlen is one of the famous brands when it comes to bringing to consumers genuine, quality gaming gear products at very reasonable prices. With product lines that have created brands such as fuhlen mice, gaming headsets, mouse pads and keyboard lines',1);
Insert into "SYSTEM"."product" ("id","name","price","sale_off","status","image","amount","description","category_id") values (10,'Mechanical Keyboard Fuhlen D87s RGB',33.5,0.0,'Available','https://res.cloudinary.com/doj6jxrnf/image/upload/v1667308392/IMG/fulen_1_tosgtp.png',11,'Fuhlen D87s RGB is one of the cheap mechanical keyboards for students = students and general users. With a compact Tenkeyless design, RGB led lighting system with many different sparkling effects, etc. To fully immerse players in the game Fuhlen D87s RGB ',1);
Insert into "SYSTEM"."product" ("id","name","price","sale_off","status","image","amount","description","category_id") values (11,'Laptop gaming HP Victus 16 d0294TX 5Z9R5PA',850,0.0,'Available','https://res.cloudinary.com/doj6jxrnf/image/upload/v1667308394/IMG/laphp_cipvyj.jpg',8,'HP Victus 16 d0294TX 5Z9R5PA gaming laptop has just released technology with an impressive appearance and super performance.',2);
Insert into "SYSTEM"."product" ("id","name","price","sale_off","status","image","amount","description","category_id") values (12,'Machanical Keyboard Corsair K100 RGB',249.5,0.0,'Available','https://res.cloudinary.com/doj6jxrnf/image/upload/v1667308393/IMG/KB_consair_hozsj7.jpg',30,'Corsair K100 RGB mechanical gaming keyboard has a metal keyboard frame, the surface is covered with a layer of scratched aluminum, skillfully and delicately machined to fit the switch pins, creating a comfortable and solid feeling. , good protection for ',1);

--order
Insert into "SYSTEM"."order" ("id","address","phone","order_date","vat","safe_off","status","state","total_price","payment_type","account_id") values (1,'110, Le Thanh, Thu Dau Mot City , Viet Nam','0125458744',to_timestamp('01-NOV-22 10.47.08.761000000 PM','DD-MON-RR HH.MI.SSXFF AM'),0.0,0.0,'Pending',0,127.09,1,1);
Insert into "SYSTEM"."order" ("id","address","phone","order_date","vat","safe_off","status","state","total_price","payment_type","account_id") values (2,'123, Ho Xuan Huong, Ha Noi, Viet Nam','0968746560',to_timestamp('11-OCT-22 10.48.14.460000000 PM','DD-MON-RR HH.MI.SSXFF AM'),0.0,0.0,'Completed',1,176,1,3);
Insert into "SYSTEM"."order" ("id","address","phone","order_date","vat","safe_off","status","state","total_price","payment_type","account_id") values (3,'230, Doan Van Bo, 4 District, Ho Chi Minh City, Viet Nam','0987145255',to_timestamp('28-OCT-22 10.50.10.991000000 PM','DD-MON-RR HH.MI.SSXFF AM'),0.0,0.0,'Processing',0,1650,1,4);
Insert into "SYSTEM"."order" ("id","address","phone","order_date","vat","safe_off","status","state","total_price","payment_type","account_id") values (4,'320, Le Van Si street, Binh Tan District, Ho Chi Minh City, Viet Nam ','0987145245',to_timestamp('13-OCT-22 10.51.06.946000000 PM','DD-MON-RR HH.MI.SSXFF AM'),0.0,0.0,'Completed',1,63.54,1,4);

--orderdetail
Insert into "SYSTEM"."orderdetail" ("id","amount","product_price","product_id","order_id") values (1,1,18.1,2,1);
Insert into "SYSTEM"."orderdetail" ("id","amount","product_price","product_id","order_id") values (2,2,31.77,9,4);
Insert into "SYSTEM"."orderdetail" ("id","amount","product_price","product_id","order_id") values (3,1,49,5,1);
Insert into "SYSTEM"."orderdetail" ("id","amount","product_price","product_id","order_id") values (4,1,59.99,4,1);
Insert into "SYSTEM"."orderdetail" ("id","amount","product_price","product_id","order_id") values (5,1,176,1,1);
Insert into "SYSTEM"."orderdetail" ("id","amount","product_price","product_id","order_id") values (6,1,800,8,3);
Insert into "SYSTEM"."orderdetail" ("id","amount","product_price","product_id","order_id") values (7,1,850,11,3);

--comment
Insert into "SYSTEM"."comment" ("id","content","evaluate","product_id","customer_id") values (1,'i love it','Very good',1,1);
Insert into "SYSTEM"."comment" ("id","content","evaluate","product_id","customer_id") values (2,'It works very well','Good',7,2);
Insert into "SYSTEM"."comment" ("id","content","evaluate","product_id","customer_id") values (3,'Its so bad to me','Bad',12,1);

