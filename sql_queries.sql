# ~~~~~~~~~~~~~~~~~~~~~ SMA Database ~~~~~~~~~~~~~~~~~~~~~~~~~~~

create database smadb;

use smadb;



# ~~~~~~~~~~~~~~~~~~~~~~~~ create status tables ~~~~~~~~~~~~~~~~~~~~~
create table status(
    status_id int primary key auto_increment,
    type char(30) not null unique
);


# ~~~~~~~~~~~~~~~~~~~~~~~~ create countries tables ~~~~~~~~~~~~~~~~~~~~~
create table countries(
    country_id int primary key auto_increment,
    name char(50) not null unique
);


# ~~~~~~~~~~~~~~~~~~~~~~~~ create states tables ~~~~~~~~~~~~~~~~~~~~~
create table states(
    state_id int primary key auto_increment,
    country_id int not null,
    name char(50) not null,
    constraint states_country_fk foreign key (country_id) references countries(country_id)
);


# ~~~~~~~~~~~~~~~~~~~~~~~~ create cities tables ~~~~~~~~~~~~~~~~~~~~~
create table cities(
    city_id int primary key auto_increment,
    state_id int not null,
    name char(50) not null,
    constraint cities_state_fk foreign key (state_id) references states(state_id)
);



# ~~~~~~~~~~~~~~~~~~~~~~~~ create users tables ~~~~~~~~~~~~~~~~~~~~~
create table users (
    user_id int primary key auto_increment,
    username char(30) not null unique,
    fullname char(50) not null,
    password char(255) not null,
    email char(255) not null unique,
    mobile char(10) not null unique,
    verification_code char(255),
    status_id int not null,
    creation_date datetime not null,
    profile_pic_path char(255) unique,
    background_pic_path char(255) unique,
    about varchar(1000),
    dob date not null,
    gender char(1) not null,
    address varchar(500),
    profession char(50),
    linkedin char(255) unique,
    instagram char(255) unique,
    youtube char(255) unique,
    github char(255) unique,
    city_id int not null,
    constraint users_status_fk foreign key (status_id) references status(status_id),
    constraint users_city_fk foreign key (city_id) references cities(city_id)
);



# ~~~~~~~~~~~~~~~~~~~~~~~ create table institutes ~~~~~~~~~~~~~~~~
create table institutes (
    institute_id int primary key auto_increment,
    name char(60) not null unique
);



# ~~~~~~~~~~~~~~~~~~~~~~~ create table courses ~~~~~~~~~~~~~~~~
create table courses (
    course_id int primary key auto_increment,
    name char(50) not null unique
);



# ~~~~~~~~~~~~~~~~~~~~~~ create table educations ~~~~~~~~~~~~~~~~
create table educations (
    education_id int primary key auto_increment,
    user_id int not null,
    institute_id int not null,
    course_id int not null,
    city_id int not null,
    batch int,
    constraint edu_user_fk foreign key (user_id) references users(user_id),
    constraint edu_ins_fk foreign key (institute_id) references institutes(institute_id),
    constraint edu_course_fk foreign key (course_id) references courses(course_id),
    constraint edu_city_fk foreign key (city_id) references cities(city_id)
);


# ~~~~~~~~~~~~~~~~~~~~ create table group_types ~~~~~~~~~~~~~~~~~~
create table group_types (
    group_type_id int primary key auto_increment,
    type char(30) not null unique
);


# ~~~~~~~~~~~~~~~~~~~~~~~ create table groups_profiles ~~~~~~~~~~~~~~~~~~~~
create table group_profiles (
    group_id int primary key auto_increment,
    user_id int not null,
    group_type_id int not null,
    creation_time datetime not null,
    members int not null default 2,
    constraint groups_user_fk foreign key (user_id) references users(user_id),
    constraint groups_gt_fk foreign key (group_type_id) references group_types(group_type_id)
);



