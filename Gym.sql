create schema if not exists BYGym;

set search_path to BYGym;

--Users (USER_ID, name, address, phone_number, preffered_training)
rop table if exists users cascade;
create table users
(
    user_id            integer generated always as identity primary key,
    name               varchar(30) unique not null,
    address            text unique        not null,
    phone_number       varchar(12) unique not null,
    preferred_training text,
    e_mail             text unique        not null,
    trainer_id         integer references trainers (trainer_id),
    check (length(e_mail) >= 6 and e_mail ilike '%@%.%' ),
    check (length(phone_number) >= 10)
);


--Subscription(SUBSCRIPTION_ID, subscription_date, length_of_subs, subscription_price)

drop table if exists subscriptions;
create table subscriptions
(
    subscription_id    integer generated always as identity primary key,
    subscription_date  date default now() not null,
    subscription_type  varchar(3), -- MON, ANN, NULL (USER NOT SUBSCRIBED)
    subscription_price integer

);

--Receptionists(RECEPTIONIST_ID, name, e-mail, phone_number, address)
drop table if exists receptionists;
create table receptionists
(
    receptionist_id integer generated always as identity primary key,
    name            varchar(30) unique not null,
    phone_number    varchar(12) unique not null,
    email           text unique        not null,
    address         text unique        not null,
    check ( length(email) >= 6 and email ilike '%@%.%')
);

--Trainers (TRAINER_ID, name, email, phone_number, address)
drop table if exists trainers;
create table trainers
(
    trainers_id  integer generated always as identity primary key,
    name         varchar(30) unique not null,
    phone_number varchar(12) unique not null,
    email        text unique        not null,
    address      text unique        not null,
    check ( length(email) >= 6 and email ilike '%@%.%')
);

--Weight Area(WEIGHT_AREA_ID, max_capacity, nb_of_weight_machines)
drop table if exists weight_area;
create table weight_area
(
    weight_area_id        integer generated always as identity primary key,
    max_capacity          integer not null,
    nb_of_weight_machines integer not null

);

--Cardio Area(CARDIO_AREA_ID, max_capacity, nb_of_cardio_machines)

drop table if exists cardio_area;
create table cardio_area
(
    cardio_area_id        integer generated always as identity primary key,
    max_capacity          integer not null,
    nb_of_cardio_machines integer not null

);


--Locker (LOCKER_ID, locker_number, locker_location)
drop table if exists locker;
create table locker
(
    locker_id       integer generated always as identity primary key,
    locker_number   integer unique not null,
    locker_location varchar(4)     not null

);

--Visits(VISIT_ID, date, duration, RECEPTIONIST_ID*,
-- USER_ID*, LOCKER_ID*, CARDIO_AREA_ID*, WEIGHT_AREA_ID*)

drop table if exists visits;
create table visits
(
    visit_id        integer generated always as identity primary key,
    date            timestamp                      not null,
    duration_in_hrs int                            not null,
    receptionist_id int references receptionists (receptionist_id),
    cardio_area_id  int references cardio_area (cardio_area_id),
    weight_area_id  int references weight_area (weight_area_id),
    user_id         int references users (user_id) not null,
    locker_id       int references locker (locker_id),

    check (cardio_area_id is not null or weight_area_id is not null )

);

--Payment(PAYMENT_ID, amount_paid, Date, payment_method, USER_ID*, SUBSCRIPTION_ID*, RECEPTIONIST_ID*, VISIT_ID*)
drop table if exists payments;
create table payments
(
    payment_id      integer generated always as identity primary key,
    amount_paid     integer                                        not null,
    date            timestamp default now()                        not null,
    payment_method  varchar(6)                                     not null,
    user_id         int references users (user_id)                 not null,
    subscription_id int references subscriptions (subscription_id),
    receptionist_id int references receptionists (receptionist_id) not null,
    visit_id        int references visits (visit_id),
    check (subscription_id is not null or visit_id is not null)
);


--Supervisors(SUPERVISOR_ID, name, email, phone_number, address)
drop table if exists supervisors;
create table supervisors
(
    supervisors_id integer generated always as identity primary key,
    name           varchar(30) unique not null,
    phone_number   varchar(12) unique not null,
    email          text unique        not null,
    address        text unique        not null,
    check ( length(email) >= 6 and email ilike '%@%.%')
);
