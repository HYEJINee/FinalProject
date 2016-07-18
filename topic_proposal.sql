use tawar;

set foreign_key_checks=0;
drop table user_tbl;
drop table topic_tbl;
drop table topic_detail_tbl;
drop table recommend_tbl;
drop table topic_resource_tbl;
drop table topic_cover_img_tbl;
set foreign_key_checks=1;

create table user_tbl(
   user_no		int  		not null	auto_increment,
   user_email	varchar(50)	not null,
   user_pw		varchar(50)	not null,
   user_nick	varchar(50)	not null,
   user_lv		int			not null	default 0,
   user_profile	varchar(50),
   primary key(user_no)
);

create table topic_tbl(
	topic_no			int				not null	auto_increment,
    user_no				int				not	null,
    topic_regdate		datetime 		not null	default now(),
    topic_endate		datetime		not null,
    topic_type			int				not null,
    topic_title			varchar(100)	not null,
    topic_short_cont	text			not null,
    topic_progress		int				not null	default 0,
    primary key(topic_no),
    foreign key(user_no) references user_tbl (user_no)
);

create table topic_detail_tbl(
	topic_no		int			not null,
    topic_long_cont	text		not null,
    topic_pro		text		not null,
    topic_con		text		not null,
    foreign key(topic_no) references topic_tbl (topic_no)
);

create table recommend_tbl(
	topic_no	int		not null,
    user_no		int		not null,
    foreign key(topic_no) references topic_tbl (topic_no),
	foreign key(user_no) references user_tbl (user_no)
);

create table topic_resource_tbl(
	topic_resource_no		int				not null	auto_increment,
    topic_no				int				not null,
    topic_resource_title	varchar(50)		not null,
    topic_resource_link		varchar(50)		not null,
    primary key(topic_resource_no),
    foreign key(topic_no) references topic_tbl (topic_no)
);

create table topic_cover_img_tbl(
	topic_no			int				not null,
    img_file_name		varchar(30)		not null,
    img_regdate			timestamp		not null		default now(),
    foreign key(topic_no) references topic_tbl (topic_no)
);


insert into user_tbl(user_email, user_nick, user_pw) values ('aaa@aaa.com', 'test', '1111');
insert into topic_tbl(user_no, topic_endate, topic_type, topic_title, topic_short_cont) values(1, date_add(now(), interval +10 day), 0, '테스트 토론', '테스트 토론입니다.');