DROP TABLE MEMBER CASCADE CONSTRAINTS;
CREATE TABLE MEMBER(
    ID VARCHAR2(20),
    NAME VARCHAR2(20) NOT NULL,
    PW VARCHAR2(20) NOT NULL,
    PHONE1 VARCHAR2(10),
    PHONE2 VARCHAR2(10),
    PHONE3 VARCHAR2(10),
    GENDER VARCHAR2(10),
    PRIMARY KEY(ID)
);
--ȸ������
INSERT INTO MEMBER VALUES('AAA','HONG','111','02','888','9999','f');
SELECT * FROM MEMBER;
--�α���(ID PW)
--1.ID,PW MATCHING
--2.ID=> PERSON INFO=>SESSION
SELECT * FROM MEMBER WHERE ID ='AAA' AND PW='111';
--ȸ����������
UPDATE MEMBER SET NAME='HONG', PW='111', PHONE1='010',PHONE2='8888',PHONE3='8888',GENDER='m' WHERE ID='AAA';
COMMIT;