# ~~~~~~~~~~~~~~~~~~~~~ create table group_members ~~~~~~~~~~~~~~~~~~~~
create table group_members (
    group_member_id int primary key auto_increment,
    group_id int not null,
    user_id int not null,
    role boolean not null default TRUE,
    constraint gm_group_fk foreign key (group_id) references group_profiles(group_id),
    constraint gm_user_fk foreign key (user_id) references users(user_id)
);




# ~~~~~~~~~~~~~~~~~~~ create table group_chats ~~~~~~~~~~~~~~~~~~~
create table group_chats (
    group_chat_id int primary key auto_increment,
    group_member_id int not null,
    status_id int not null,
    message varchar(1000) not null,
    message_date datetime not null,
    constraint gc_gm_fk foreign key (group_member_id) references group_members(group_member_id),
    constraint gc_status_fk foreign key (status_id) references status(status_id)
);



# ~~~~~~~~~~~~~~~~~~~ create table posts ~~~~~~~~~~~~~~~~~~~~~~
create table posts (
    post_id int primary key auto_increment,
    user_id int not null,
    creation_time datetime not null,
    comment_count int not null default 0,
    like_count int not null default 0,
    main_heading char(80),
    textarea varchar(5000),
    pic char(150),
    constraint posts_user_fk foreign key (user_id) references users(user_id),
    media_type_id int not null default 1,
    constraint media_types_fk foreign key (media_type_id) references media_types(media_type_id)

);



# ~~~~~~~~~~~~~~~~~~~ create table comments ~~~~~~~~~~~~~~~~~~~
create table comments (
    comment_id int primary key auto_increment,
    user_id int not null,
    post_id int not null,
    comment varchar(1000) not null,
    comment_time datetime not null,
    viewed boolean not null default FALSE,
    constraint comments_user_fk foreign key (user_id) references users(user_id),
    constraint comments_post_fk foreign key (post_id) references posts(post_id)
);




# ~~~~~~~~~~~~~~~~~~~ create table likes ~~~~~~~~~~~~~~~~~~~
create table likes (
    like_id int primary key auto_increment,
    user_id int not null,
    post_id int not null,
    viewed boolean not null default FALSE,
    constraint likes_user_fk foreign key (user_id) references users(user_id),
    constraint likes_post_fk foreign key (post_id) references posts(post_id)
);



# ~~~~~~~~~~~~~~~~~~~~~ create table friend_requests ~~~~~~~~~~~~~~~~~~~
create table friend_requests (
    friend_request_id int primary key auto_increment,
    sender_user_id int not null,
    reciever_user_id int not null,
    request_time datetime not null,
    status_id int not null,
    viewed boolean not null default FALSE,
    constraint fr_user_fk1 foreign key (sender_user_id) references users(user_id),
    constraint fr_user_fk2 foreign key (reciever_user_id) references users(user_id)
);



# ~~~~~~~~~~~~~~~~~~~~~ create table chats ~~~~~~~~~~~~~~~~~~~
create table chats (
    chat_id int primary key auto_increment,
    from_user_id int not null,
    to_user_id int not null,
    message varchar(1000) not null,
    send_time datetime not null,
    status_id int not null,
    constraint chats_user_fk1 foreign key (from_user_id) references users(user_id),
    constraint chats_user_fk2 foreign key (to_user_id) references users(user_id),
    constraint chats_status_fk foreign key (status_id) references status(status_id)
);



# ~~~~~~~~~~~~~~~~~~~~ create table media_types ~~~~~~~~~~~~~~~~~~
create table media_types (
    media_type_id int primary key auto_increment,
    type char(40) not null unique
);



# ~~~~~~~~~~~~~~~~~~ create table medias ~~~~~~~~~~~~~~~~~~~~~~~~
create table medias (
    media_id int primary key auto_increment,
    post_id int not null,
    path char(255) not null,
    media_type_id int not null,
    constraint medias_post_fk foreign key (post_id) references posts(post_id),
    constraint medias_mt_fk foreign key (post_id) references media_types(media_type_id)
);


system cls;


insert into media_types (type) values ('audio'), ('video'), ('image'), ('gif');


insert into status (type) values ('active'), ('inactive'), ('blocked'), ('closed'), ('accepted'), ('pending'), ('rejected');


