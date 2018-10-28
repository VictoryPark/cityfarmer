create table cf_gallery(
	ga_no number primary key,
	ga_title vatchar2(100) not null,
    id varchar2(30) REFERENCES cf_member(id),
	ga_content varchar2(4000),
	ga_rec_cnt number default 0,
	ga_view_cnt number default 0,
	ga_reg_date date default sysdate
)

create sequence s_gallery_no;

create table cf_gallery_comment(
	gac_no number primary key,
	ga_no number REFERENCES cf_gallery(ga_no),
	id varchar2(30) REFERENCES cf_member(id),
	gac_content varchar2(300),
	gac_reg_date date default sysdate

)
create sequence s_gallery_comment_no;

create table cf_gallery_file(
	gaf_no number primary key,
	ga_no number REFERENCES cf_gallery(ga_no),
	gaf_ori_name varchar2(100),
	gaf_sys_name varchar2(100),
	gaf_path varchar2(100),
	gaf_size number
	
)
create sequence s_gallery_file_no;

create cf_gallery_rec(
	id varchar2(30) REFERENCES cf_member(id),
	ga_no number REFERENCES cf_gallery(ga_no)
)

