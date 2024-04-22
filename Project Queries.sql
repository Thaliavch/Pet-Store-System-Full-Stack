-- Question 1
select * from stock
						  
--Question 2:
select breed, count(*), dense_rank() over (order by count(*) desc) as rank
from pet
where species = 'Cat'
group by breed
order by rank;

-- #3  Create a view to create rankings of times of the day (morning, afternoon, evening)
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


-- #4 Create a function that takes a month and year as argument and returns the id of the item that sold the most during that month.
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


-- Query 5 - Function to Get Employee Information by Name
CREATE OR REPLACE FUNCTION get_employee_info(employee_full_name VARCHAR)
RETURNS TABLE(employee_id NUMERIC, full_name VARCHAR, phone NUMERIC, email VARCHAR, SSN NUMERIC, start_date DATE, salary_hour NUMERIC, "position" VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT employee_id, full_name, phone, email, SSN, start_date_id, salary_hour, position
    FROM employee
    WHERE full_name = employee_full_name;
END;
$$ LANGUAGE plpgsql;


-- Query 6- List off employees' information
SELECT * FROM employee;

-- Query 7: Employee with Most Sales in a Given Month and Year
CREATE OR REPLACE FUNCTION get_employee_info(employee_full_name VARCHAR)
RETURNS TABLE(employee_id NUMERIC, full_name VARCHAR, phone NUMERIC, email VARCHAR, SSN NUMERIC, start_date DATE, salary_hour NUMERIC, "position" VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT employee_id, full_name, phone, email, SSN, start_date_id, salary_hour, position
    FROM employee
    WHERE full_name = employee_full_name;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION top_selling_employee(month INTEGER, year INTEGER)
RETURNS TABLE(employee_id NUMERIC, full_name VARCHAR, total_sales NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT e.employee_id, e.full_name, COUNT(s.trans_id) AS total_sales
    FROM employee e
    JOIN transaction t ON e.employee_id = t.cashier_id
    WHERE EXTRACT(MONTH FROM t.trans_date) = month AND EXTRACT(YEAR FROM t.trans_date) = year
    GROUP BY e.employee_id, e.full_name
    ORDER BY total_sales DESC
    LIMIT 1;
END;
$$ LANGUAGE plpgsql;

-- Query 8: Most Valuable Customer Based on Rewards Points
SELECT customer_id, customer_name, reward_points
FROM customer
ORDER BY reward_points DESC
LIMIT 1;

-- Query 9: List All Customers and Their Information
SELECT * FROM customer;

-- Query 10: This function checks if a user with the given username and password exists in the database and returns true if so, otherwise false.
CREATE OR REPLACE FUNCTION login(username VARCHAR, password VARCHAR)
RETURNS BOOLEAN AS $$
DECLARE
    user_found BOOLEAN;
BEGIN
    SELECT EXISTS(SELECT 1 FROM admin WHERE username = username AND password = password) INTO user_found;
    RETURN user_found;
END;
$$ LANGUAGE plpgsql;
	












