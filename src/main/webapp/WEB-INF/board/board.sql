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

/*new.gif를 24시간동안 보여주기 위한 처리*/
select * from board order by idx desc limit 0,10;
select *, datediff(wDate,now()) from board order by idx desc limit 0,10; 			/*날짜비교*/
select *, timestampdiff(hour,wDate,now()) from board order by idx desc limit 0,10; 	/*시간비교*/

/*이전글/다음글 꺼내오기*/
select * from board where idx = 10; 							/*현재글*/
select * from board where idx < 10 order by idx desc limit 1; 	/*이전글*/ 
select * from board where idx > 10 order by idx limit 1; 		/*다음글*/


/*날짜함수연습*/
select now();
/*date_add  datetime 형식 비교*/
select now() as 오늘날짜, date_add(now(), interval 1 day);		/*하루 뒤*/
select now() as 오늘날짜, date_add(now(), interval -1 day);	/*하루 전*/
select now() as 오늘날짜, date_add(now(), interval 10 hour);	/*10시간 뒤*/
select now() as 오늘날짜, date_add(now(), interval -10 hour);	/*10시간 전*/
select now() as 오늘날짜, date_add(now(), interval -10 hour) as preHour;

/*date_sub datetime 형식 비교*/
select now() as 오늘날짜, date_sub(now(), interval 1 day);		/*하루 전*/
select now() as 오늘날짜, date_sub(now(), interval -1 day);	/*하루 뒤*/

/*board테이블에 적용*/
--게시글 중에서 하루전에 올라온 글만 보여주시오.
select wDate, date_add(now(), interval -1 day) from board;  
select substring(wDate,1,10),substring(date_add(now(), interval -1 day),1,10) from board;
select idx,nickName,wDate from board where sub string(wDate,1,10)=substring(date_add(now(), interval -1 day),1,10);

/*날짜차이 계산 : Datediff(시작날짜,마지막날짜) int 형식 비교*/
select datediff('2023-11-14',now());
select datediff(now(), wDate) from board order by idx desc;
select timestampdiff(hour, wDate,now()) from board order by idx desc;
select timestampdiff(day, wDate, now()) from board order by idx desc;


/* 날짜형식(date_format(날짜형식자료,포맷)) : 년도 4자리(%Y),월(%m),일(%d),시간(%H),분(%i), */
select wDate, date_format(wDate,'%Y-%m-%d') from board;
select wDate, date_format(wDate,'%Y-%m-%d %H:%i') from board;