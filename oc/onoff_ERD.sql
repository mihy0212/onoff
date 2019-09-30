
/* Drop Tables */

DROP TABLE oc_add CASCADE CONSTRAINTS;
DROP TABLE oc_ask CASCADE CONSTRAINTS;
DROP TABLE oc_favorite CASCADE CONSTRAINTS;
DROP TABLE oc_like CASCADE CONSTRAINTS;
DROP TABLE oc_review CASCADE CONSTRAINTS;
DROP TABLE oc_time CASCADE CONSTRAINTS;
DROP TABLE oc_store CASCADE CONSTRAINTS;
DROP TABLE oc_user CASCADE CONSTRAINTS;




/* Create Tables */

-- 가게 등록 요청
CREATE TABLE oc_add
(
	-- 가게등록요청번호
	add_num number(8) NOT NULL,
	-- 가게이름
	store_name varchar2(100) NOT NULL UNIQUE,
	-- 가게주소
	store_addr varchar2(300) NOT NULL,
	-- 가게주소좌표
	store_xy varchar2(50) NOT NULL,
	-- 가게업종
	store_categ1 varchar2(2) NOT NULL,
	-- 가게이동여부
	store_categ2 varchar2(2) NOT NULL,
	-- 가게음식분류
	store_categ3 varchar2(2) NOT NULL,
	-- 사업자등록번호
	store_license varchar2(10) UNIQUE,
	-- 주민등록번호
	user_license varchar2(12) UNIQUE,
	-- 인증캡처첨부
	add_capture varchar2(100),
	-- 회원번호
	user_num number(8) NOT NULL,
	-- 가게신청일
	add_day date DEFAULT sysdate NOT NULL,
	-- 가게신청상태
	add_status varchar2(1),
	-- 가게등록보류/거절사유
	add_re varchar2(4000),
	-- 가게번호
	store_num number(8),
	PRIMARY KEY (add_num)
);


-- 문의하기
CREATE TABLE oc_ask
(
	-- 문의번호
	ask_num number(8) NOT NULL,
	-- 답변번호
	ask_re number(8) NOT NULL,
	-- 회원번호
	user_num number(8) NOT NULL,
	-- 가게번호
	store_num number(8),
	-- 문의제목
	ask_title varchar2(200) NOT NULL,
	-- 문의내용
	ask_content varchar2(4000) NOT NULL,
	-- 처리상태
	ask_status varchar2(1) NOT NULL,
	-- 문의등록일
	ask_date date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (ask_num)
);


-- 즐겨찾기 정보
CREATE TABLE oc_favorite
(
	-- 즐겨찾기순번
	favo_num number(15) NOT NULL,
	-- 회원번호
	user_num number(8) NOT NULL,
	-- 가게번호
	store_num number(8) NOT NULL,
	PRIMARY KEY (favo_num)
);


-- 좋아요 정보
CREATE TABLE oc_like
(
	-- 회원번호
	user_num number(8) NOT NULL,
	-- 가게번호
	store_num number(8) NOT NULL,
	PRIMARY KEY (user_num, store_num)
);


-- 리뷰 정보
CREATE TABLE oc_review
(
	-- 리뷰번호
	review_num number(15) NOT NULL,
	-- 댓글번호
	review_re number(8) NOT NULL,
	-- 회원번호
	user_num number(8) NOT NULL,
	-- 가게번호
	store_num number(8) NOT NULL,
	-- 별점
	review_star number(1),
	-- 리뷰내용
	review_content varchar2(4000) NOT NULL,
	-- 리뷰등록일
	review_date date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (review_num)
);


-- 사업자 정보
CREATE TABLE oc_store
(
	-- 가게번호
	store_num number(8) NOT NULL,
	-- 가게이름
	store_name varchar2(100) NOT NULL UNIQUE,
	-- 가게주소
	store_addr varchar2(300) NOT NULL,
	-- 가게주소좌표
	store_xy varchar2(50) NOT NULL,
	-- 가게업종
	store_categ1 varchar2(2) NOT NULL,
	-- 가게이동여부
	store_categ2 varchar2(2) NOT NULL,
	-- 가게음식분류
	store_categ3 varchar2(2) NOT NULL,
	-- 가게사진
	store_pic varchar2(100),
	-- 가게평균운영시간
	store_time varchar2(100),
	-- 가게전화번호
	store_tel varchar2(20),
	-- 가게메뉴
	store_menu varchar2(2000),
	-- 기타 가게 설명
	store_ect varchar2(4000),
	-- 좋아요 수
	store_like number(8) DEFAULT 0 NOT NULL,
	-- 회원번호
	user_num number(8) NOT NULL,
	-- 가게등록완료일
	store_regiday date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (store_num)
);


