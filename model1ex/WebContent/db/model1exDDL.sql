DROP TABLE FILEBOARD;
DROP TABLE CUSTOMER;
DROP TABLE BOOK;
DROP SEQUENCE BOOK_SEQ;
CREATE SEQUENCE BOOK_SEQ MAXVALUE 9999999 NOCACHE NOCYCLE;
CREATE TABLE BOOK(
    BID NUMBER(7),
    BTITLE VARCHAR2(30) NOT NULL,
    BPRICE NUMBER(7) NOT NULL,
    BIMAGE1 VARCHAR2(30) DEFAULT 'NOTHING.JPG' NOT NULL,
    BIMAGE2 VARCHAR2(30) DEFAULT 'noImg.png' NOT NULL,
    BCONTENT VARCHAR2(4000),
    BDISCOUNT NUMBER(3) NOT NULL,
    BRDATE DATE DEFAULT SYSDATE,
    PRIMARY KEY(BID));
CREATE TABLE CUSTOMER(
	CID VARCHAR2(50) PRIMARY KEY,
	CPW VARCHAR2(50) NOT NULL,
	CNAME VARCHAR2(50) NOT NULL,
	CTEL VARCHAR2(50) NOT NULL,
	CEMAIL VARCHAR2(50),
	CADDRESS VARCHAR2(250),
	CBIRTH DATE NOT NULL,
	CGENDER VARCHAR2(10) NOT NULL,
	CRDATE DATE DEFAULT SYSDATE
);
DROP SEQUENCE FILEBOARD_SEQ;
CREATE SEQUENCE FILEBOARD_SEQ MAXVALUE 9999999 NOCACHE NOCYCLE; 
CREATE TABLE FILEBOARD(
    FNUM NUMBER(7),
    CID VARCHAR2(50),
    FSUBJECT VARCHAR2(250) NOT NULL,
    FCONTENT VARCHAR2(3000),
    FFILENAME VARCHAR2(50),
    FPW VARCHAR2(50) NOT NULL,
    FHIT NUMBER(7) DEFAULT 0,
    FREF NUMBER(7) NOT NULL,
    FRE_STEP NUMBER(7) NOT NULL,
    FRE_LEVEL NUMBER(7) NOT NULL, 
    FIP VARCHAR2(50) NOT NULL,
    FRDATE DATE DEFAULT SYSDATE,
    PRIMARY KEY(FNUM),
    FOREIGN KEY(CID) REFERENCES CUSTOMER(CID));