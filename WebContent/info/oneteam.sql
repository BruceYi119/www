// 프로젝트 테이블 스페이스 생성
create tablespace oneteam datafile 'D:\db\oneteam.dbf' size 200m default storage(initial 80k next 80k minextents 1 maxextents 121 pctincrease 80) online;

// 프로젝트 계정 생성
create user oneteam identified by enffl default tablespace oneteam;

// 접속, 리소스 권한주기
grant connect, resource to oneteam;