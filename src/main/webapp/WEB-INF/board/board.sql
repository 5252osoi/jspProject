show tables;

create table board(
 idx int not null auto_increment,			/*01 게시글의 고유번호 */
 mid varchar(30) not null,					/*02 글쓴이(세션아이디) */
 nickName varchar(30) not null,				/*03 글쓴이 닉네임 */
 title varchar(100) not null,				/*04 게시글 제목*/
 email varchar(60),							/*05 이메일 주소*/
 homePage varchar(60),						/*06 홈페이지 주소*/
 content text not null,						/*07 게시글 내용*/
 readNum int not null default 0,			/*08 글 조회수*/
 hostIp varchar(40) not null,				/*09 글쓴이 IP*/
 openSw char(2) default 'OK',				/*10 게시글 공개여부 (OK:공개 NO:비공개)*/
 wDate datetime default now(),				/*11 게시글 올린 날짜(시간)*/
 good int default 0,						/*12 게시글에 눌린 좋아요 누른 횟수*/
 primary key(idx)
);

desc board;
insert into board values(default,'admin','관리자','게시판 운영을 시작합니다.','','','많은 이용 바랍니다.',default,'192.168.50.53',default,default,default);