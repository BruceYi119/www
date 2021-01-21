-- 프로젝트 테이블 스페이스 생성
create tablespace oneteam datafile 'D:\db\oneteam.dbf' size 200m default storage(initial 80k next 80k minextents 1 maxextents 121 pctincrease 80) online;

-- 프로젝트 계정 생성
create user oneteam identified by enffl default tablespace oneteam;

-- 접속, 리소스 권한주기
grant connect, resource to oneteam;

-- 회원 테이블 (이승준)
drop table member;
drop sequence s_member;
create sequence s_member;
create table member(
	mno number constraint member_mno_p primary key,												-- 키
	id varchar2(50) constraint member_id_n not null,												-- 아이디
	pw char(128) constraint member_pw_n not null,													-- 비밀번호(sha512)
	name varchar2(30) constraint member_name_n not null,											-- 이름
	phone varchar2(20) constraint member_phone_n not null,											-- 연락처
	birth varchar2(20) constraint member_birth_n not null,											-- 생년월일
	zipcode varchar2(10) constraint member_zipcode_n not null,										-- 우편번호
	addr varchar2(300) constraint member_addr_n not null,											-- 주소
	addr_detail varchar2(300) constraint member_addr_detail_n not null,							-- 상세주소
	email varchar2(30) constraint member_email_n not null,											-- 이메일
	mtype char(1) default 'n',																		-- 관리자 여부 'a' = 관리자, 'n' = '일반회원'
	del_yn char(1) default 'n',																	-- 탈퇴여부 'n' = 탈퇴x, 'y' = 탈퇴o
	writedate date default sysdate,																-- 가입일
	constraint member_mtype_c check (mtype in ('a','n')),
	constraint member_del_yn_c check (del_yn in ('y','n'))
);

-- 관리자 회원 등록
insert into member values(s_member.nextval, 'admin', '38252f54a15f38fe15c2bb2304bbf1b27f0f17f9b6d7998ba4ac3833d5842c9d23f2ec6f468708f702204b7cf408fdb13391b82c9baea6137b4a4dce19537bb3', '관리자', '010-1234-1234', '1983-01-19', '06241', '서울특별시 강남구 강남대로 358', '상세주소', 'pirates119@gmail.com', 'a', 'n', sysdate);

-- 관리자 회원정보 페이징처리 확인을 위한 데이터 생성쿼리
--GRANT EXECUTE ON DBMS_LOCK TO oneteam;
--
--DECLARE
--i number := 1;
--BEGIN
--
--    LOOP
--        insert into member values(s_member.nextval, 'admin' || i, '38252f54a15f38fe15c2bb2304bbf1b27f0f17f9b6d7998ba4ac3833d5842c9d23f2ec6f468708f702204b7cf408fdb13391b82c9baea6137b4a4dce19537bb3', '관리자', '010-1234-1234', '1983-01-19', '06241', '서울특별시 강남구 강남대로 358', '상세주소', 'pirates119@gmail.com', 'a', 'n', sysdate);
--        i := i + 1;
--        DBMS_LOCK.SLEEP(01);
--    EXIT WHEN i > 105;
--    END LOOP;
--
--    commit;
--END;
--/

-- 주식 테이블 (강민규)
drop table stock;
drop sequence s_stock;
create sequence s_stock start with 1;
create table stock(
	sno number,										-- 키값
	title varchar2(50),								-- 기업명	
	siga number,									-- 현재가
	gijun varchar2(20),								-- 기준일자	
	beadang number(10,2),							-- 배당금액			
	suik number(10,2),								-- 배당수익률		
	beadang1 number(10,2),							-- 배당성향
	CONSTRAINT stock_sno_p PRIMARY KEY (sno)
);

-- 주식 게시판 테이블 (강민규)
drop table stockboard;
drop sequence s_stockboard;
create sequence s_stockboard start with 1;
create table stockboard(
	sbno number,											-- 키값
	name varchar2(50),										-- 이름
	pwd varchar2(100),										-- 비밀번호
	title varchar2(30),										-- 제목
	content varchar2(1000),									-- 내용
	fname varchar2(100),									-- 사진이름
	writeday date default sysdate,							-- 작성일
	readnum number default 0,								-- 조회수
	good number default 0,									-- 공감
	bad number default 0,									-- 비공감
	sung varchar2(10),										-- 성별
	kind varchar2(100),										-- 카테고리
	CONSTRAINT stockboard_sbno_p PRIMARY KEY (sbno)
);	
-- 주식 게시판 댓글 테이블 (강민규)
drop table stockboarddat;
drop sequence s_stockboarddat;
create sequence s_stockboarddat start with 1;
create table stockboarddat(
	sbdno number,												--키값
	name varchar2(100),											--이름			
	content varchar2(600),										--내용		
	writeday date default sysdate,								--작성일			
	sbno number,												--stockboard 키값
	CONSTRAINT stockboarddat_sbdno_p PRIMARY KEY (sbdno)
);

