/*
 Navicat Premium Data Transfer

 Source Server         : erwef
 Source Server Type    : Oracle
 Source Server Version : 110200
 Source Schema         : DIGITAL1

 Target Server Type    : Oracle
 Target Server Version : 110200
 File Encoding         : 65001

 Date: 31/05/2025 00:33:23
*/


-- ----------------------------
-- Table structure for BRAND
-- ----------------------------
DROP TABLE "DIGITAL1"."BRAND";
CREATE TABLE "DIGITAL1"."BRAND" (
  "BRAND_ID" NUMBER NOT NULL,
  "NAME" VARCHAR2(100 BYTE) NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for FAILED_PARTS_RETURNS
-- ----------------------------
DROP TABLE "DIGITAL1"."FAILED_PARTS_RETURNS";
CREATE TABLE "DIGITAL1"."FAILED_PARTS_RETURNS" (
  "RETURN_ID" NUMBER NOT NULL,
  "REPAIR_PART_USED_ID" NUMBER,
  "RETURN_DATE" DATE DEFAULT SYSDATE

)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for MOBILE_REPAIRS
-- ----------------------------
DROP TABLE "DIGITAL1"."MOBILE_REPAIRS";
CREATE TABLE "DIGITAL1"."MOBILE_REPAIRS" (
  "REPAIR_ID" NUMBER NOT NULL,
  "DEVICE_MODEL" VARCHAR2(100 BYTE),
  "CUSTOMER_NAME" VARCHAR2(100 BYTE),
  "STATUS" VARCHAR2(100 BYTE) DEFAULT 'PENDING',
  "REPAIR_DATE" DATE DEFAULT SYSDATE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for MODEL
-- ----------------------------
DROP TABLE "DIGITAL1"."MODEL";
CREATE TABLE "DIGITAL1"."MODEL" (
  "MODEL_ID" NUMBER NOT NULL,
  "BRAND_ID" NUMBER NOT NULL,
  "NAME" VARCHAR2(100 BYTE) NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for PARTS
-- ----------------------------
DROP TABLE "DIGITAL1"."PARTS";
CREATE TABLE "DIGITAL1"."PARTS" (
  "PART_ID" NUMBER NOT NULL,
  "NAME" VARCHAR2(100 BYTE) NOT NULL,
  "UNIT_COST" NUMBER(10,2) NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for PART_RECEIPTS
-- ----------------------------
DROP TABLE "DIGITAL1"."PART_RECEIPTS";
CREATE TABLE "DIGITAL1"."PART_RECEIPTS" (
  "RECEIPT_ID" NUMBER NOT NULL,
  "SUPPLIER_ID" NUMBER,
  "PART_ID" NUMBER,
  "QUANTITY" NUMBER NOT NULL,
  "RECEIPT_DATE" DATE DEFAULT SYSDATE
,
  "UNIT_COST" NUMBER(10,2),
  "MODEL_ID" NUMBER
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for PART_RECEIPT_STOCK
-- ----------------------------
DROP TABLE "DIGITAL1"."PART_RECEIPT_STOCK";
CREATE TABLE "DIGITAL1"."PART_RECEIPT_STOCK" (
  "STOCK_ID" NUMBER NOT NULL,
  "RECEIPT_ID" NUMBER NOT NULL,
  "QUANTITY_RECEIVED" NUMBER NOT NULL,
  "QUANTITY_USED" NUMBER DEFAULT 0  NOT NULL,
  "LAST_UPDATED" DATE DEFAULT SYSDATE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for REPAIR_PARTS_USED
-- ----------------------------
DROP TABLE "DIGITAL1"."REPAIR_PARTS_USED";
CREATE TABLE "DIGITAL1"."REPAIR_PARTS_USED" (
  "ID" NUMBER NOT NULL,
  "REPAIR_ID" NUMBER,
  "PART_ID" NUMBER,
  "SUPPLIER_ID" NUMBER,
  "QUANTITY_USED" NUMBER NOT NULL,
  "STATUS" VARCHAR2(20 BYTE) DEFAULT 'USED',
  "RECEIPT_ID" NUMBER
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for SUPPLIERS
-- ----------------------------
DROP TABLE "DIGITAL1"."SUPPLIERS";
CREATE TABLE "DIGITAL1"."SUPPLIERS" (
  "SUPPLIER_ID" NUMBER NOT NULL,
  "NAME" VARCHAR2(100 BYTE) NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Table structure for SUPPLIER_PAYMENTS
-- ----------------------------
DROP TABLE "DIGITAL1"."SUPPLIER_PAYMENTS";
CREATE TABLE "DIGITAL1"."SUPPLIER_PAYMENTS" (
  "PAYMENT_ID" NUMBER NOT NULL,
  "SUPPLIER_ID" NUMBER NOT NULL,
  "PAID_AMOUNT" NUMBER(10,2) NOT NULL,
  "PAYMENT_DATE" DATE DEFAULT SYSDATE,
  "REMARKS" VARCHAR2(255 BYTE),
  "PART_USED_ID" NUMBER,
  "REPAIR_ID" NUMBER,
  "REPAIR_STATUS" VARCHAR2(100 BYTE)
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- View structure for VW_AVAILABLE_PARTS_STOCK
-- ----------------------------
CREATE OR REPLACE VIEW "DIGITAL1"."VW_AVAILABLE_PARTS_STOCK" AS SELECT 
    ROWNUM AS ID,
    s.name AS supplier,
    b.name AS brand,
    m.name AS model,
    p.name AS part_name,
    pr.unit_cost AS cost,
    (prs.quantity_received - prs.quantity_used) AS available_quantity
FROM 
    part_receipts pr
JOIN 
    part_receipt_stock prs ON pr.receipt_id = prs.receipt_id
JOIN 
    suppliers s ON pr.supplier_id = s.supplier_id
JOIN 
    parts p ON pr.part_id = p.part_id
JOIN 
    model m ON pr.model_id = m.model_id
JOIN 
    brand b ON m.brand_id = b.brand_id
WHERE 
    (prs.quantity_received - prs.quantity_used) > 0;

-- ----------------------------
-- View structure for VW_COMPLETED_SUPPLIER_PAYMENTS
-- ----------------------------
CREATE OR REPLACE VIEW "DIGITAL1"."VW_COMPLETED_SUPPLIER_PAYMENTS" AS SELECT
    ROWNUM AS id,
    s.name AS supplier,
    b.name AS brand,
    m.name AS model,
    p.name AS part,
    sp.paid_amount AS cost,
    rpu.quantity_used AS quantity,
    sp.payment_date
FROM supplier_payments sp
JOIN suppliers s ON sp.supplier_id = s.supplier_id
JOIN repair_parts_used rpu ON sp.part_used_id = rpu.id
JOIN part_receipts pr ON rpu.receipt_id = pr.receipt_id
JOIN parts p ON pr.part_id = p.part_id
JOIN model m ON pr.model_id = m.model_id
JOIN brand b ON m.brand_id = b.brand_id
WHERE sp.payment_date IS NOT NULL;

-- ----------------------------
-- View structure for VW_PARTS_IN_COUNTER_INVENTORY
-- ----------------------------
CREATE OR REPLACE VIEW "DIGITAL1"."VW_PARTS_IN_COUNTER_INVENTORY" AS SELECT 
    p.part_id, 
    p.name AS part_name,
    NVL(SUM(pr.quantity), 0) -
    NVL((SELECT SUM(rpu.quantity_used) FROM repair_parts_used rpu WHERE rpu.part_id = p.part_id), 0) +
    NVL((SELECT SUM(1) FROM failed_parts_returns fpr 
          JOIN repair_parts_used rpu ON rpu.id = fpr.repair_part_used_id 
         WHERE rpu.part_id = p.part_id), 0) AS current_stock
FROM parts p
LEFT JOIN part_receipts pr ON p.part_id = pr.part_id
GROUP BY p.part_id, p.name;

-- ----------------------------
-- View structure for VW_PARTS_PENDING_IN_SERVICE
-- ----------------------------
CREATE OR REPLACE VIEW "DIGITAL1"."VW_PARTS_PENDING_IN_SERVICE" AS SELECT 
    p.name AS part_name, 
    SUM(rpu.quantity_used) AS pending_quantity
FROM repair_parts_used rpu
JOIN mobile_repairs mr ON rpu.repair_id = mr.repair_id
JOIN parts p ON rpu.part_id = p.part_id
WHERE mr.status = 'PENDING' AND rpu.status = 'USED'
GROUP BY p.name;

-- ----------------------------
-- View structure for VW_PARTS_TO_RETURN
-- ----------------------------
CREATE OR REPLACE VIEW "DIGITAL1"."VW_PARTS_TO_RETURN" AS SELECT 
    s.name AS supplier_name, 
    p.name AS part_name,
    rpu.quantity_used AS quantity_to_return, 
    fpr.return_date
FROM repair_parts_used rpu
JOIN part_receipts pr ON rpu.receipt_id = pr.receipt_id
JOIN suppliers s ON pr.supplier_id = s.supplier_id
JOIN parts p ON pr.part_id = p.part_id
JOIN failed_parts_returns fpr ON rpu.id = fpr.repair_part_used_id;

-- ----------------------------
-- View structure for VW_PART_RECEIPTS_SUMMARY
-- ----------------------------
CREATE OR REPLACE VIEW "DIGITAL1"."VW_PART_RECEIPTS_SUMMARY" AS SELECT
    ROWNUM AS ID,
    summary."SUPPLIERNAME",summary."BRANDNAME",summary."MODELNAME",summary."PARTNAME",summary."TOTALQUANTITYPURCHASED",summary."AVERAGEUNITCOST",summary."MINUNITCOST",summary."MAXUNITCOST",summary."TOTALSPENTONPARTFROMSUPPLIER"
FROM (
    SELECT
        s.NAME AS SupplierName,
        b.NAME AS BrandName,
        m.NAME AS ModelName,
        p.NAME AS PartName,
        SUM(pr.QUANTITY) AS TotalQuantityPurchased,
        TO_CHAR(AVG(pr.UNIT_COST), '9999999990.00') AS AverageUnitCost,
        TO_CHAR(MIN(pr.UNIT_COST), '9999999990.00') AS MinUnitCost,
        TO_CHAR(MAX(pr.UNIT_COST), '9999999990.00') AS MaxUnitCost,
        TO_CHAR(SUM(pr.QUANTITY * pr.UNIT_COST), '9999999990.00') AS TotalSpentOnPartFromSupplier
    FROM
        DIGITAL1.PART_RECEIPTS pr
    JOIN
        DIGITAL1.PARTS p ON pr.PART_ID = p.PART_ID
    JOIN
        DIGITAL1.SUPPLIERS s ON pr.SUPPLIER_ID = s.SUPPLIER_ID
    JOIN
        DIGITAL1.MODEL m ON pr.MODEL_ID = m.MODEL_ID
    JOIN
        DIGITAL1.BRAND b ON m.BRAND_ID = b.BRAND_ID
    GROUP BY
        s.NAME,
        b.NAME,
        m.NAME,
        p.NAME
    ORDER BY
        s.NAME,
        SUM(pr.QUANTITY * pr.UNIT_COST) DESC,
        b.NAME,
        m.NAME,
        p.NAME
) summary;

-- ----------------------------
-- View structure for VW_RETURNED_SPARE_PARTS
-- ----------------------------
CREATE OR REPLACE VIEW "DIGITAL1"."VW_RETURNED_SPARE_PARTS" AS SELECT 
    ROWNUM AS ID,
    s.NAME AS supplier,
    b.NAME AS brand,
    m.NAME AS model,
    p.NAME AS part_name,
    rpu.QUANTITY_USED AS quantity,
    pr.UNIT_COST AS cost,
    fpr.RETURN_DATE
FROM FAILED_PARTS_RETURNS fpr
JOIN REPAIR_PARTS_USED rpu ON fpr.REPAIR_PART_USED_ID = rpu.ID
JOIN PART_RECEIPTS pr ON rpu.RECEIPT_ID = pr.RECEIPT_ID
JOIN SUPPLIERS s ON rpu.SUPPLIER_ID = s.SUPPLIER_ID
JOIN PARTS p ON rpu.PART_ID = p.PART_ID
JOIN MODEL m ON pr.MODEL_ID = m.MODEL_ID
JOIN BRAND b ON m.BRAND_ID = b.BRAND_ID
WHERE fpr.RETURN_DATE IS NOT NULL;

-- ----------------------------
-- View structure for VW_SUPPLIER_BALANCES
-- ----------------------------
CREATE OR REPLACE VIEW "DIGITAL1"."VW_SUPPLIER_BALANCES" AS SELECT 
    s.supplier_id,
    s.name AS supplier_name,
    SUM(rpu.quantity_used * pr.unit_cost) AS total_payable,
    NVL((SELECT SUM(sp.paid_amount) FROM supplier_payments sp WHERE sp.supplier_id = s.supplier_id), 0) AS amount_paid,
    CASE 
        WHEN SUM(rpu.quantity_used * pr.unit_cost) - 
             NVL((SELECT SUM(sp.paid_amount) FROM supplier_payments sp WHERE sp.supplier_id = s.supplier_id), 0) < 0 THEN 0
        ELSE SUM(rpu.quantity_used * pr.unit_cost) - 
             NVL((SELECT SUM(sp.paid_amount) FROM supplier_payments sp WHERE sp.supplier_id = s.supplier_id), 0)
    END AS balance
FROM suppliers s
JOIN part_receipts pr ON s.supplier_id = pr.supplier_id
JOIN repair_parts_used rpu ON rpu.receipt_id = pr.receipt_id AND rpu.status = 'USED'
GROUP BY s.supplier_id, s.name;

-- ----------------------------
-- Sequence structure for SEQ_BRAND
-- ----------------------------
DROP SEQUENCE "DIGITAL1"."SEQ_BRAND";
CREATE SEQUENCE "DIGITAL1"."SEQ_BRAND" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_FAILED_RETURN
-- ----------------------------
DROP SEQUENCE "DIGITAL1"."SEQ_FAILED_RETURN";
CREATE SEQUENCE "DIGITAL1"."SEQ_FAILED_RETURN" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_MODEL
-- ----------------------------
DROP SEQUENCE "DIGITAL1"."SEQ_MODEL";
CREATE SEQUENCE "DIGITAL1"."SEQ_MODEL" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_PART
-- ----------------------------
DROP SEQUENCE "DIGITAL1"."SEQ_PART";
CREATE SEQUENCE "DIGITAL1"."SEQ_PART" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_PART_RECEIPT_STOCK
-- ----------------------------
DROP SEQUENCE "DIGITAL1"."SEQ_PART_RECEIPT_STOCK";
CREATE SEQUENCE "DIGITAL1"."SEQ_PART_RECEIPT_STOCK" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_RECEIPT
-- ----------------------------
DROP SEQUENCE "DIGITAL1"."SEQ_RECEIPT";
CREATE SEQUENCE "DIGITAL1"."SEQ_RECEIPT" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_REPAIR_PART_USED
-- ----------------------------
DROP SEQUENCE "DIGITAL1"."SEQ_REPAIR_PART_USED";
CREATE SEQUENCE "DIGITAL1"."SEQ_REPAIR_PART_USED" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_SUPPLIER
-- ----------------------------
DROP SEQUENCE "DIGITAL1"."SEQ_SUPPLIER";
CREATE SEQUENCE "DIGITAL1"."SEQ_SUPPLIER" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQ_SUPPLIER_PAYMENT
-- ----------------------------
DROP SEQUENCE "DIGITAL1"."SEQ_SUPPLIER_PAYMENT";
CREATE SEQUENCE "DIGITAL1"."SEQ_SUPPLIER_PAYMENT" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SUPPLIER_SEQ
-- ----------------------------
DROP SEQUENCE "DIGITAL1"."SUPPLIER_SEQ";
CREATE SEQUENCE "DIGITAL1"."SUPPLIER_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Primary Key structure for table BRAND
-- ----------------------------
ALTER TABLE "DIGITAL1"."BRAND" ADD CONSTRAINT "SYS_C007120" PRIMARY KEY ("BRAND_ID");

-- ----------------------------
-- Uniques structure for table BRAND
-- ----------------------------
ALTER TABLE "DIGITAL1"."BRAND" ADD CONSTRAINT "SYS_C007121" UNIQUE ("NAME") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table BRAND
-- ----------------------------
ALTER TABLE "DIGITAL1"."BRAND" ADD CONSTRAINT "SYS_C007119" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table FAILED_PARTS_RETURNS
-- ----------------------------
ALTER TABLE "DIGITAL1"."FAILED_PARTS_RETURNS" ADD CONSTRAINT "SYS_C007083" PRIMARY KEY ("RETURN_ID");

-- ----------------------------
-- Primary Key structure for table MOBILE_REPAIRS
-- ----------------------------
ALTER TABLE "DIGITAL1"."MOBILE_REPAIRS" ADD CONSTRAINT "SYS_C007076" PRIMARY KEY ("REPAIR_ID");

-- ----------------------------
-- Primary Key structure for table MODEL
-- ----------------------------
ALTER TABLE "DIGITAL1"."MODEL" ADD CONSTRAINT "SYS_C007124" PRIMARY KEY ("MODEL_ID");

-- ----------------------------
-- Uniques structure for table MODEL
-- ----------------------------
ALTER TABLE "DIGITAL1"."MODEL" ADD CONSTRAINT "UQ_MODEL" UNIQUE ("BRAND_ID", "NAME") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table MODEL
-- ----------------------------
ALTER TABLE "DIGITAL1"."MODEL" ADD CONSTRAINT "SYS_C007122" CHECK ("BRAND_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "DIGITAL1"."MODEL" ADD CONSTRAINT "SYS_C007123" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table PARTS
-- ----------------------------
ALTER TABLE "DIGITAL1"."PARTS" ADD CONSTRAINT "SYS_C007070" PRIMARY KEY ("PART_ID");

-- ----------------------------
-- Uniques structure for table PARTS
-- ----------------------------
ALTER TABLE "DIGITAL1"."PARTS" ADD CONSTRAINT "nam" UNIQUE ("NAME") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table PARTS
-- ----------------------------
ALTER TABLE "DIGITAL1"."PARTS" ADD CONSTRAINT "SYS_C007068" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "DIGITAL1"."PARTS" ADD CONSTRAINT "SYS_C007069" CHECK ("UNIT_COST" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table PART_RECEIPTS
-- ----------------------------
ALTER TABLE "DIGITAL1"."PART_RECEIPTS" ADD CONSTRAINT "SYS_C007072" PRIMARY KEY ("RECEIPT_ID");

-- ----------------------------
-- Checks structure for table PART_RECEIPTS
-- ----------------------------
ALTER TABLE "DIGITAL1"."PART_RECEIPTS" ADD CONSTRAINT "SYS_C007071" CHECK ("QUANTITY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table PART_RECEIPTS
-- ----------------------------
CREATE TRIGGER "DIGITAL1"."TRG_INIT_PART_STOCK" AFTER INSERT ON "DIGITAL1"."PART_RECEIPTS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
BEGIN
  INSERT INTO DIGITAL1.PART_RECEIPT_STOCK (
    STOCK_ID, RECEIPT_ID, QUANTITY_RECEIVED
  ) VALUES (
    DIGITAL1.SEQ_PART_RECEIPT_STOCK.NEXTVAL,
    :NEW.RECEIPT_ID,
    :NEW.QUANTITY
  );
END;
/

-- ----------------------------
-- Primary Key structure for table PART_RECEIPT_STOCK
-- ----------------------------
ALTER TABLE "DIGITAL1"."PART_RECEIPT_STOCK" ADD CONSTRAINT "SYS_C007116" PRIMARY KEY ("STOCK_ID");

-- ----------------------------
-- Uniques structure for table PART_RECEIPT_STOCK
-- ----------------------------
ALTER TABLE "DIGITAL1"."PART_RECEIPT_STOCK" ADD CONSTRAINT "SYS_C007117" UNIQUE ("RECEIPT_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table PART_RECEIPT_STOCK
-- ----------------------------
ALTER TABLE "DIGITAL1"."PART_RECEIPT_STOCK" ADD CONSTRAINT "SYS_C007113" CHECK ("RECEIPT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "DIGITAL1"."PART_RECEIPT_STOCK" ADD CONSTRAINT "SYS_C007114" CHECK ("QUANTITY_RECEIVED" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "DIGITAL1"."PART_RECEIPT_STOCK" ADD CONSTRAINT "SYS_C007115" CHECK ("QUANTITY_USED" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table REPAIR_PARTS_USED
-- ----------------------------
ALTER TABLE "DIGITAL1"."REPAIR_PARTS_USED" ADD CONSTRAINT "SYS_C007079" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table REPAIR_PARTS_USED
-- ----------------------------
ALTER TABLE "DIGITAL1"."REPAIR_PARTS_USED" ADD CONSTRAINT "CHK_PART_STATUS" CHECK (status IN ('USED', 'FAILED')) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "DIGITAL1"."REPAIR_PARTS_USED" ADD CONSTRAINT "SYS_C007077" CHECK ("QUANTITY_USED" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table REPAIR_PARTS_USED
-- ----------------------------
CREATE TRIGGER "DIGITAL1"."TRG_ACC_SUPPLIER_LIABILITY" AFTER INSERT ON "DIGITAL1"."REPAIR_PARTS_USED" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW WHEN (NEW.status = 'USED' AND NEW.receipt_id IS NOT NULL) 
DECLARE
    v_supplier_id   NUMBER;
    v_unit_cost     NUMBER(10,2);
    v_repair_status VARCHAR2(100);
BEGIN
    -- Get supplier and unit cost from part_receipts
    SELECT pr.supplier_id, pr.unit_cost
    INTO v_supplier_id, v_unit_cost
    FROM DIGITAL1.part_receipts pr
    WHERE pr.receipt_id = :NEW.receipt_id;

    -- Get status from MOBILE_REPAIRS
    SELECT mr.status
    INTO v_repair_status
    FROM DIGITAL1.MOBILE_REPAIRS mr
    WHERE mr.repair_id = :NEW.repair_id;

    -- Insert into supplier_payments including repair_id and repair_status
    INSERT INTO DIGITAL1.supplier_payments (
        payment_id,
        supplier_id,
        paid_amount,
        payment_date,
        remarks,
        part_used_id,
        repair_id,
        repair_status  -- new column
    )
    VALUES (
        DIGITAL1.seq_supplier_payment.NEXTVAL,
        v_supplier_id,
        :NEW.quantity_used * v_unit_cost,
        NULL,
        'Accrued liability for part usage (Repair ID: ' || :NEW.repair_id || ')',
        :NEW.id,
        :NEW.repair_id,
        v_repair_status
    );
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Missing data: No matching receipt or repair record found');
END;
/
CREATE TRIGGER "DIGITAL1"."TRG_DEDUCT_RECEIPT_STOCK" BEFORE INSERT ON "DIGITAL1"."REPAIR_PARTS_USED" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
  v_available NUMBER;
BEGIN
  SELECT (QUANTITY_RECEIVED - QUANTITY_USED)
  INTO v_available
  FROM DIGITAL1.PART_RECEIPT_STOCK
  WHERE RECEIPT_ID = :NEW.RECEIPT_ID
  FOR UPDATE;

  IF :NEW.QUANTITY_USED > v_available THEN
    RAISE_APPLICATION_ERROR(-20001, 'Not enough stock available for this receipt.');
  END IF;

  UPDATE DIGITAL1.PART_RECEIPT_STOCK
  SET QUANTITY_USED = QUANTITY_USED + :NEW.QUANTITY_USED,
      LAST_UPDATED = SYSDATE
  WHERE RECEIPT_ID = :NEW.RECEIPT_ID;
END;
/
CREATE TRIGGER "DIGITAL1"."TRG_FAILED_PART_RETURN" AFTER INSERT OR UPDATE ON "DIGITAL1"."REPAIR_PARTS_USED" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW WHEN (NEW.status = 'FAILED') 
BEGIN
    INSERT INTO failed_parts_returns (return_id, repair_part_used_id, return_date)
    VALUES (seq_failed_return.NEXTVAL, :NEW.id, NULL);
END;
/
CREATE TRIGGER "DIGITAL1"."TRG_RESTORE_RECEIPT_STOCK" BEFORE DELETE ON "DIGITAL1"."REPAIR_PARTS_USED" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
BEGIN
  UPDATE DIGITAL1.PART_RECEIPT_STOCK
  SET QUANTITY_USED = QUANTITY_USED - :OLD.QUANTITY_USED,
      LAST_UPDATED = SYSDATE
  WHERE RECEIPT_ID = :OLD.RECEIPT_ID;
END;
/
CREATE TRIGGER "DIGITAL1"."TRG_REVERT_PART_STATUS" AFTER UPDATE ON "DIGITAL1"."REPAIR_PARTS_USED" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
    v_supplier_id   NUMBER;
    v_unit_cost     NUMBER(10,2);
    v_repair_status VARCHAR2(100);
BEGIN
    -- Only execute if the status actually changed and new status is not null
    IF :OLD.status != :NEW.status AND :NEW.status IS NOT NULL THEN

        -- Case 1: FAILED → USED (Undo failed return, add liability again)
        IF :OLD.status = 'FAILED' AND :NEW.status = 'USED' THEN
            -- Delete failed return record
            DELETE FROM DIGITAL1.failed_parts_returns
            WHERE repair_part_used_id = :NEW.id;

            -- Fetch supplier and unit cost from part_receipts
            SELECT pr.supplier_id, pr.unit_cost
            INTO v_supplier_id, v_unit_cost
            FROM DIGITAL1.part_receipts pr
            WHERE pr.receipt_id = :NEW.receipt_id;

            -- Fetch repair status from MOBILE_REPAIRS
            SELECT status
            INTO v_repair_status
            FROM DIGITAL1.MOBILE_REPAIRS
            WHERE repair_id = :NEW.repair_id;

            -- Re-insert supplier payment
            INSERT INTO DIGITAL1.supplier_payments (
                payment_id,
                supplier_id,
                paid_amount,
                payment_date,
                remarks,
                part_used_id,
                repair_id,
                repair_status
            )
            VALUES (
                DIGITAL1.seq_supplier_payment.NEXTVAL,
                v_supplier_id,
                :NEW.quantity_used * v_unit_cost,
                NULL,
                'Accrued liability for part usage (Repair ID: ' || :NEW.repair_id || ')',
                :NEW.id,
                :NEW.repair_id,
                v_repair_status
            );

        -- Case 2: USED → FAILED (remove liability)
        ELSIF :OLD.status = 'USED' AND :NEW.status = 'FAILED' THEN
            DELETE FROM DIGITAL1.supplier_payments
            WHERE part_used_id = :NEW.id
              AND payment_date IS NULL; -- Only delete unpaid liabilities
        END IF;
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Missing data for receipt or repair ID: ' || :NEW.receipt_id);
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Trigger error: ' || SQLERRM);
END;
/
CREATE TRIGGER "DIGITAL1"."TRG_UPDATE_REPAIR_PARTS_USED" BEFORE UPDATE OF "QUANTITY_USED" ON "DIGITAL1"."REPAIR_PARTS_USED" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
  v_delta NUMBER;
  v_available NUMBER;
BEGIN
  v_delta := :NEW.QUANTITY_USED - :OLD.QUANTITY_USED;

  IF v_delta = 0 THEN
    RETURN;
  END IF;

  SELECT (QUANTITY_RECEIVED - QUANTITY_USED)
  INTO v_available
  FROM DIGITAL1.PART_RECEIPT_STOCK
  WHERE RECEIPT_ID = :NEW.RECEIPT_ID
  FOR UPDATE;

  IF v_delta > 0 AND v_delta > v_available THEN
    RAISE_APPLICATION_ERROR(-20003, 'Not enough stock for updated quantity.');
  END IF;

  UPDATE DIGITAL1.PART_RECEIPT_STOCK
  SET QUANTITY_USED = QUANTITY_USED + v_delta,
      LAST_UPDATED = SYSDATE
  WHERE RECEIPT_ID = :NEW.RECEIPT_ID;
END;
/

-- ----------------------------
-- Primary Key structure for table SUPPLIERS
-- ----------------------------
ALTER TABLE "DIGITAL1"."SUPPLIERS" ADD CONSTRAINT "SYS_C007067" PRIMARY KEY ("SUPPLIER_ID");

-- ----------------------------
-- Checks structure for table SUPPLIERS
-- ----------------------------
ALTER TABLE "DIGITAL1"."SUPPLIERS" ADD CONSTRAINT "SYS_C007066" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SUPPLIER_PAYMENTS
-- ----------------------------
ALTER TABLE "DIGITAL1"."SUPPLIER_PAYMENTS" ADD CONSTRAINT "SYS_C007103" PRIMARY KEY ("PAYMENT_ID");

-- ----------------------------
-- Checks structure for table SUPPLIER_PAYMENTS
-- ----------------------------
ALTER TABLE "DIGITAL1"."SUPPLIER_PAYMENTS" ADD CONSTRAINT "SYS_C007101" CHECK ("SUPPLIER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "DIGITAL1"."SUPPLIER_PAYMENTS" ADD CONSTRAINT "SYS_C007102" CHECK ("PAID_AMOUNT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table FAILED_PARTS_RETURNS
-- ----------------------------
ALTER TABLE "DIGITAL1"."FAILED_PARTS_RETURNS" ADD CONSTRAINT "SYS_C007084" FOREIGN KEY ("REPAIR_PART_USED_ID") REFERENCES "DIGITAL1"."REPAIR_PARTS_USED" ("ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table MODEL
-- ----------------------------
ALTER TABLE "DIGITAL1"."MODEL" ADD CONSTRAINT "FK_MODEL_BRAND" FOREIGN KEY ("BRAND_ID") REFERENCES "DIGITAL1"."BRAND" ("BRAND_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table PART_RECEIPTS
-- ----------------------------
ALTER TABLE "DIGITAL1"."PART_RECEIPTS" ADD CONSTRAINT "SYS_C007130" FOREIGN KEY ("MODEL_ID") REFERENCES "DIGITAL1"."MODEL" ("MODEL_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "DIGITAL1"."PART_RECEIPTS" ADD CONSTRAINT "SYS_C007148" FOREIGN KEY ("SUPPLIER_ID") REFERENCES "DIGITAL1"."SUPPLIERS" ("SUPPLIER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "DIGITAL1"."PART_RECEIPTS" ADD CONSTRAINT "SYS_C007149" FOREIGN KEY ("PART_ID") REFERENCES "DIGITAL1"."PARTS" ("PART_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table PART_RECEIPT_STOCK
-- ----------------------------
ALTER TABLE "DIGITAL1"."PART_RECEIPT_STOCK" ADD CONSTRAINT "FK_PART_RECEIPT_STOCK_RECEIPT" FOREIGN KEY ("RECEIPT_ID") REFERENCES "DIGITAL1"."PART_RECEIPTS" ("RECEIPT_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table REPAIR_PARTS_USED
-- ----------------------------
ALTER TABLE "DIGITAL1"."REPAIR_PARTS_USED" ADD CONSTRAINT "SYS_C007080" FOREIGN KEY ("REPAIR_ID") REFERENCES "DIGITAL1"."MOBILE_REPAIRS" ("REPAIR_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "DIGITAL1"."REPAIR_PARTS_USED" ADD CONSTRAINT "SYS_C007141" FOREIGN KEY ("RECEIPT_ID") REFERENCES "DIGITAL1"."PART_RECEIPTS" ("RECEIPT_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "DIGITAL1"."REPAIR_PARTS_USED" ADD CONSTRAINT "SYS_C007160" FOREIGN KEY ("SUPPLIER_ID") REFERENCES "DIGITAL1"."SUPPLIERS" ("SUPPLIER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "DIGITAL1"."REPAIR_PARTS_USED" ADD CONSTRAINT "SYS_C007161" FOREIGN KEY ("PART_ID") REFERENCES "DIGITAL1"."PARTS" ("PART_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table SUPPLIER_PAYMENTS
-- ----------------------------
ALTER TABLE "DIGITAL1"."SUPPLIER_PAYMENTS" ADD CONSTRAINT "FK_SUPPLIER_PAYMENT" FOREIGN KEY ("SUPPLIER_ID") REFERENCES "DIGITAL1"."SUPPLIERS" ("SUPPLIER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "DIGITAL1"."SUPPLIER_PAYMENTS" ADD CONSTRAINT "SYS_C007143" FOREIGN KEY ("PART_USED_ID") REFERENCES "DIGITAL1"."REPAIR_PARTS_USED" ("ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
