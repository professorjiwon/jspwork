create table member (
    id varchar2(20) primary key,
    pwd varchar2(20) not null,
    name varchar2(20) not null,
    gender char(1),
    birthday char(6),
    email varchar2(30),
    zipcode char(5),
    address varchar2(100),
    detail_address varchar2(50),
    hobby char(5),
    job varchar2(30)
);

COMMENT ON COLUMN MEMBER.ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.PWD IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.NAME IS '회원이름';
COMMENT ON COLUMN MEMBER.GENDER IS '회원성별(1,2)';
COMMENT ON COLUMN MEMBER.BIRTHDAY IS '회원생일';
COMMENT ON COLUMN MEMBER.EMAIL IS '회원이메일';
COMMENT ON COLUMN MEMBER.ZIPCODE IS '우편번호';
COMMENT ON COLUMN MEMBER.ADDRESS IS '회원주소';
COMMENT ON COLUMN MEMBER.DETAIL_ADDRESS IS '회원상세주소';
COMMENT ON COLUMN MEMBER.HOBBY IS '회원취미';
COMMENT ON COLUMN MEMBER.JOB IS '회원직업';

CREATE TABLE votelist (
  num number PRIMARY KEY,
  question varchar2(200) NOT NULL,
  sdate date,
  edate date,
  wdate date,
  type number DEFAULT 1 NOT NULL,
  active number DEFAULT 1
);

COMMENT ON COLUMN VOTELIST.NUM IS '설문번호';
COMMENT ON COLUMN VOTELIST.QUESTION IS '설문내용';
COMMENT ON COLUMN VOTELIST.SDATE IS '투표시작날짜';
COMMENT ON COLUMN VOTELIST.EDATE IS '투표종료날짜';
COMMENT ON COLUMN VOTELIST.WDATE IS '설문작성날짜';
COMMENT ON COLUMN VOTELIST.TYPE IS '중복투표허용여부';
COMMENT ON COLUMN VOTELIST.ACTIVE IS '설문활성화여부';

CREATE TABLE voteitem (
  listnum NUMBER,
  itemnum NUMBER,
  item varchar2(50),
  count NUMBER DEFAULT 0,
  PRIMARY KEY (listnum, itemnum)
); 

COMMENT ON COLUMN VOTEITEM.LISTNUM IS '답변이소속된설문번호';
COMMENT ON COLUMN VOTEITEM.ITEMNUM IS '답변번호';
COMMENT ON COLUMN VOTEITEM.ITEM IS '답변내용';
COMMENT ON COLUMN VOTEITEM.COUNT IS '투표수';

CREATE SEQUENCE SEQ_VOTE;