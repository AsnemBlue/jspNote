DROP TABLE BOARD;
CREATE TABLE BOARD(
    NUM NUMBER(5),
    WRITER VARCHAR2(30) NOT NULL,       --글번호
    SUBJECT VARCHAR2(100) NOT NULL,     --작성자
    CONTENT VARCHAR2(1000) NOT NULL,    --글제목
    EMAIL VARCHAR2(30),                 --작성자메일
    HIT NUMBER(5) DEFAULT 0,            --조회수
    PW VARCHAR2(30) NOT NULL,           --글삭제 시 쓸 비밀번호
    REF NUMBER(5) NOT NULL,             --글 그룹(DESC)
    RE_STEP NUMBER(5) NOT NULL,         --같은 글 그룹끼리 출력 순서(원글:0)
    RE_LEVEL NUMBER(5) NOT NULL,        --답변들여쓰기(원글:0)
    IP VARCHAR2(20) NOT NULL,            --작성자의 IP
    RDATE DATE DEFAULT SYSDATE,         --글쓴시점
    PRIMARY KEY(NUM));
    
    SELECT * FROM BOARD;
    ROLLBACK;
    COMMIT;
    --글 갯수
    SELECT COUNT(*) CNT FROM BOARD;
    --글 목록
    SELECT * FROM BOARD ORDER BY REF DESC;
    --글쓰기
    SELECT NVL(MAX(NUM),0)+1 FROM BOARD;
    INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, PW, REF, RE_STEP, RE_LEVEL, IP)
        VALUES( (SELECT NVL(MAX(NUM),0)+1 FROM BOARD), 'PARK', 'TITLE', '---', NULL, '111', (SELECT NVL(MAX(NUM),0)+1 FROM BOARD), 0, 0, '192.168.20.41');
    SELECT NVL(MAX(RE_STEP),0)+1 FROM BOARD WHERE REF=2;
    UPDATE BOARD SET HIT =100 WHERE NUM=2;
    --글번호로 글(DTO) 가져오기
    SELECT * FROM BOARD WHERE NUM=1;
    --HIT올리기
    UPDATE BOARD SET HIT=HIT+235 WHERE NUM=12;
    --글 수정
    UPDATE BOARD SET WRITER = 'KIM', 
                    SUBJECT = 'RETITLE',
                    CONTENT = 'RECONTENT',
                    EMAIL = 'JEENPARK@NAVER.COM',
                    PW = '111',
                    IP = '192.165.20.40'
                    WHERE NUM=2;
    --글 삭제
    DELETE FROM BOARD WHERE NUM=1 AND PW='111';
    
    --paging처리
    --1.조회수 조작
    UPDATE BOARD SET HIT = MOD(NUM,12);
    COMMIT;
    --2.TOP-N구문
    SELECT * FROM BOARD ORDER BY REF DESC;
    SELECT ROWNUM RN,A.* FROM (SELECT * FROM BOARD ORDER BY REF DESC) A;   --2단계
    SELECT * FROM (SELECT ROWNUM RN,A.* FROM (SELECT * FROM BOARD ORDER BY REF DESC) A) WHERE RN BETWEEN 111 AND 120;
    --TOP-N구문(listboard(s,e))
    COMMIT;
    --답변글 처리
    INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, PW, REF, RE_STEP, RE_LEVEL, IP)
        VALUES( 300, 'KIM', 'TITLE', '---', NULL, '111', 300, 0, 0, '192.168.20.42'); --원글
    --300번 글에 대한 답변
    --ⓐ ref가 같고 원글보다 re_step가 큰 값이 있으면 그 글의 re_step을 re_step+1
    UPDATE BOARD SET RE_STEP = RE_STEP+1 WHERE REF=300 AND RE_STEP>0;
    --답변글 저장
    INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, PW, REF, RE_STEP, RE_LEVEL, IP)
        VALUES( (SELECT MAX(NVL(NUM,0))+1 FROM BOARD), 'PARK', 'RE', '---', NULL, '111', 300,
        0+1, 0+1, '192.168.20.42');
    SELECT * FROM BOARD ORDER BY REF DESC, RE_STEP;