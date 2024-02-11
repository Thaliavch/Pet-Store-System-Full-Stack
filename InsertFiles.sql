-- Populating Stock Table
INSERT INTO stock (item_id, stock_date_time, quantity) VALUES
(1, CURRENT_TIMESTAMP, 100),
(2, CURRENT_TIMESTAMP, 150),
(3, CURRENT_TIMESTAMP, 200),
(4, CURRENT_TIMESTAMP, 180),
(5, CURRENT_TIMESTAMP, 120),
(6, CURRENT_TIMESTAMP, 90),
(7, CURRENT_TIMESTAMP, 130),
(8, CURRENT_TIMESTAMP, 170),
(9, CURRENT_TIMESTAMP, 110),
(10, CURRENT_TIMESTAMP, 160),
(11, CURRENT_TIMESTAMP, 140),
(12, CURRENT_TIMESTAMP, 190),
(13, CURRENT_TIMESTAMP, 180),
(14, CURRENT_TIMESTAMP, 150),
(15, CURRENT_TIMESTAMP, 120),
(16, CURRENT_TIMESTAMP, 110),
(17, CURRENT_TIMESTAMP, 170),
(18, CURRENT_TIMESTAMP, 140),
(19, CURRENT_TIMESTAMP, 130),
(20, CURRENT_TIMESTAMP, 160),
(21, CURRENT_TIMESTAMP, 100),
(22, CURRENT_TIMESTAMP, 150),
(23, CURRENT_TIMESTAMP, 200),
(24, CURRENT_TIMESTAMP, 180),
(25, CURRENT_TIMESTAMP, 120),
(26, CURRENT_TIMESTAMP, 90),
(27, CURRENT_TIMESTAMP, 130),
(28, CURRENT_TIMESTAMP, 170),
(29, CURRENT_TIMESTAMP, 110),
(30, CURRENT_TIMESTAMP, 160),
(31, CURRENT_TIMESTAMP, 140),
(32, CURRENT_TIMESTAMP, 190),
(33, CURRENT_TIMESTAMP, 180),
(34, CURRENT_TIMESTAMP, 150),
(35, CURRENT_TIMESTAMP, 120),
(36, CURRENT_TIMESTAMP, 110),
(37, CURRENT_TIMESTAMP, 170),
(38, CURRENT_TIMESTAMP, 140),
(39, CURRENT_TIMESTAMP, 130),
(40, CURRENT_TIMESTAMP, 160);


-- Treats category
INSERT INTO item (barcode, item_id, item_name, exp_date, category, brand) VALUES
(023456789010, 1, 'Greenies Biscuits', NULL, 'Treats', 'Greenies'),
(034567890122, 2, 'Greenies Dental Treats', NULL, 'Treats', 'Greenies'),
(045678901233, 3, 'Milk-Bone Treat Sticks', NULL, 'Treats', 'Milk-Bone'),
(056789012344, 4, 'Milk-Bone Jerky', NULL, 'Treats', 'Milk-Bone'),
(067890123455, 5, 'Beggin'' Strips Biscuits', NULL, 'Treats', 'Beggin'' Strips'),
(078901234566, 6, 'Beggin'' Strips Dental Treats', NULL, 'Treats', 'Beggin'' Strips'),
(089012345677, 7, 'Whiskas Chews', NULL, 'Treats', 'Whiskas'),
(090123456788, 8, 'Whiskas Treat Sticks', NULL, 'Treats', 'Whiskas'),
(001234567899, 9, 'Kong Jerky', NULL, 'Treats', 'Kong'),
(023456789011, 10, 'Kong Biscuits', NULL, 'Treats', 'Kong');

-- Supplies category
INSERT INTO item (barcode, item_id, item_name, exp_date, category, brand) VALUES
(134567890122, 11, 'Kong Pet Carrier', NULL, 'Supplies', 'Kong'),
(145678901233, 12, 'Kong Training Pad', NULL, 'Supplies', 'Kong'),
(156789012344, 13, 'PetSafe Grooming Kit', NULL, 'Supplies', 'PetSafe'),
(167890123456, 14, 'PetSafe Leash', NULL, 'Supplies', 'PetSafe'),
(178901234567, 15, 'Trixie Collar', NULL, 'Supplies', 'Trixie'),
(189012345678, 16, 'Trixie Pet Carrier', NULL, 'Supplies', 'Trixie'),
(190123456789, 17, 'Furminator Grooming Kit', NULL, 'Supplies', 'Furminator'),
(101234567890, 18, 'Furminator Training Pad', NULL, 'Supplies', 'Furminator'),
(123456789012, 19, 'Outward Hound Leash', NULL, 'Supplies', 'Outward Hound'),
(134567890123, 20, 'Outward Hound Pet Carrier', NULL, 'Supplies', 'Outward Hound');

-- Health category
INSERT INTO item (barcode, item_id, item_name, exp_date, category, brand) VALUES
(245678901234, 21, 'Bayer Wormer', '2024-06-15', 'Health', 'Bayer'),
(256789012345, 22, 'Bayer Vitamin', '2023-09-20', 'Health', 'Bayer'),
(267890123456, 23, 'Zoetis Flea & Tick Treatment', '2024-03-10', 'Health', 'Zoetis'),
(278901234567, 24, 'Zoetis Joint Supplement', '2023-11-30', 'Health', 'Zoetis'),
(289012345678, 25, 'Merial Vitamin', '2024-05-25', 'Health', 'Merial'),
(290123456789, 26, 'Merial Antibiotic', '2023-12-05', 'Health', 'Merial'),
(201234567890, 27, 'Elanco Flea & Tick Treatment', '2024-04-18', 'Health', 'Elanco'),
(223456789012, 28, 'Elanco Wormer', '2023-10-15', 'Health', 'Elanco'),
(234567890123, 29, 'Virbac Vitamin', '2024-02-28', 'Health', 'Virbac'),
(245678901233, 30, 'Virbac Joint Supplement', '2023-08-10', 'Health', 'Virbac');

-- Food category
INSERT INTO item (barcode, item_id, item_name, exp_date, category, brand) VALUES
(356789012345, 31, 'Purina Dry Food', '2023-07-20', 'Food', 'Purina'),
(367890123456, 32, 'Purina Treats', '2023-10-15', 'Food', 'Purina'),
(378901234567, 33, 'Royal Canin Diet Meal', '2023-08-30', 'Food', 'Royal Canin'),
(389012345678, 34, 'Royal Canin Wet Food', '2023-09-25', 'Food', 'Royal Canin'),
(390123456789, 35, 'Hill''s Science Diet Wet Food', '2023-11-10', 'Food', 'Hill''s Science Diet'),
(301234567890, 36, 'Hill''s Science Diet Supplement', '2023-12-05', 'Food', 'Hill''s Science Diet'),
(323456789012, 37, 'Blue Buffalo Dry Food', '2023-10-28', 'Food', 'Blue Buffalo'),
(334567890123, 38, 'Blue Buffalo Treats', '2023-09-15', 'Food', 'Blue Buffalo'),
(345678901234, 39, 'Iams Supplement', '2024-01-20', 'Food', 'Iams'),
(356789012344, 40, 'Iams Wet Food', '2023-11-30', 'Food', 'Iams');

