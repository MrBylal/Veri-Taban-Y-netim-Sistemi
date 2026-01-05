create database OyunProje;

go;

use OyunProje;
create table users(
user_id int identity(1,1) primary key,
user_name varchar(30) not null,
email varchar(50) not null,
password varchar(50) not null,
created_at datetime default getdate(),
last_login datetime

);

go;

use OyunProje;
create table powerup(
powerup_id int identity(1,1) primary key,
powerup_name varchar(50) not null,
description varchar(250) not null
);

go;

use OyunProje;
create table Levels(
level_id int identity(1,1) primary key,
level_number int not null,
target_score int not null,
max_moves int not null,
created_at datetime default getdate()
);

use OyunProje;
create table Lives(
user_id int primary key,
remaining_life int default 5,
last_life_given_at datetime not null,
foreign key (user_id) references users(user_id) on delete cascade on update cascade
);

go;

use OyunProje;
create table scores(
score_id int identity(1,1) primary key,
user_id int not null,
level_id int not null,
moves_used int not null,
score int not null,
achieved_at datetime default getdate(),
foreign key (user_id) references users(user_id) on delete cascade on update cascade,
foreign key (level_id) references Levels(level_id) on delete cascade on update cascade
);

go;

use OyunProje;
create table orders(
order_id int identity(1,1) primary key,
user_id int not null,
powerup_id int not null,
quantity int not null,
ordered_at datetime default getdate(),
foreign key (user_id) references users(user_id) on delete cascade on update cascade,
foreign key (powerup_id) references powerup(powerup_id) on delete cascade on update cascade
);

go;

use OyunProje;
create table user_powerups(
user_id int not null,
powerup_id int not null,
quantity int not null,

primary key(user_id,powerup_id),
foreign key (user_id) references users(user_id) on delete cascade on update cascade,
foreign key (powerup_id) references powerup(powerup_id) on delete cascade on update cascade
);

go;