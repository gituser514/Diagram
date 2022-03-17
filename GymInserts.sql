-- inserts

insert into "user"(name, address, phone_number, preferred_training, e_mail)
values  ('Basil Kamhiyah', '555 Main Street', '222-333-4444', 'WGHT', 'basil@gmail.com'),
       ('Alex John', '123 principal Street', '234-543-6543', 'WGHT', 'alex@gmail.com' ),
       ('Marcia White', '2309 Montreal Street', '235-453-2454', 'CARD', 'm_w@gmail.com'),
       ('Evan Thomas', '2322 Quebec Street', '265-977-9743', 'WGHT', 'et@hotmail.com'),
       ('Samantha Smith', '88670 Calgary Street', '767-343-2474', 'CARD', 'sam_smith@gmail.com');


insert into users (name, address, phone_number, preferred_training, e_mail, subscription_id)
values ('MARY SMITH', '47 MySakila Drive', ' 1-514-1111111', 'WGHT', 'MARY.SMITH@someserver.org', 1),
       ('PATRICIA JOHNSON', ', ''28 MySQL Boulevard', '1-514-1111112', 'WGHT', 'PATRICIA.JOHNSON@someserver.org', 2),
       ('LINDA WILLIAMS', '23 Workhaven Lane  ', '1-514-1111113 ', 'WGHT', 'LINDA.WILLIAMS@someserver.org', 3),
       ('BARBARA JONES ', '1411 Lillydale Drive ', '1-514-1111114', 'WGHT', 'BARBARA.JONES@someserver.org', null),
       ('ELIZABETH BROWN ', '1913 Hanoi Way ', '1-514-1111115', 'WGHT', 'ELIZABETH.BROWN@someserver.org', null),
       ('JENNIFER DAVIS ', '1121 Loja Avenue ', '1-514-1111116', 'WGHT', 'JENNIFER.DAVIS@someserver.org', null),
       ('MARIA MILLER ', '692 Joliet Street ', '1-514-1111117', 'WGHT', 'MARIA.MILLER@someserver.org', null),
       ('SUSAN WILSON ', '1566 Inegl Manor ', '1-514-1111118', 'WGHT', 'SUSAN.WILSON@someserver.org', null),
       ('MARGARET MOORE ', '53 Idfu Parkway ', '1-514-1111119', 'WGHT', 'MARGARET.MOORE@someserver.org', null),
       ('DOROTHY TAYLOR ', '1795 Santiago de Compostela Way ', '1-514-1111120', 'WGHT', 'DOROTHY.TAYLOR@someserver.org',
        null),
       ('LISA ANDERSON ', '900 Santiago de Compostela Parkway ', '1-514-1111121', 'CARD',
        'LISA.ANDERSON@someserver.org', null),
       ('NANCY THOMAS ', '478 Joliet Way ', '1-514-1111122', 'CARD', 'NANCY.THOMAS@someserver.org', null),
       ('KAREN JACKSON ', '613 Korolev Drive ', '1-514-1111123', 'CARD', 'KAREN.JACKSON@someserver.org', null),
       ('BETTY WHITE ', '1531 Sal Drive ', '1-514-1111124', 'CARD', 'BETTY.WHITE@someserver.org', null),
       ('HELEN HARRIS ', '1542 Tarlac Parkway ', '1-514-1111125', 'CARD', 'HELEN.HARRIS@someserver.org', null),
       ('SANDRA MARTIN ', '808 Bhopal Manor ', '1-514-1111126', 'CARD', 'SANDRA.MARTIN@someserver.org', null),
       ('DONNA THOMPSON ', '270 Amroha Parkway ', '1-514-1111127', 'CARD', 'DONNA.THOMPSON@someserver.org', null),
       ('CAROL GARCIA ', '770 Bydgoszcz Avenue ', '1-514-1111128', 'CARD', 'CAROL.GARCIA@someserver.org', null),
       ('RUTH MARTINEZ ', '419 Iligan Lane ', '1-514-1111129', 'CARD', 'RUTH.MARTINEZ@someserver.org', null),
       ('SHARON ROBINSON ', '360 Toulouse Parkway ', '1-514-1111130', 'CARD', 'SHARON.ROBINSON@someserver.org', null),
       ('MICHELLE CLARK ', '270 Toulon Boulevard ', '1-514-1111131', 'CARD', 'MICHELLE.CLARK@someserver.org', null),
       ('LAURA RODRIGUEZ ', '320 Brest Avenue ', '1-514-1111132', 'CARD', 'LAURA.RODRIGUEZ@someserver.org', null),
       ('SARAH LEWIS ', '1417 Lancaster Avenue ', '1-514-1111133', 'CARD', 'SARAH.LEWIS@someserver.org', null),
       ('KIMBERLY LEE ', '1688 Okara Way ', '1-514-1111134', 'CARD', 'KIMBERLY.LEE@someserver.org', null),
       ('DEBORAH WALKER ', '262 A Corua (La Corua) Parkway ', '1-514-1111135', 'CARD', 'DEBORAH.WALKER@someserver.org',
        2),
       ('JESSICA HALL ', '28 Charlotte Amalie Street ', '1-514-1111136', 'CARD', 'JESSICA.HALL@someserver.org', null);