-- 가게 오픈 정보
CREATE TABLE oc_time
(
	-- 기록순번
	time_num number(15) NOT NULL,
	-- 가게번호
	store_num number(8) NOT NULL,
	-- 가게오픈시간
	time_open date DEFAULT sysdate,
	-- 가게닫은시간
	time_close date,
	PRIMARY KEY (time_num)
);


-- 회원 정보
CREATE TABLE oc_user
(
	-- 회원번호
	user_num number(8) NOT NULL,
	-- 회원이메일
	user_email varchar2(50) NOT NULL UNIQUE,
	-- 회원비번
	user_pw varchar2(100) NOT NULL,
	-- 회원이름
	user_name varchar2(50) NOT NULL,
	-- 회원닉네임
	user_nick varchar2(30) UNIQUE,
	-- 회원주소
	user_addr varchar2(300),
	-- 회원주소좌표
	user_xy varchar2(50),
	-- 회원권한
	user_grant varchar2(1) DEFAULT '''U''' NOT NULL,
	-- 가게번호
	store_num number(8) UNIQUE,
	-- 회원가입일
	user_inday date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (user_num)
);



/* Create Foreign Keys */

ALTER TABLE oc_ask
	ADD FOREIGN KEY (store_num)
	REFERENCES oc_store (store_num)
;


ALTER TABLE oc_favorite
	ADD FOREIGN KEY (store_num)
	REFERENCES oc_store (store_num)
;


ALTER TABLE oc_like
	ADD FOREIGN KEY (store_num)
	REFERENCES oc_store (store_num)
;


ALTER TABLE oc_review
	ADD FOREIGN KEY (store_num)
	REFERENCES oc_store (store_num)
;


ALTER TABLE oc_time
	ADD FOREIGN KEY (store_num)
	REFERENCES oc_store (store_num)
;


ALTER TABLE oc_add
	ADD FOREIGN KEY (user_num)
	REFERENCES oc_user (user_num)
;


ALTER TABLE oc_ask
	ADD FOREIGN KEY (user_num)
	REFERENCES oc_user (user_num)
;


ALTER TABLE oc_favorite
	ADD FOREIGN KEY (user_num)
	REFERENCES oc_user (user_num)
;


ALTER TABLE oc_like
	ADD FOREIGN KEY (user_num)
	REFERENCES oc_user (user_num)
;


ALTER TABLE oc_review
	ADD FOREIGN KEY (user_num)
	REFERENCES oc_user (user_num)
;


ALTER TABLE oc_store
	ADD FOREIGN KEY (user_num)
	REFERENCES oc_user (user_num)
;



/* Comments */