-- 기업 코드 테이블 (강민규)
drop table companycode;
drop sequence s_companycode;
create sequence s_companycode start with 1;
create table companycode(
	cno number not null,									-- 키값
	company varchar2(150),									-- 기업명
	code varchar2(100),										-- 기업코드
	CONSTRAINT companycode_cno_p PRIMARY KEY (cno)
);

-- 조립피씨 테이블 (박용순)
drop table main_custom;
drop sequence s_main_custom;
create sequence s_main_custom;
create table main_custom(
   mcno number not null,                         	-- 조립 완성품 식별번호
   cpu varchar(20),                              	-- cpu
   vga varchar(20),                              	-- 그래픽카드
   power varchar(20),                            	-- 파워
   mb varchar(20),                               	-- 메인보드
   ram1 varchar(20),                             	-- 램1
   ram2 varchar(20),                             	-- 램2
   hdd varchar(20),                              	-- 하드
   ssd varchar(20),                              	-- ssd  부품들 전부 varchar(20)으로 수정
   cpu_price number default 0,                              -- cpu가격
   vga_price number default 0,                              -- 그래픽카드가격
   power_price number default 0,                            -- 파워가격
   mb_price number default 0,                               -- 메인보드가격
   ram1_price number default 0,                             -- 램1가격
   ram2_price number default 0,                             -- 램2가격
   hdd_price number default 0,                              -- 하드가격
   ssd_price number default 0,                              -- ssd가격
   price number default 0,                                  -- 총가격
   pw varchar2(15),                                          -- 비밀번호(삭제,수정용)
   constraint main_custom_mcno_p primary key(mcno)
);

-- 수정된 sub_custom 이거 사용 (박용순)
drop table sub_custom;
drop sequence s_sub_custom;
create sequence s_sub_custom;
create table sub_custom(
   scno number not null,									-- 댓글 식별번호
   sname varchar(15),										-- 댓글 작성자
   scontent varchar(50),									-- 댓글 내용
   spw varchar(15),											-- 댓글 비밀번호
   constraint sub_custom_scno_p primary key(scno)
);


-- 레시피게시판 테이블 (정지원)
drop table recipe_board;
drop sequence s_recipe_board;
create sequence s_recipe_board;
create table recipe_board(
	rbno number,													-- 키값
	name varchar2(20),												-- 작성자
	pwd varchar2(20),												-- 비번
	title varchar2(100),											-- 제목
	rcategory varchar2(100),										-- 카테고리 반찬류,메인메뉴,...
	rname varchar2(20),												-- 음식이름
	ingredients varchar2(100),										-- 재료
	content varchar2(4000),											-- 내용
	img varchar2(500),												-- 음식사진
	readnum number,													-- 조회수
	liked number,													-- 좋아요수
	writeday date default sysdate,									-- 작성일
	constraint recipe_board_rbno_p primary key(rbno)
);

-- 레시피게시판 댓글 테이블 (정지원)
drop table rcomment;
drop sequence s_rcomment;
create sequence s_rcomment;
create table rcomment(
	rcno number,													-- 키값
	name varchar2(20),												-- 작성자			
	content varchar2(100),											-- 내용	
	writeday date default sysdate,									-- 작성일			
	rbno number,													-- recipe_board 키값			
	constraint rcomment_rcno_p primary key(rcno),
	constraint rcomment_rno_f foreign key(rbno) references recipe_board(rbno)
);

-- 애완동물카페 테이블 (진우람)
drop table cafe;
drop sequence s_cafe;
CREATE SEQUENCE s_cafe START WITH 1 INCREMENT BY 1 MAXVALUE 10000 CYCLE NOCACHE;
create table cafe(
   cno number not null,										-- 키값
   name varchar2(20),										-- 작성자
   title varchar2(100),										-- 제목
   writype varchar2(30),									-- 글종류 (30) 으로 크기 수정!!!!
   animal varchar2(20),										-- 동물종류
   content varchar2(1000),									-- 내용
   fname varchar2(100),										-- 사진
   readnum number default 0,								-- 조회수
   liked number default 0,									-- 추천
   fimsi varchar2(100),										-- 첨부파일 임시저장소 업데이트시 활용
   writeday date default sysdate,							-- 작성일
   CONSTRAINT cafe_cno_p PRIMARY KEY (cno)
);

