
-- INSERT STATEMENTS--

insert into trainers (name, phone_number, e_mail, address,cardio_area_id,weight_area_id)
values ('John Trainer', '1-514-7777777', 'JohnTrainer@someserver.com', 'Monteral6',2,null),
('Jane Trainer', '1-514-88888888', 'JaneTrainer@someserver.com', 'Monteral7',null,1),
 ('Alice Trainer', '1-514-9999999', 'AliceTrainer@someserver.com', 'Monteral8',1,null),
('Mary Trainer', '1-514-98888', 'MaryTrainer@someserver.com', 'Monteral9',1,null);

insert into "user"(name, address, phone_number, preferred_training, e_mail, trainer_id)
values
  ('Basil Kamhiyah', '555 Main Street', '222-333-4444', 'WGHT', 'basil@gmail.com', null),
 ('Alex John', '123 principal Street', '234-543-6543', 'WGHT', 'alex@gmail.com', null),
 ('Marcia White', '2309 Montreal Street', '235-453-2454', 'CARD', 'm_w@gmail.com', 9),
 ('Evan Thomas', '2322 Quebec Street', '265-977-9743', 'WGHT', 'et@hotmail.com', null),
 ('Samantha Smith', '88670 Calgary Street', '767-343-2474', 'CARD', 'sam_smith@gmail.com', null),
 ('MARY SMITH', '47 MySakila Drive', '1-514-111111', 'WGHT', 'MARY.SMITH@someserver.org', null),
 ('PATRICIA JOHNSON', '28 MySQL Boulevard', '1-514-111112', 'WGHT', 'PATRICIA.JOHNSON@someserver.org', 10),
 ('LINDA WILLIAMS', '23 Workhaven Lane  ', '1-514-111113', 'WGHT', 'LINDA.WILLIAMS@someserver.org', 11),
 ('BARBARA JONES ', '1411 Lillydale Drive ', '1-514-111114', 'WGHT', 'BARBARA.JONES@someserver.org', 12),
 ('ELIZABETH BROWN', '1913 Hanoi Way ', '1-514-111115', 'WGHT', 'ELIZABETH.BROWN@someserver.org', 10),
 ('JENNIFER DAVIS ', '1121 Loja Avenue ', '1-514-111116', 'WGHT', 'JENNIFER.DAVIS@someserver.org', 11),
 ('MARIA MILLER ', '692 Joliet Street ', '1-514-111117', 'WGHT', 'MARIA.MILLER@someserver.org', 12),
 ('SUSAN WILSON ', '1566 Inegl Manor ', '1-514-111118', 'WGHT', 'SUSAN.WILSON@someserver.org', 12),
 ('MARGARET MOORE ', '53 Idfu Parkway ', '1-514-111119', 'WGHT', 'MARGARET.MOORE@someserver.org', 10);


insert into receptionists (name, phone_number, e_mail, address)
values ('John Vanier', '1-514-1111111', 'JohnVanier@someserver.com', 'Montreal1'),
 ('Jane Vanier', '1-514-2222222', 'JaneVanier@someserver.com', 'Montreal3'),
 ('Alice Vanier', '1-514-3333333', 'AliceVanier@someserver.com', 'Montreal2'),
 ('Alice Something', '1-514-333333', 'Alice1Vanier@someserver.com', 'Monteral2');



insert into  weight_area (max_capacity, nb_of_weight_machines)
values  (11, 8),
        (13, 10),
        (8, 5);


insert into  cardio_area (max_capacity, nb_of_cardio_machines)
values  (11, 8),
        (13, 10),
        (8, 5);


insert into locker(locker_number, locker_location)
values (1, 'Card'),
 (2, 'Card'),
 (3, 'Card'),
 (4, 'Card'),
 (5, 'Card'),
 (6, 'Card'),
 (7, 'Card'),
 (8, 'Card'),
 (9, 'Card'),
 (10, 'Card'),
 (11, 'Card'),
 (12, 'Card'),
 (13, 'Wght'),
 (14, 'Wght'),
 (15, 'Wght'),
 (16, 'Wght'),
 (17, 'Wght'),
 (18, 'Wght'),
 (19, 'Wght'),
 (20, 'Wght'),
 (21, 'Wght'),
 (22, 'Wght'),
 (23, 'Wght'),
 (24, 'Wght'),
 (25, 'Wght'),
 (26, 'Wght'),
 (27, 'Wght'),
 (28, 'Wght');


 INSERT INTO bygym.visits (date, duration_in_hrs, receptionist_id, cardio_area_id, weight_area_id, user_id, locker_id)
