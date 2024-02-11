CREATE TABLE payment(
	payment_id NUMERIC(5,0) PRIMARY KEY,
	total_amount NUMERIC(10,2),
	cash BOOL,
	credit BOOL,
	debit BOOL
	
);
CREATE TABLE stock(
    item_id NUMERIC(5,0) PRIMARY KEY,
    stock_date_time TIMESTAMP,
    quantity INT

);

CREATE TABLE item (
    barcode NUMERIC(12,0) PRIMARY KEY,
    item_id NUMERIC(5,0),
    item_name VARCHAR(30),
    exp_date DATE,
    category VARCHAR(20),
    brand VARCHAR(20),
    FOREIGN KEY (item_id) REFERENCES stock(item_id)

);


CREATE TABLE employee (
    employee_id NUMERIC(3,0) PRIMARY KEY,
    full_name VARCHAR(25),
    phone NUMERIC(10,0),
    email VARCHAR(30),
    SSN NUMERIC(9,0),
    start_date_id DATE,
    salary_hour NUMERIC(8,2),
    employment_type VARCHAR(10),
    pos VARCHAR(15)
	
);

CREATE TABLE customer(
    customer_id NUMERIC(8,0) PRIMARY KEY,
    customer_name VARCHAR(30),
    date_of_birth DATE,
    pet_id NUMERIC(8,0),
    phone NUMERIC(10,0),
    email VARCHAR(30),
    reward_points NUMERIC(5,0)
);

CREATE TABLE pet (
    pet_id NUMERIC(8,0) PRIMARY KEY,
    owner_id NUMERIC(8,0),
    category VARCHAR(20),
    breed VARCHAR(15),
    pet_name VARCHAR(15),
    FOREIGN KEY (owner_id) REFERENCES customer(customer_id)
);

CREATE TABLE recommendation (
    rcmd_id NUMERIC(8,0) PRIMARY KEY,
    item_id NUMERIC(5,0),
    customer_id NUMERIC(8,0),
    FOREIGN KEY (item_id) REFERENCES stock(item_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE transaction (
    trans_id NUMERIC(5,0) PRIMARY KEY, 
	payment NUMERIC(5,0),
    customer_id NUMERIC(8,0),
    cashier_id NUMERIC(3,0),
    trans_date TIMESTAMP,  
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (cashier_id) REFERENCES employee(employee_id),
	FOREIGN KEY (payment) REFERENCES payment(payment_id)
);

CREATE TABLE sold_item (
    sales_item_id NUMERIC(5,0) PRIMARY KEY, 
    trans_id NUMERIC(5,0),
    item_id NUMERIC(5,0),
    quantity INT,
    price INT,
    FOREIGN KEY (trans_id) REFERENCES transaction(trans_id),
    FOREIGN KEY (item_id) REFERENCES stock(item_id)    
);

