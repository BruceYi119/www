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
	del_yn char(1) default 'y',																	-- 탈퇴여부
	writedate date default sysdate,																-- 가입일
	constraint member_del_yn_c check (del_yn in ('y','n'))
);

-- 주식 테이블 (강민규)
drop table stock;
drop sequence s_stock_;
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
	sbno number,												-- 키값
	name varchar2(10),											-- 이름
	pwd varchar2(100),											-- 비밀번호
	title varchar2(30),											-- 제목
	content varchar2(1000),										-- 내용
	fname varchar2(100),										-- 사진이름
	writeday date default sysdate,								-- 작성일
	readnum number,												-- 조회수
	good number,												-- 공감
	bad number,													-- 비공감
	sung varchar2(10),											-- 성별
	kind varchar2(100),											-- 카테고리
	CONSTRAINT stockboard_sbno_p PRIMARY KEY (sbno)
);

-- 주식 게시판 댓글 테이블 (강민규)
drop table stockboarddat;
drop sequence s_stockboarddat;
create sequence s_stockboarddat start with 1;
create table stockboarddat(
	sbdno number,													--키값
	name char(10),													--이름			
	content varchar2(600),											--내용		
	writeday date default sysdate,									--작성일			
	sbno number,													--stockboard 키값
	CONSTRAINT stockboarddat_sbdno_p PRIMARY KEY (sbdno)
);

-- 기업 코드 테이블 (강민규)
drop table companycode;
drop sequence s_companycode;
create sequence s_companycode start with 1;
create table companycode(
	cno number not null,											-- 키값
	company varchar2(150),											-- 기업명
	code vatchar2(100),												-- 기업코드
	CONSTRAINT companycode_cno_p PRIMARY KEY (cno)
);

-- 조립피씨 테이블 (박용순)
drop table main_custom;
drop sequence s_main_custom;
create sequence s_main_custom;
create table main_custom(
	mcno number,														-- 키값
	cpu varchar2(50),													-- cpu
	vga varchar2(50),													-- 그래픽카드
	power varchar2(50),													-- 파워
	mb varchar2(50),													-- 메인보드
	ram1 varchar2(50),													-- 램1
	ram2 varchar2(50),													-- 램2
	hdd varchar2(50),													-- 하드
	ssd varchar(50),													-- ssd
	price varchar2(200),												-- 총 가격
	constraint main_custom_mcno_p primary key(mcno)
);

-- 조립피씨 댓글 테이블 (박용순)
drop table sub_custom;
drop sequence s_sub_custom;
create sequence s_sub_custom;
create table sub_custom(
	scno number not null,											-- 키값
	cpu varchar2(50),												-- cpu
	vga varchar2(50),												-- 그래픽카드
	power varchar2(50),												-- 파워
	mb varchar2(50),												-- 메인보드
	ram1 varchar2(50),												-- 램1
	ram2 varchar2(50),												-- 램2
	hdd varchar2(50),												-- 하드
	ssd vatchar2(50),												-- ssd
	mcno numver, 													-- main_custom 키값
	price varchar2(200),											-- 총 가격
	constraint sub_custom_scno_p primary key(scno),
	constraint sub_custom_mcno_f foreign key(mcno) references main_custom(mcno)
);

-- 레시피게시판 테이블 (정지원)
drop table recipe_board;
drop sequence s_recipe_board;
create sequence recipe_board;
create table recipe_board(
	rbno number,													-- 키값
	name varchar2(20),												-- 작성자
	pwd varchar2(20),												-- 비번
	title varchar2(100),											-- 제목
	rcategory varchar2(10),											-- 카테고리 반찬류,메인메뉴,...
	rname varchar2(20),												-- 음식이름
	ingredients varchar2(100),										-- 재료
	content varchar2(4000),											-- 내용
	file varchar2(500),												-- 음식사진
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
	cno number not null,							-- 키값
	name varchar2(20),								-- 작성자
	pwd varchar2(20),								-- 비번
	title varchar2(100),							-- 제목
	writype varchar2(20),							-- 글종류
	animal varchar2(20),							-- 동물종류
	content varchar2(1000),							-- 내용
	fname varchar2(100),							-- 사진
	readnum number default 0,						-- 조회수
	liked number default 0,							-- 추천
	fimsi varchar2(100),							-- 첨부파일 임시저장소 업데이트시 활용
	writeday date default sysdate,					-- 작성일
	CONSTRAINT cafe_cno_p PRIMARY KEY (cno)
);

-- 애완동물카페 댓글 테이블 (진우람)
drop table cdat;
drop sequence s_cdat;
CREATE SEQUENCE s_cdat START WITH 1 INCREMENT BY 1 MAXVALUE 10000 CYCLE NOCACHE;
create table cdat(
	cdno number not null,																		-- 키값
	dname varchar2(20),																			-- 댓글 닉네임
	dcontent varchar2(100),																		-- 댓글내용
	dpwd varchar2(20),																			-- 댓글비번
	cno number,																					-- cafe 키값
	writeday date default sysdate,																-- 작성일
	CONSTRAINT cdat_cdno_p PRIMARY KEY (cdno),
	constraint cdat_cno_f foreign key(cno) references cafe(cno)
);

-- 학생성적 테이블 (헨리)
drop table studentgrade;
drop sequence s_studentgrade;
create sequence studentgrade;
create table studentgrade(
	sgno number constraint studentgrade_sgno_p primary key,					-- 키값
	name char(20),																-- 이름
	attpoint number,															-- 출석점수
	hwpoint number,																-- 과제점수
	testpoint number,															-- 시험점수
	ttlpoint number																-- 총점수
);

-- 학생은행정보 테이블 (헨리)
drop table studentinfo;
drop sequence s_studentinfo;
create sequence studentinfo;
create table studentinfo(
	sino number constraint studentinfo_sino_p primary key,					-- 키값
	name char(20),																-- 이름
	username varchar2(20),														-- 아이디
	birthdate date,																-- 생일
	studentidno char(10),														-- 학번
	addr varchar2(100),															-- 주소
	hphone varchar2(20),														-- 집전화번호
	cphone varchar2(20),														-- 핸드폰번호
	email varchar2(30),															-- 이메일
	bankname varchar2(20),														-- 은행명
	acctno varchar2(30),														-- 계좌번호
	acctname varchar2(20)														-- 예금주
);

-- 예약 테이블 (김희수)
drop table reservation;
drop sequence s_reservation;
create sequence s_reservation;
create table reservation(
   rno number constraint reservation_rno_p primary key,								-- 키값
   name varchar2(50),																	-- 예약자 성함
   adult_cnt number,																	-- 예약인원(성인)
   child_cnt number,																	-- 예약인원(아이)
   phone varchar2(50),																	-- 예약자 핸드폰 번호.  핸드폰 번호를 이용하여 작성글을 수정 및 삭제 가능
   date date,																			-- 네이버 예약 창 생각하시면 될거같습니다
   time varchar2(50),																	-- 네이버 예약창 생각하시면 될거같습니다. 시간과 분(10분단위)로 select해서 받을 예정
   eat char(1) default 's',															-- 매장/포장 여부 s = 매장, p = 포장
   bigo varchar2(1000),																	-- 예약을 하면서 하고 픈 말 적기( 부모님 생신.. or 생일 잔치 or 신년회)
   constraint reservation_eat_c check (eat in ('s','p'))
);