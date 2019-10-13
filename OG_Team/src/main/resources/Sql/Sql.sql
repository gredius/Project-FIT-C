create table fit_gamelist(
fit_name varchar2(20) primary key,
gamelevel number,
pclevel number,
imagelink varchar2(100) not null,
gamecpu varchar2(50),
gameram varchar2(50),
gamegpu varchar2(50),
gameaddop varchar2(100),
memo varchar2(100));

create table fit_cpu (
num number primary key,
fit_name varchar2(100) not null,
cpucode varchar2(100) not null,
cores varchar2(100) not null,
clock varchar2(100) not null,
socket varchar2(100) not null,
process varchar2(100) not null,
l3cache varchar2(100) not null,
tdp varchar2(100) not null,
released varchar2(100) not null,
point number default null);

create table fit_case(
num number primary key,
fit_name varchar2(100),
rowprice varchar2(20),
power varchar2(50),
mainboardsize varchar2(100),
casesize varchar2(100),
addop varchar2(600));

create table fit_gpu (
num number primary key,
manufacturer varchar2(10) not null,
fit_name varchar2(50) not null,
chip varchar2(20) not null,
realeased_date varchar2(20) not null,
bus varchar2(20) not null,
m_size varchar2(20) not null,
m_ddr varchar2(20) not null,
m_bit varchar2(20) not null,
g_clock varchar2(20) not null,
m_clock varchar2(20) not null,
tdp varchar2(20) not null,
rank number not null
); 

create table fit_ram (
num number primary key,
fit_name varchar2(100) not null,
spec varchar2(300) not null,
src_link varchar2(300) not null
);

create table fit_mainboard
(
    num number primary key,
    fit_name varchar2(100) not null,
    sockets varchar2(100) not null,
    formFactor varchar2(100) not null,
    chipSet varchar2(100) not null,
    RAM varchar2(50) not null,
    releaseDate varchar2(50) not null,
    audioChip varchar2(50) not null,
    usb2 varchar2(20) not null,
    usb3 varchar2(20) not null,
    sata varchar2(20) not null
);

create table fit_power
(
    num number primary key,
    fit_name varchar2(200) not null,
    price varchar2(20),
    power varchar2(20) ,
    output varchar2(20) not null,
    fanSize varchar2(20),
    fanNum varchar2(10),
    atx varchar2(10),
    sata varchar2(10),
    connecter varchar2(200),
    etc varchar2(500),
    releaseDate varchar2(20)
);

create table fit_steam
(
    num number primary key,
    appid varchar2(100) not null,
    fit_name varchar2(200) not null
);

create table fit_member(
    fit_userid varchar2(20) primary key,
    fit_userpwd varchar2(20) not null,
    fit_usernick varchar2(20) not null,
    fit_usermail varchar2(50) not null,
    fit_userkeyvalue varchar2(50) not null,
    fit_userestimatenum varchar2(50)
);

create table fit_board(
    fit_boardnum number primary key,
    fit_userid varchar2(20) not null,
    fit_boardtitle varchar2(50) not null,
    fit_pcsets varchar2(30),
    fit_boardcontent varchar2(200),
    fit_boarddate date default sysdate,
    fit_boardhit number default 0
);


create sequence fit_board_seq;


create table fit_comment(
fit_commentnum number primary key,
fit_boardnum number not null,
fit_userid varchar2(20) not null,
fit_comments varchar2(100) not null,
fit_commentdate date default sysdate
);

create sequence fit_comment_seq;

create table fit_pcestimate(
    fit_pcnum number primary key,
    fit_userid varchar2(20) not null,
    fit_cpuname varchar2(250),
    fit_casename varchar2(250),
    fit_gpuname varchar2(250),
    fit_mainboardname varchar2(250),
    fit_powername varchar2(250),
    fit_ramname varchar2(250),
    fit_date date default sysdate
);

create sequence fit_pcestimate_seq;

//////////////////////////////
ALTER TABLE fit_case RENAME COLUMN casename TO fit_name;
ALTER TABLE fit_cpu RENAME COLUMN cpuname TO fit_name;
ALTER TABLE fit_gamelist RENAME COLUMN gamename TO fit_name;
ALTER TABLE fit_gpu RENAME COLUMN product_name TO fit_name;
ALTER TABLE fit_mainboard RENAME COLUMN name TO fit_name;
ALTER TABLE fit_power RENAME COLUMN name TO fit_name;
ALTER TABLE fit_ram RENAME COLUMN name TO fit_name;
ALTER TABLE fit_steam RENAME COLUMN name TO fit_name;




insert into FIT_GAMELIST values('Assassins Creed: Odyssey', 3, 10, 'https://steamcdn-a.akamaihd.net/steam/apps/812140/header.jpg?t=1567612269','Intel Core i7-3770', '8Gb', 'GTX 970', 'nope', null); 
insert into FIT_GAMELIST values('PLAYERUNKNOWNS BATTLEGROUNDS', 10, 7, 'https://steamcdn-a.akamaihd.net/steam/apps/578080/header.jpg?t=1569247674' , 'Intel Core i5-6600' , '16Gb' ,'GTX 1060' , 'nope', null);
insert into FIT_GAMELIST values('MONSTER HUNTER: WORLD', 8, 9, 'https://steamcdn-a.akamaihd.net/steam/apps/582010/header.jpg?t=1570144918' , 'Intel Core i7-3770' , '8Gb' ,'GTX 1060' , 'nope', null);
insert into FIT_GAMELIST values('Tom Clancys Rainbow Six Siege', 7, 5, 'https://steamcdn-a.akamaihd.net/steam/apps/359550/header.jpg?t=1568227548' , 'Intel Core i5-2500' , '8Gb' ,'GTX 970' , 'nope', null);
insert into FIT_GAMELIST values('Dead by Daylight', 4, 5, 'https://steamcdn-a.akamaihd.net/steam/apps/381210/header.jpg?t=1568903522' , 'Intel Core i3-4170' ,'8Gb','GTX 960' , 'nope', null);
insert into FIT_GAMELIST values('OVERWATCH', 9, 3, 'https://t1.daumcdn.net/cfile/tistory/2439E93558BCF3DE16' , 'Intel Core i5-2500' , '6Gb' ,'GTX 660' , 'nope', null);
insert into FIT_GAMELIST values('Sid Meiers Civilization VI', 6, 4, 'https://steamcdn-a.akamaihd.net/steam/apps/289070/header.jpg?t=1570122683' , 'Intel Core i5-2500' , '8Gb' ,'GTX 770' , 'nope', null);
insert into FIT_GAMELIST values('ARK: Survival Evolved', 2, 3, 'https://steamcdn-a.akamaihd.net/steam/apps/346110/header.jpg?t=1560889311' , 'Intel Core i5-2400' , '8Gb' , 'GTX 670' , 'nope', null);
insert into FIT_GAMELIST values('Total War: THREE KINGDOMS', 5, 8, 'https://steamcdn-a.akamaihd.net/steam/apps/779340/header.jpg?t=1569580405' , 'Intel Core i5-6600' , '8Gb' ,'GTX 970' , 'nope', null);
insert into FIT_GAMELIST values('CODE VEIN', 4, 7, 'https://steamcdn-a.akamaihd.net/steam/apps/678960/header.jpg?t=1570113292' , 'Intel Core i5-7400' , '8Gb' , 'GTX 960' , 'nope', null);