-- 애완동물카페 댓글 테이블 (진우람)
drop table cdat;
drop sequence s_cdat;
CREATE SEQUENCE s_cdat START WITH 1 INCREMENT BY 1 MAXVALUE 10000 CYCLE NOCACHE;
create table cdat(
   cdno number not null,																-- 키값
   dname varchar2(20),																	-- 댓글 닉네임
   dcontent varchar2(100),																-- 댓글내용
   cno number,																			-- 원글id
   writeday date default sysdate,														-- 작성일
   CONSTRAINT cdat_cdno_p PRIMARY KEY (cdno)
);

-- 카페 닉네임 테이블 (진우람)
drop table cmember;
drop sequence s_cmember;
CREATE SEQUENCE s_cmember START WITH 1 INCREMENT BY 1 MAXVALUE 10000 CYCLE NOCACHE;
create table cmember(
   cmno number constraint cmember_cmno_p PRIMARY KEY,													-- 키값
   nick varchar2(50) constraint cmember_nick_n not null,												-- 카페닉네임
   id varchar2(50) constraint cmember_id_n not null,													-- 유저id
   reason varchar2(50) constraint cmember_reason_n not null,											-- 가입동기
   pobu varchar2(300) constraint cmember_pobu_n not null,												-- 가입포부
   mtype char(1) default 'n',																			-- 관리자 여부 'a' = 관리자, 'n' = '일반회원'
   del_yn char(1) default 'n',																			-- 탈퇴여부 'n' = 탈퇴x, 'y' = 탈퇴o
   subday date default sysdate,																		-- 가입일
   constraint cmember_mtype_c check (mtype in ('a','n')),
   constraint cmember_del_yn_c check (del_yn in ('y','n'))
);

-- 카페 관리자
insert into cmember values(s_cmember.nextval,'펭수','admin','관리자','관리자계정','a','n',sysdate);

--영화 List 페이지 영화 저장 테이블 (헨리)
drop sequence movies_seq;
drop table movies;
create sequence movies_seq;
create table movies(
    mno number constraint movies_no_p primary key,
    title varchar2(200),									-- 영화제목
    viewrating varchar2(200),								-- 관람평점
    salesrating varchar2(200),								-- 예매율
    genre varchar2(200),									-- 장르
    runtime varchar2(200),									-- 상영시간
    releasedate varchar2(200),								-- 개봉일
    filmdirector varchar2(200),								-- 감독
    imgtitle varchar2(200)									-- 이미지 이름(src=사진 불러오기 위한 이름)
);

--스토리 Board로 추가하면 추가된 나의 영화 테이블 (헨리)
drop sequence mymovielist_seq;
drop table mymovielist;
create sequence mymovielist_seq;
create table mymovielist(
    mno number constraint mymovielist_no_p primary key,
    title varchar2(200),							-- 영화제목
    viewrating varchar2(200),						-- 관람평점
    salesrating varchar2(200),						-- 예매율
    genre varchar2(200),							-- 장르
    runtime varchar2(200),							-- 상영시간
    releasedate varchar2(200),						-- 개봉일
    filmdirector varchar2(200),						-- 감독
    imgtitle varchar2(200),							-- 이미지 이름(src=사진 불러오기 위한 이름)
    writedate date default sysdate,				-- 스토리보드에 등록한 날짜
    id varchar2(200)								-- 사용자 아이디(사용자가 추가한 목록만 보이기 위해서)
);

--스토리 Board에서 추가한 영화에 대한 스토리(후기 및 관람전 찜) 작성하면 내용 추가하는 테이블 (헨리)
drop sequence storyboard_seq;
drop table storyboard;
create sequence storyboard_seq;
create table storyboard(
    sno number constraint storyboard_no_p primary key,
    movietitle varchar2(200),											-- 영화제목
    content varchar2(500),												-- 스토리 내용
    writedate date default sysdate,									-- 스토리 등록 날짜
    id varchar2(200)													-- 사용자 아이디(사용자가 작성한 내용만 출력)
);

-- 예약 테이블 (김희수)
drop table reservation;
drop sequence s_reservation;
create sequence s_reservation;
create table reservation(
	rno number constraint reservation_rno_p primary key,					-- 키값
	rdate date,	
	rtime varchar2(20),
	rname varchar2(20),
	rphone varchar2(20),
	radult_cnt number,
	rchild_cnt number default 0,
	reat char(1) default 's',
	rbigo varchar(1000),
	rchk number default 1,
	rwritedate date,
	constraint reservation_eat_c check (reat in ('s','p'))
);