COMMENT ON TABLE oc_add IS '가게 등록 요청';
COMMENT ON COLUMN oc_add.add_num IS '가게등록요청번호';
COMMENT ON COLUMN oc_add.store_name IS '가게이름';
COMMENT ON COLUMN oc_add.store_addr IS '가게주소';
COMMENT ON COLUMN oc_add.store_xy IS '가게주소좌표';
COMMENT ON COLUMN oc_add.store_categ1 IS '가게업종';
COMMENT ON COLUMN oc_add.store_categ2 IS '가게이동여부';
COMMENT ON COLUMN oc_add.store_categ3 IS '가게음식분류';
COMMENT ON COLUMN oc_add.store_license IS '사업자등록번호';
COMMENT ON COLUMN oc_add.user_license IS '주민등록번호';
COMMENT ON COLUMN oc_add.add_capture IS '인증캡처첨부';
COMMENT ON COLUMN oc_add.user_num IS '회원번호';
COMMENT ON COLUMN oc_add.add_day IS '가게신청일';
COMMENT ON COLUMN oc_add.add_status IS '가게신청상태';
COMMENT ON COLUMN oc_add.add_re IS '가게등록보류/거절사유';
COMMENT ON COLUMN oc_add.store_num IS '가게번호';
COMMENT ON TABLE oc_ask IS '문의하기';
COMMENT ON COLUMN oc_ask.ask_num IS '문의번호';
COMMENT ON COLUMN oc_ask.ask_re IS '답변번호';
COMMENT ON COLUMN oc_ask.user_num IS '회원번호';
COMMENT ON COLUMN oc_ask.store_num IS '가게번호';
COMMENT ON COLUMN oc_ask.ask_title IS '문의제목';
COMMENT ON COLUMN oc_ask.ask_content IS '문의내용';
COMMENT ON COLUMN oc_ask.ask_status IS '처리상태';
COMMENT ON COLUMN oc_ask.ask_date IS '문의등록일';
COMMENT ON TABLE oc_favorite IS '즐겨찾기 정보';
COMMENT ON COLUMN oc_favorite.favo_num IS '즐겨찾기순번';
COMMENT ON COLUMN oc_favorite.user_num IS '회원번호';
COMMENT ON COLUMN oc_favorite.store_num IS '가게번호';
COMMENT ON TABLE oc_like IS '좋아요 정보';
COMMENT ON COLUMN oc_like.user_num IS '회원번호';
COMMENT ON COLUMN oc_like.store_num IS '가게번호';
COMMENT ON TABLE oc_review IS '리뷰 정보';
COMMENT ON COLUMN oc_review.review_num IS '리뷰번호';
COMMENT ON COLUMN oc_review.review_re IS '댓글번호';
COMMENT ON COLUMN oc_review.user_num IS '회원번호';
COMMENT ON COLUMN oc_review.store_num IS '가게번호';
COMMENT ON COLUMN oc_review.review_star IS '별점';
COMMENT ON COLUMN oc_review.review_content IS '리뷰내용';
COMMENT ON COLUMN oc_review.review_date IS '리뷰등록일';
COMMENT ON TABLE oc_store IS '사업자 정보';
COMMENT ON COLUMN oc_store.store_num IS '가게번호';
COMMENT ON COLUMN oc_store.store_name IS '가게이름';
COMMENT ON COLUMN oc_store.store_addr IS '가게주소';
COMMENT ON COLUMN oc_store.store_xy IS '가게주소좌표';
COMMENT ON COLUMN oc_store.store_categ1 IS '가게업종';
COMMENT ON COLUMN oc_store.store_categ2 IS '가게이동여부';
COMMENT ON COLUMN oc_store.store_categ3 IS '가게음식분류';
COMMENT ON COLUMN oc_store.store_pic IS '가게사진';
COMMENT ON COLUMN oc_store.store_time IS '가게평균운영시간';
COMMENT ON COLUMN oc_store.store_tel IS '가게전화번호';
COMMENT ON COLUMN oc_store.store_menu IS '가게메뉴';
COMMENT ON COLUMN oc_store.store_ect IS '기타 가게 설명';
COMMENT ON COLUMN oc_store.store_like IS '좋아요 수';
COMMENT ON COLUMN oc_store.user_num IS '회원번호';
COMMENT ON COLUMN oc_store.store_regiday IS '가게등록완료일';
COMMENT ON TABLE oc_time IS '가게 오픈 정보';
COMMENT ON COLUMN oc_time.time_num IS '기록순번';
COMMENT ON COLUMN oc_time.store_num IS '가게번호';
COMMENT ON COLUMN oc_time.time_open IS '가게오픈시간';
COMMENT ON COLUMN oc_time.time_close IS '가게닫은시간';
COMMENT ON TABLE oc_user IS '회원 정보';
COMMENT ON COLUMN oc_user.user_num IS '회원번호';
COMMENT ON COLUMN oc_user.user_email IS '회원이메일';
COMMENT ON COLUMN oc_user.user_pw IS '회원비번';
COMMENT ON COLUMN oc_user.user_name IS '회원이름';
COMMENT ON COLUMN oc_user.user_nick IS '회원닉네임';
COMMENT ON COLUMN oc_user.user_addr IS '회원주소';
COMMENT ON COLUMN oc_user.user_xy IS '회원주소좌표';
COMMENT ON COLUMN oc_user.user_grant IS '회원권한';
COMMENT ON COLUMN oc_user.store_num IS '가게번호';
COMMENT ON COLUMN oc_user.user_inday IS '회원가입일';



