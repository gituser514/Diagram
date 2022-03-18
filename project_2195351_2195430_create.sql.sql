create schema if not exists BYGym;

set search_path to ByGym;
drop table if exists "user";
drop table bygym."user" cascade;
--Users (USER_ID, name, address, phone_number, preffered_training)

create table if not exists "user"
(
    user_id            integer generated always as identity primary key,
    name               varchar(30) unique not null,
    address            text unique not null,
    phone_number       varchar(12) unique not null,
    preferred_training text,
    e_mail             text unique not null,
    trainer_id       integer references trainers (trainer_id),

    check (length(e_mail) >= 6 and e_mail ilike '%@%.%'),-- if constraint not satisfyied, insert wont work
    check (length(phone_number)>= 10)
);


--Receptionists(RECEPTIONIST_ID, name, e-mail, phone_number, address)
drop table if exists  receptionists;
drop table bygym.receptionists cascade;
create table if not exists receptionists
(
    receptionist_id integer generated always as identity primary key,
    name            varchar(30) unique not null,
    e_mail          text unique not null,
    phone_number    varchar(18) unique not null,
    address         text unique not null,
    check (length(e_mail) >= 6 and e_mail ilike '%@%.%'), -- if constraint not satisfyied, insert wont work
    check (length(phone_number)>= 10)

    );


--Trainers (TRAINER_ID, name, email, phone_number, address)
drop table if exists trainers;
drop table bygym.trainers cascade;
create table if not exists trainers (
    trainer_id integer generated always as identity primary key,
    name            varchar(30) unique not null,
    e_mail          text unique not null,
    phone_number    varchar(15) unique not null,
    address         text unique not null,
    cardio_area_id integer references cardio_area (cardio_area_id),
    weight_area_id integer references weight_area (weight_area_id),
    check (length(e_mail) >= 6 and e_mail ilike '%@%.%'), -- if constraint not satisfyied, insert wont work
    check (length(phone_number)>= 10),
    check (cardio_area_id is not null or weight_area_id is not null)
);


-- Weight Area(WEIGHT_AREA_ID, max_capacity, nb_of_weight_machines)
drop table bygym.weight_area cascade;

create table if not exists weight_area (
weight_area_id integer generated always as identity primary key,
max_capacity integer not null,
nb_of_weight_machines integer not null
);


--Cardio Area(CARDIO_AREA_ID, max_capacity, nb_of_weight_machines)
drop table bygym.cardio_area cascade;


create table if not exists cardio_area (
cardio_area_id integer generated always as identity primary key,
max_capacity integer not null,
nb_of_cardio_machines integer not null
);


--Locker (LOCKER_ID, locker_number, locker_location)
drop table bygym.locker cascade;

create table if not exists locker (
locker_number integer unique not null, -- lockers have to have a locker number
locker_location varchar (4) not null
);


--Visits(VISIT_ID, date, duration, RECEPTIONIST_ID*,
-- USER_ID*, LOCKER_ID*, CARDIO_AREA_ID*, WEIGHT_AREA_ID*)

drop table bygym.visits cascade;


create table if not exists visits (
Visit_id integer generated always as identity primary key,
date timestamp not null,
duration_in_hrs int not null,
receptionist_id integer references receptionists (receptionist_id),
user_id integer references "user" (user_id) not null,
locker_id integer references locker (locker_number),
cardio_area_id integer references cardio_area (cardio_area_id),
weight_area_id integer references weight_area (weight_area_id),
trainer_id integer references trainers (trainer_id),
check (cardio_area_id is not null or weight_area_id is not null)
);



--Payment(PAYMENT_ID, amount_paid, Date, payment_method, USER_ID*,
-- SUBSCRIPTION_ID*, RECEPTIONIST_ID*, VISIT_ID*)

create table if not exists payments(
payment_id integer generated always as identity primary key,
amount_paid integer not null,
date timestamp default now () not null,
payment_method varchar (6) not null,
user_id integer references "user" (user_id) not null,
subscription_id integer references subscription (subscription_id),
receptionist_id integer references receptionists (receptionist_id) not null,
visit_id integer references visits (Visit_id)
check (subscription_id is not null or visit_id is not null)
);


--Subscription(SUBSCRIPTION_ID, subscription_date, length_of_subs, subscription_price)
drop table if exists subscription;
drop table bygym.subscription cascade;
create table if not exists subscription
(
    subscription_id   integer generated always as identity primary key,
    subsciption_type  varchar(3),-- MON, ANN, NULL (USERS NOT SUBSCRIBED)
    subscription_date date not null,
    subscription_price integer not null,
    user_id integer references "user" (user_id) not null,
    receptionist_id integer references receptionists (receptionist_id)

);