values
('2021-08-11 15:00:00.000000', 2, 4, 2, null, 15, 4),
('2021-08-11 15:00:00.000000', 2, 4, 3, null, 16, 4),
('2021-08-11 15:00:00.000000', 2, 4, 1, null, 17, 4),
('2021-08-11 16:00:00.000000', 2, 4, 1, null, 27, 8),
('2021-08-11 16:00:00.000000', 2, 4, 2, null, 18, 4),
('2021-08-11 16:00:00.000000', 2, 4, 3, null, 19, 4),
('2021-08-11 16:00:00.000000', 2, 4, 1, null, 20, 4),
('2021-08-11 16:00:00.000000', 1, 4, 2, null, 21, 4),
('2021-08-11 16:00:00.000000', 1, 4, 3, null, 22, 4),
('2021-08-11 16:00:00.000000', 1, 4, null, 2, 23, 4),
('2021-08-11 16:00:00.000000', 1, 4, null, 2, 24, 4),
('2021-08-11 16:00:00.000000', 1, 4, null, 2, 26, 2),
('2021-08-11 17:00:00.000000', 1, 4, null, 2, 28, 2),
('2021-08-11 18:00:00.000000', 1, 4, null, 2, 22, 2),
('2021-08-11 19:00:00.000000', 1, 4, null, 2, 18, 2),
('2021-08-12 00:01:48.000000', 2, 4, 1, null, 19, 15),
('2021-08-12 00:02:06.000000', 2, 4, 2, null, 25, 16),
('2021-08-12 00:03:49.000000', 2, 4, 3, null, 18, 17),
('2021-08-12 00:04:29.000000', 2, 4, 1, null, 19, 18),
('2021-08-12 00:04:31.000000', 1, 4, 2, null, 27, 19);


insert into payments( amount_paid, date, payment_method, user_id, subscription_id, receptionist_id, visit_id)
values (350,'2021-08-12 02:43:37.000000 +00:00', 'cc', 6, 1, 1, 21),
 (15, '2021-08-12 02:48:51.000000 +00:00', 'deb', 7, null, 4, 25),
 (30, '2021-07-12 04:48:51.000000 +00:00', 'cc', 14, 2, 4, 24),
 (15, '2021-08-12 03:00:01.000000 +00:00', 'deb', 10, null, 4, 22),
 (15, '2021-08-12 03:00:01.000000 +00:00', 'cc', 11, null, 4, 23),
 (30, '2021-08-12 03:00:40.000000 +00:00', 'deb', 12, 3, 4, 26),
 (15, '2021-08-10 03:00:40.000000 +00:00', 'cc', 12, null, 4, 27),
 (30, '2021-07-12 03:01:36.000000 +00:00', 'cash', 13, 4, 4, 28),
 (15, '2021-08-12 03:01:36.000000 +00:00', 'deb', 9, null, 4, 29),
 (30, '2021-08-12 03:31:49.000000 +00:00', 'cash', 1, 5, 4, 30),
 (15, '2021-08-01 03:31:49.000000 +00:00', 'cc', 3, 6, null, 40),
 (15, '2021-08-12 03:33:17.000000 +00:00', 'deb', 2, 43, null, 22),
 (15, '2021-08-12 03:33:17.000000 +00:00', 'cash', 4, 8, null, 30),
 (350, '2021-08-12 03:36:31.000000 +00:00', 'cc', 8, 7, 4, 33),
( 30, '2021-08-12 03:36:31.000000 +00:00', 'cc', 5, 8, 4, 36);

insert into subscription (subsciption_type, subscription_date, subscription_price, user_id, receptionist_id)
values ('ANN', '2021-08-01 02:43:37.000000 +00:00', 350, 1, 3),
       ('MON', '2021-07-05 04:48:51.000000 +00:00', 30, 2, 4),
       ('MON', '2021-08-06 03:00:40.000000 +00:00', 30, 2, 3),
       ('MON', '2021-07-11 03:01:36.000000 +00:00', 30, 3, 3),
       ('MON', '2021-08-12 03:31:49.000000 +00:00', 30, 1, 2),
       ('MON', '2021-08-12 03:31:49.000000 +00:00', 30, 3, 2),
       ('ANN', '2021-08-12 03:36:31.000000 +00:00', 350, 8, 1),
       ('ANN', '2021-08-12 03:26:31.000000 +00:00', 350, 3, 1),
       ('MON', '2021-08-12 03:36:31.000000 +00:00', 30, 4, 1);


