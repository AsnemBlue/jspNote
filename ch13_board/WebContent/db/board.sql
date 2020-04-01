DROP TABLE BOARD;
CREATE TABLE BOARD(
    NUM NUMBER(5),
    WRITER VARCHAR2(30) NOT NULL,       --�۹�ȣ
    SUBJECT VARCHAR2(100) NOT NULL,     --�ۼ���
    CONTENT VARCHAR2(1000) NOT NULL,    --������
    EMAIL VARCHAR2(30),                 --�ۼ��ڸ���
    HIT NUMBER(5) DEFAULT 0,            --��ȸ��
    PW VARCHAR2(30) NOT NULL,           --�ۻ��� �� �� ��й�ȣ
    REF NUMBER(5) NOT NULL,             --�� �׷�(DESC)
    RE_STEP NUMBER(5) NOT NULL,         --���� �� �׷쳢�� ��� ����(����:0)
    RE_LEVEL NUMBER(5) NOT NULL,        --�亯�鿩����(����:0)
    IP VARCHAR2(20) NOT NULL,            --�ۼ����� IP
    RDATE DATE DEFAULT SYSDATE,         --�۾�����
    PRIMARY KEY(NUM));
    
    SELECT * FROM BOARD;
    ROLLBACK;
    COMMIT;
    --�� ����
    SELECT COUNT(*) CNT FROM BOARD;
    --�� ���
    SELECT * FROM BOARD ORDER BY REF DESC;
    --�۾���
    SELECT NVL(MAX(NUM),0)+1 FROM BOARD;
    INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, PW, REF, RE_STEP, RE_LEVEL, IP)
        VALUES( (SELECT NVL(MAX(NUM),0)+1 FROM BOARD), 'PARK', 'TITLE', '---', NULL, '111', (SELECT NVL(MAX(NUM),0)+1 FROM BOARD), 0, 0, '192.168.20.41');
    SELECT NVL(MAX(RE_STEP),0)+1 FROM BOARD WHERE REF=2;
    UPDATE BOARD SET HIT =100 WHERE NUM=2;
    --�۹�ȣ�� ��(DTO) ��������
    SELECT * FROM BOARD WHERE NUM=1;
    --HIT�ø���
    UPDATE BOARD SET HIT=HIT+235 WHERE NUM=12;
    --�� ����
    UPDATE BOARD SET WRITER = 'KIM', 
                    SUBJECT = 'RETITLE',
                    CONTENT = 'RECONTENT',
                    EMAIL = 'JEENPARK@NAVER.COM',
                    PW = '111',
                    IP = '192.165.20.40'
                    WHERE NUM=2;
    --�� ����
    DELETE FROM BOARD WHERE NUM=1 AND PW='111';
    
    --pagingó��
    --1.��ȸ�� ����
    UPDATE BOARD SET HIT = MOD(NUM,12);
    COMMIT;
    --2.TOP-N����
    SELECT * FROM BOARD ORDER BY REF DESC;
    SELECT ROWNUM RN,A.* FROM (SELECT * FROM BOARD ORDER BY REF DESC) A;   --2�ܰ�
    SELECT * FROM (SELECT ROWNUM RN,A.* FROM (SELECT * FROM BOARD ORDER BY REF DESC) A) WHERE RN BETWEEN 111 AND 120;
    --TOP-N����(listboard(s,e))
    COMMIT;
    --�亯�� ó��
    INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, PW, REF, RE_STEP, RE_LEVEL, IP)
        VALUES( 300, 'KIM', 'TITLE', '---', NULL, '111', 300, 0, 0, '192.168.20.42'); --����
    --300�� �ۿ� ���� �亯
    --�� ref�� ���� ���ۺ��� re_step�� ū ���� ������ �� ���� re_step�� re_step+1
    UPDATE BOARD SET RE_STEP = RE_STEP+1 WHERE REF=300 AND RE_STEP>0;
    --�亯�� ����
    INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, PW, REF, RE_STEP, RE_LEVEL, IP)
        VALUES( (SELECT MAX(NVL(NUM,0))+1 FROM BOARD), 'PARK', 'RE', '---', NULL, '111', 300,
        0+1, 0+1, '192.168.20.42');
    SELECT * FROM BOARD ORDER BY REF DESC, RE_STEP;