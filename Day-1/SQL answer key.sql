-- 1)Print all the infomation of those customers whose account is currently active.
select * from customer where active='true';

-- 2) Print the total numbers of those customers whose account is currently active.
select count(customer_id) as Total_active_customers from customer where active='true';

-- 3)Print all the information of those customers whose name is started with "J".
select * from customer where first_name like 'J%';

-- 4)Print all the information of those customers whose first name started with "J" and last name ends with "e".
select * from customer where first_name like 'J%' and last_name like '%e';

-- 5)Print the first name,last name and email-id of those customers whose email-id contains '.' in their email-id before the mail name.
select first_name,last_name,email from customer where email like '%%.%@%.%';

-- 6)Print the Names of those customers whose first name is of 5 characters or letters long.
select first_name from customer where first_name like '_____';

-- 7)Print the Names of those customers whose first name is of 5 or more characters or letters long.
select first_name from customer where first_name like '_____%';

-- 8)Print the name and customer-ids of those customers who have ordered nothing.
select c.first_name , c.last_name,c.customer_id
  	from customer as c
    		where c.customer_id not in (
			select distinct customer_id 
				from orders as o );

-- 9)Print the name and customer-ids of those customers who have ordered atleast one item.
select c.first_name , c.last_name,c.customer_id
  	from customer as c
    		where c.customer_id in (
			select distinct customer_id 
				from orders as o );

-- 10)Print the name and customer-ids of those customers who have ordered atleast two item.
select c.first_name , c.last_name,c.customer_id
  	from customer as c
   	      where c.customer_id in (
		select customer_id 
			from orders as o 
				group by (customer_id) 
				      having count(customer_id)>=2);

-- 11)Print the total numbers of items for all the customers who have brought something.
select customer_id,count(customer_id) as total_no_itmes 
	from orders 
		group by(customer_id)

-- 12)Print the name,customer-id and total_amount paid by those customers who have brought some items.
select c.first_name,c.last_name,c.customer_id,sum(o.order_amount)
	from customer as c,orders as o
		 where c.customer_id = o.customer_id
			group by(c.customer_id);

-- 13)Print the name and customer-id of those customers who have brought items worth more than or equal to 100.
select c.first_name , c.last_name,c.customer_id
  	from customer as c
   	      where c.customer_id in (
			select customer_id 
				from orders as o 
				  group by (customer_id) 
				      having sum(order_amount)>=100);

-- 14)Print the name,customer_id and total_amount paid by customers listed from max paid to min paid.
select c.first_name,c.last_name,c.customer_id,sum(o.order_amount) as amount_paid
        from customer as c,orders as o
	 where c.customer_id = o.customer_id
			group by(c.customer_id)
				order by(amount_paid) desc;
