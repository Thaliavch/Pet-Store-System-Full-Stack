--Question 1:
create view rabbit_owner_count as
	select count(*)
	from customer
	where customer_id in (select distinct customer_id
						  from customer join pet on customer_id = owner_id
						  where species = 'Rabbit');
						  
--Question 2:
select breed, count(*), dense_rank() over (order by count(*) desc) as rank
from pet
where species = 'Cat'
group by breed
order by rank;

--Question 3:
update stock
	set quantity = quantity + 30
	where item_id between 21 and 30; --health products
	
--Question 4:
CREATE OR REPLACE FUNCTION most_valuable_users()
	RETURNS TABLE(id NUMERIC(8,0), name VARCHAR(30),
		points NUMERIC(5,0)) AS $$
BEGIN
	RETURN QUERY
	SELECT customer_id, customer_name, reward_points
	FROM customer
	WHERE reward_points = (select max(reward_points)
						   from customer);
END;
$$ LANGUAGE plpgsql;


 -- question 5 
-- Create a view to find out the total sales amount made by each cashier along with their 
-- full name and position for a given time period.


CREATE OR REPLACE VIEW sales_by_employee AS
	SELECT e.employee_id, e.full_name, e.position,
		   SUM(si.price) AS total_sales_amount
	FROM transaction t
	INNER JOIN employee e ON t.cashier_id = e.employee_id
	INNER JOIN sold_item si ON t.trans_id = si.trans_id
	WHERE t.trans_date BETWEEN '2023-08-11 00:00:00' AND '2023-09-16 00:00:00'
	GROUP BY e.employee_id, e.full_name, e.position;
	

select * from
sales_by_employee;

-- question 6
-- Identify the top 5 customers who have made the most transactions, 
-- along with the count of transactions they have made and the total amount spent.
CREATE OR REPLACE VIEW top_buyers as
	SELECT 
		c.customer_id,
		c.customer_name,
		COUNT(t.trans_id) AS transaction_count,
		SUM(p.total_amount) AS total_amount_spent,
		dense_rank() over (order by COUNT(t.trans_id) desc)
	FROM customer c
	JOIN transaction t ON c.customer_id = t.customer_id
	JOIN payment p ON t.payment = p.payment_id
	GROUP BY c.customer_id, c.customer_name;
	
select * from top_buyers;



-- question 7
-- Find the average quantity of items sold per transaction for each payment method (cash, credit, debit) 
-- and for each item category.

SELECT 
    p.cash,
    p.credit,
    p.debit,
    i.category,
    AVG(si.quantity) AS avg_quantity_sold
FROM transaction t
JOIN sold_item si ON t.trans_id = si.trans_id
JOIN item i ON si.item_id = i.item_id
JOIN payment p ON t.payment = p.payment_id
GROUP BY p.cash, p.credit, p.debit, i.category
order by 4;

/*

#9 - Create a view to create rankings of times of the day (morning, afternoon, night) based on sales in order to have a better idea of when the store is busier. 
#10 -  together with its category, price, etc. 

*/

-- #8 - Update reward points on the customer table based on tot_payment after a new row is inserted in the transaction table. 
-- Creating Function 
CREATE OR REPLACE FUNCTION update_reward_points()
RETURNS TRIGGER AS $$
DECLARE
    total_payment NUMERIC;
BEGIN
    -- Get the total amount from the payment table
    SELECT total_amount INTO total_payment
    FROM payment
    WHERE payment_id = NEW.payment;

    -- $10 spent earns 1 reward point
    UPDATE customer
    SET reward_points = reward_points + total_payment / 10
    WHERE customer_id = NEW.customer_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- -- Creating Trigger to update customer reward points
CREATE TRIGGER trg_after_transaction_insert
AFTER INSERT ON transaction
FOR EACH ROW
EXECUTE FUNCTION update_reward_points();


-- #9  Create a view to create rankings of times of the day (morning, afternoon, evening)
-- based on sales in order to have a better idea of when the store is bussier.
CREATE OR REPLACE VIEW transactions_time_ranking AS
SELECT
    CASE
        WHEN EXTRACT(HOUR FROM trans_date) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM trans_date) >= 12 AND EXTRACT(HOUR FROM trans_date) < 16 THEN 'Afternoon'
        ELSE 'Evening'
    END AS day_times,
    COUNT(*) AS transaction_count,
    RANK() OVER (ORDER BY COUNT(*) DESC) as transaction_rank
FROM transaction
GROUP BY day_times
ORDER BY transaction_rank;


SELECT * FROM transactions_time_ranking


-- #10 Create a function that takes a month and year as argument and returns the id of the item that sold the most during that month.
CREATE OR REPLACE FUNCTION most_sold_item_id(month_input INT, year_input INT)
RETURNS NUMERIC AS
$$
DECLARE
    result_item_id NUMERIC;
BEGIN
    SELECT si.item_id INTO result_item_id
    FROM sold_item si
    JOIN transaction t ON si.trans_id = t.trans_id
    WHERE EXTRACT(MONTH FROM t.trans_date) = month_input AND EXTRACT(YEAR FROM t.trans_date) = year_input
    GROUP BY si.item_id
    ORDER BY COUNT(si.item_id) DESC
    LIMIT 1;

    RETURN result_item_id;
END;
$$ LANGUAGE plpgsql;



SELECT * FROM most_sold_item_id(8, 2023);




	












