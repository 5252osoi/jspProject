show tables;



	/*1이라는 이름으로 업로드를 하더라도 같은 이름의 파일이 서버에 이미 존재 할 수 있기때문에 업로드시의 파일명과 서버저장시의 파일명을 따로 저장함*/
	/*(다시 다운로드 받을때는 1이라는 이름으로 받아야됨)*/



create table pds (
	idx		int not null auto_increment,		/*자료실 고유번호*/
	mid 	varchar(30) not null,				/*업로더 아이디*/
	nickName varchar(30) not null,				/*업로더 닉네임*/
	fName	varchar(200) not null,				/*업로드시 파일명*/
	fSName	varchar(200) not null,				/*서버 저장시 파일명*/
	fSize 	int not null,						/*업로드된 파일의 사이즈*/
	title 	varchar(100) not null,				/*업로드 파일의 제목*/
	part	varchar(20) not null,				/*파일분류(학습/여행/음식/기타)*/
	pwd		varchar(100) not null,				/*비밀번호(sha256암호화처리)*/
	fDate	datetime default now(),				/*파일 업로드한 날짜*/
	downNum int default 0,						/*파일 다운로드 횟수*/
	openSw	char(6) default '공개',				/*파일 공개(비공개) 여부*/
	content	text,								/*파일의 상세설명(없어도그만)*/
	hostIp	varchar(50) not null,				/*업로더의 Ip주소*/
	primary key(idx)							/*기본키 : 자료실의 고유번호*/
);


desc pds;

select * from pds order by idx desc;