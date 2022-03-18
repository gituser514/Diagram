set search_path to BYGym;



-- number of visits of each member with total paid
select v.user_id,
       u.name,
       count(v.date)       as number_of_visits,
       count(p.payment_id) as nb_of_payments,
       sum(p.amount_paid)  as total_paid
from visits v
         left join "user" u on v.user_id = u.user_id
         left join payments p on u.user_id = p.user_id
group by v.user_id, u.name
order by 2;

-- users with outstanding balance

select u.name,
       s.subscription_id,
       s.subsciption_type,
       s.subscription_price,
       p.amount_paid,
       s.subscription_price - p.amount_paid as outstanding_ammount
from subscription s
         left join payments p on s.subscription_id = p.subscription_id
         left join "user" u on p.user_id = u.user_id
order by 3;


select p.subscription_id, p.user_id
from payments p
order by 1;

-- subscription types of each member

select u.user_id
from "user" u
         left join subscription s on u.user_id = s.user_id

select u.name, p.subscription_id
from "user" u
         left join payments p on u.user_id = p.user_id
order by 2;



select u.name, p.amount_paid
from "user" u
         left join payments p on u.user_id = p.user_id
where subscription_id is null;


-- payments for each subscription type

select s.subsciption_type, sum(p.amount_paid)
from subscription s
         left join payments p on s.subscription_id = p.subscription_id
group by s.subsciption_type;

-- pay per visit revenue
select s2.subscription_id, sum(p2.amount_paid)
from subscription s2
         left join payments p2 on s2.subscription_id = p2.subscription_id
where s2.subscription_id is null
group by s2.subscription_id
order by 1;


-- trainer occupancy

select v.date, t.name
from trainers t
         left join visits v on t.trainer_id = v.trainer_id
         left join "user" u on t.trainer_id = u.trainer_id
where t.name ilike 'John Trainer';



-- visits of users with subscriptions which should have a trainer assigned

select v.visit_id, v.date, u.trainer_id, t.name
from visits v
         left join payments p on v.user_id = p.user_id
         left join "user" u on p.user_id = u.user_id
         left join trainers t on u.trainer_id = t.trainer_id
where subscription_id is not null;



-- view: availability of capacities


select u.user_id, u.name, s.subscription_id
from user u
         left join subscription s on u.user_id = s.user_id
where s.subsciption_type is null;

select s.subscription_price, v.date, v.user_id, s.subscription_id, v.receptionist_id, v.visit_id
from visits v
         left join subscription s on v.user_id = s.user_id;