insert into group_types (type) values ('friends'), ('family'), ('work');

system cls;

insert into countries (name) values
('Afghanistan'),('Albania'),('Algeria'),('Andorra'),('Angola'),('Antigua and Barbuda'),('Argentina'),('Armenia'),('Australia'),('Austria'),('Azerbaijan'),('Bahamas'),('Bahrain'),('Bangladesh'),('Barbados'),('Belarus'),('Belgium'),('Belize'),('Benin'),('Bhutan'),('Bolivia'),('Bosnia and Herzegovina'),('Botswana'),('Brazil'),('Brunei'),
('Bulgaria'),('Burkina Faso'),('Burundi'),('Cabo Verde'),('Cambodia'),('Cameroon'),('Canada'),('Central African Republic'),('Chad'),('Chile'),('China'),('Colombia'),
('Comoros'),('Congo, Democratic Republic of the'),('Congo, Republic of the'),('Costa Rica'),('Croatia'),('Cuba'),('Cyprus'),('Czech Republic'),('Denmark'),('Djibouti'),('Dominica'),('Dominican Republic'),('Ecuador'),('Egypt'),('El Salvador'),('Equatorial Guinea'),('Eritrea'),('Estonia'),
('Eswatini'),('Ethiopia'),('Fiji'),('Finland'),('France'),('Gabon'),('Gambia'),('Georgia'),('Germany'),('Ghana'),('Greece'),('Grenada'),('Guatemala'),
('Guinea'),('Guinea-Bissau'),('Guyana'),('Haiti'),('Honduras'),('Hungary'),('Iceland'),('India'),('Indonesia'),('Iran'),('Iraq'),('Ireland'),('Israel'),('Italy'),
('Jamaica'),('Japan'),('Jordan'),('Kazakhstan'),('Kenya'),('Kiribati'),('Korea, North'),
('Korea, South'),('Kosovo'),('Kuwait'),('Kyrgyzstan'),('Laos'),('Latvia'),('Lebanon'),('Lesotho'),('Liberia'),('Libya'),('Liechtenstein'),('Lithuania'),
('Luxembourg'),('Madagascar'),('Malawi'),('Malaysia'),('Maldives'),('Mali'),
('Malta'),('Marshall Islands'),('Mauritania'),('Mauritius'),('Mexico'),('Micronesia'),('Moldova'),('Monaco'),('Mongolia'),('Montenegro'),('Morocco'),('Mozambique'),('Myanmar'),('Namibia'),('Nauru'),('Nepal'),('Netherlands'),
('New Zealand'),('Nicaragua'),('Niger'),('Nigeria'),('North Macedonia'),('Norway'),('Oman'),('Pakistan'),('Palau'),
('Palestine'),('Panama'),('Papua New Guinea'),('Paraguay'),('Peru'),('Philippines'),('Poland'),('Portugal'),('Qatar'),('Romania'),('Russia'),('Rwanda'),
('Saint Kitts and Nevis'),('Saint Lucia'),('Saint Vincent and the Grenadines'),
('Samoa'),('San Marino'),('Sao Tome and Principe'),('Saudi Arabia'),('Senegal'),('Serbia'),('Seychelles'),('Sierra Leone'),('Singapore'),('Slovakia'),('Slovenia'),('Solomon Islands'),
('Somalia'),('South Africa'),('South Sudan'),('Spain'),('Sri Lanka'),('Sudan'),('Suriname'),
('Sweden'),('Switzerland'),('Syria'),('Taiwan'),('Tajikistan'),('Tanzania'),('Thailand'),('Timor-Leste'),('Togo'),('Tonga'),('Trinidad and Tobago'),('Tunisia'),
('Turkey'),('Turkmenistan'),('Tuvalu'),('Uganda'),('Ukraine'),('United Arab Emirates'),('United Kingdom'),('United States'),('Uruguay'),('Uzbekistan'),('Vanuatu'),('Vatican City'),
('Venezuela'),('Vietnam'),('Yemen'),('Zambia'),('Zimbabwe');

system cls;


show tables;