create table if not exists "user"
(
    user_id            integer generated always as identity primary key,
    name               varchar(30) unique not null,
    address            text unique not null,
    phone_number       varchar(12) unique not null,
    preferred_training text,
    e_mail             text unique not null,
    subscription_id    integer references subscription (subscription_id),
    check (length(e_mail) >= 6 and e_mail ilike '%@%.%'),-- if constraint not satisfyied, insert wont work
    check (length(phone_number)>= 10)
);

drop table if exists subscription;
drop table bygym.subscription cascade;
create table if not exists subscription
(
    subscription_id   integer generated always as identity primary key,
    subscrption_date  date default now() not null,
    subsciption_type  varchar(3),-- MON, ANN, NULL (USERS NOT SUBSCRIBED)
    subscription_price integer,
    receptionist_id integer references receptionists (receptionist_id)

);
insert into subscription(subscrption_date, subsciption_type, subscription_price,receptionist_id)
values ('2022-03-02', 'ANN', 350,3),
       ('2022-03-02', 'ANN', 350,4),
       ('2021-01-21','ANN',350,3),
       ('2021-08-21','MON',30,3);



insert into receptionists (name, phone_number, email, address)
values ('John Vanier', '1-514-1111111', 'JohnVanier@someserver.com', 'Monteral');
insert into receptionists (name, phone_number, email, address)
values ('Jane Vanier', '1-514-2222222', 'JaneVanier@someserver.com', 'Monteral1');
insert into receptionists (name, phone_number, email, address)
values ('Alice Vanier', '1-514-3333333', 'AliceVanier@someserver.com', 'Monteral2');

insert into supervisors (name, phone_number, email, address)
values  ('John Supervisor', '1-514-4444444', 'JohnSupervisor@someserver.com', 'Monteral3');
insert into supervisors (name, phone_number, email, address)
values  ('Jane Supervisor', '1-514-5555555', 'JaneSupervisor@someserver.com', 'Monteral4');
insert into supervisors (name, phone_number, email, address)
values  ('Alice Supervisor', '1-514-6666666', 'AliceSupervisor@someserver.com', 'Monteral5');

insert into trainers (name, phone_number, email, address)
values ('John Trainer', '1-514-7777777', 'JohnTrainer@someserver.com', 'Monteral6');
insert into trainers (name, phone_number, email, address)
values ('Jane Trainer', '1-514-88888888', 'JaneTrainer@someserver.com', 'Monteral7');
insert into trainers (name, phone_number, email, address)
values ('Alice Trainer', '1-514-9999999', 'AliceTrainer@someserver.com', 'Monteral8');




insert into weight_area (max_capacity, nb_of_weight_machines)
values (5, 4),
       (4, 3),
       (4, 3);


insert into cardio_area (max_capacity, nb_of_cardio_machines)
values (5, 4),
       (4, 3),
       (4, 3)


insert into locker (locker_number, locker_location) VALUES (0002, 'Card');
insert into locker (locker_number, locker_location) VALUES (0003, 'Card');
insert into locker (locker_number, locker_location) VALUES (0001, 'Card');
insert into locker (locker_number, locker_location) VALUES (0004, 'Card');
insert into locker (locker_number, locker_location) VALUES (0005, 'Card');
insert into locker (locker_number, locker_location) VALUES (0006, 'Card');
insert into locker (locker_number, locker_location) VALUES (0007, 'Card');
insert into locker (locker_number, locker_location) VALUES (0008, 'Card');
insert into locker (locker_number, locker_location) VALUES (0009, 'Card');
insert into locker (locker_number, locker_location) VALUES (0010, 'Card');
insert into locker (locker_number, locker_location) VALUES (0011, 'Card');
insert into locker (locker_number, locker_location) VALUES (0012, 'Card');
insert into locker (locker_number, locker_location) VALUES (0013, 'Wght');
insert into locker (locker_number, locker_location) VALUES (0014, 'Wght');
insert into locker (locker_number, locker_location) VALUES (0015, 'Wght');
insert into locker (locker_number, locker_location) VALUES (0016, 'Wght');
insert into locker (locker_number, locker_location) VALUES (0017, 'Wght');
insert into locker (locker_number, locker_location) VALUES (0018, 'Wght');
insert into locker (locker_number, locker_location) VALUES (0019, 'Wght');
insert into locker (locker_number, locker_location) VALUES (0020, 'Wght');
insert into locker (locker_number, locker_location) VALUES (0021, 'Wght');
insert into locker (locker_number, locker_location) VALUES (0022, 'Wght');
insert into locker (locker_number, locker_location) VALUES (0023, 'Wght');
insert into locker (locker_number, locker_location) VALUES (0024, 'Wght');



