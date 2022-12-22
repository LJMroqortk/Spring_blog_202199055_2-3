-- 데이터베이스 생성 : ljmdb는 데이터베이스명
CREATE DATABASE ljmdb;

-- 사용자 생성
CREATE USER leejumyeong@localhost IDENTIFIED BY '1111';

-- 사용자의 db에 대한 권한 부여
GRANT ALL privileges ON ljmdb.* TO leejumyeong@localhost WITH GRANT OPTION;

-- 권한 갱신
FLUSH PRIVILEGES;

-- 데이터베이스 조회
SHOW DATABASES;

-- my_board 테이블
CREATE TABLE my_board(
	bno INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(200),
	content TEXT,
	writer VARCHAR(50),
	regdate DATE DEFAULT NOW(),
	updatedate DATE DEFAULT NOW(),
	COUNT INT DEFAULT 0
);
-- my_client 테이블
CREATE TABLE my_client(
	userid VARCHAR(200) PRIMARY KEY,
	passwd VARCHAR(200),
	name VARCHAR(100),
	email VARCHAR(200),
	join_date DATE DEFAULT NOW()
);

COMMIT;
-- my_board insert 데이터
INSERT INTO my_board(title, content, writer) VALUES('테스트1','테스트내용2', '홍길동');
INSERT INTO my_board(title, content, writer) VALUES('테스트4','테스트내용3', '홍길동');
INSERT INTO my_board(title, content, writer) VALUES('테스트5','테스트내용4', '홍길동1');
INSERT INTO my_board(title, content, writer) VALUES('테스트6','테스트내용5', '홍길동2');
INSERT INTO my_board(title, content, writer) VALUES('테1231231스트7','테123213', '1232131');
-- my_client insert 데이터
INSERT INTO my_client(userid,passwd,NAME,email) VALUES('hes','1234','donggils','sadas1300@naver.com')
INSERT INTO my_client(userid,passwd,NAME,email) VALUES('hesas57','123455','fons','sadas4567@gmail.com')
INSERT INTO my_client(userid,passwd,NAME,email) VALUES('hesdd46','123452','fonsgil','sadas3021@gmail.com')
INSERT INTO my_client(userid,passwd,NAME,email) VALUES('hesaa12','12','dong','sadas1264@naver.com')
COMMIT;
-- 데이터 확인
SELECT * FROM my_board;
SELECT * FROM my_client;