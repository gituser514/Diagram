
--Users (USER_ID, name, address, phone_number, preffered_training)
--Subscription(SUBSCRIPTION_ID, subscription_date, length_of_subs)
--Receptionists(RECEPTIONIST_ID, name, e-mail, phone_number, address)
--Trainers (TRAINER_ID, name, email, phone_number, address)
--Visits(VISIT_ID, date, duration, workout_area_chosen, RECEPTIONIST_ID*, USER_ID*, LOCKER_ID*, CARDIO_AREA_ID*, WEIGHT_AREA_ID*)
--Payment(PAYMENT_ID, amount_paid, Date, payment_method, USER_ID*, SUBSCRIPTION_ID*, RECEPTIONIST_ID*, VISIT_ID*)
-- Supervisors(SUPERVISOR_ID, name, email, phone_number, address)
-- Weight Area(WEIGHT_AREA_ID, max_capacity, nb_of_weight_machines)
--Cardio Area(CARDIO_AREA_ID, max_capacity, nb_of_weight_machines)

--Locker (LOCKER_ID, locker_number, locker_location)t
