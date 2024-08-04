 USE project1;

 -- שאילתום  של כל אירוע והמחיר הכולל של כל המנות הכשרות בכל אירוע

SELECT catering_event.event_ID, SUM(dish.price) AS total_kosher_sales
FROM catering_event
JOIN dish_in_event ON catering_event.event_ID = dish_in_event.event_ID
JOIN dish ON dish_in_event.dish_ID = dish.dish_ID
WHERE dish.kosher = 'parve'
GROUP BY catering_event.event_ID;


-- סכום התשלומים הסופיים ששולמו לספקים

SELECT supplier.supplier_name, SUM(supplier_order.order_price) AS total_final_payment
FROM supplier
JOIN supplier_order ON supplier.supplier_ID = supplier_order.supplier_ID
GROUP BY supplier.supplier_name;


-- שאילתה של שפים בסדר יורד לפי כמות האירועים שבהם השתתפו

SELECT chef.first_name, chef.last_name, COUNT(chef_in_event.event_ID) AS num_of_events
FROM chef
LEFT JOIN chef_in_event ON chef.chef_ID = chef_in_event.chef_ID
GROUP BY chef.chef_ID
ORDER BY num_of_events DESC;


-- שאילתה למחיקת לקוח שלא ביצע הזמנה מתאריך מסויים

ALTER TABLE customer
ADD COLUMN IsActive BOOLEAN NOT NULL DEFAULT TRUE;
UPDATE customer
SET IsActive = FALSE
WHERE customer_ID NOT IN (
    SELECT DISTINCT customer_ID
    FROM catering_event
    WHERE event_date >= '2024-01-01'
);


    -- מצא את המנה הפופולרית ביותר לכל קטגוריה בהתבסס על מספר האירועים שהיא מופיעה בהם

SELECT d.category, d.dish_name, COUNT(distinct de.event_ID) AS event_count
FROM dish d
JOIN dish_in_event de ON d.dish_ID = de.dish_ID
GROUP BY d.category, d.dish_name
ORDER BY d.category, event_count DESC;

-- חשב את סך ההכנסות שנוצרו מאירועים, מקובצים לפי חודש והעדפות כשרות
SELECT YEAR(ce.event_date) AS year, MONTH(ce.event_date) AS month, ce.kosher, SUM(ce.finale_payment) AS total_revenue
FROM catering_event ce
GROUP BY YEAR(ce.event_date), MONTH(ce.event_date), ce.kosher
ORDER BY year, month, ce.kosher;

-- רשום ספקים עם הזמנות מושהות ומספר העיכובים
SELECT s.supplier_name, COUNT(*) AS delay_count
FROM supplier s
JOIN supplier_order so ON s.supplier_ID = so.supplier_ID
WHERE so.delay = 'Yes'
GROUP BY s.supplier_name
HAVING delay_count > 0
ORDER BY delay_count DESC;

-- הנחת 10% עבור אירועים יותר מ100 אנשים
UPDATE catering_event
SET finale_payment = finale_payment * 0.9  -- Applying a 10% discount
WHERE num_of_guests > 100;

-- יצירת תשלום סופי עבור אירוע
DROP PROCEDURE IF EXISTS calculate_finale_payment;
DELIMITER $$
CREATE PROCEDURE calculate_finale_payment(IN event_id_param INT)
BEGIN
    DECLARE total_payment INT DEFAULT 0;
    DECLARE guests INT;
    -- Get the number of guests for the event
    SELECT num_of_guests INTO guests
    FROM catering_event
    WHERE event_ID = event_id_param;
    -- Calculate total payment for the event
    SELECT COALESCE(SUM(die.amount * d.price), 0) + (COALESCE(guests, 0) * 10) INTO total_payment
    FROM dish_in_event die
    LEFT JOIN dish d ON die.dish_ID = d.dish_ID
    WHERE die.event_ID = event_id_param;
    -- Update finale_payment in catering_event
    UPDATE catering_event
    SET finale_payment = total_payment
    WHERE event_ID = event_id_param;
END$$
DELIMITER ;
CALL calculate_finale_payment(2);

use project1;

/*1*/

/*כמות המנות שכל טבח יודע להכין */

select c.first_name, c.last_name, count(*)  AS num_of_dishes
from chef_cook_dish cook , chef c
where cook.chef_id = c.chef_id
group by cook.chef_id
order by  count(*) DESC;

/* המלצר ברמה 1 שנמצא הכי ה רבה זמן   */

	SELECT w.waiter_ID, w.first_name, w.last_name, w.seniority_months
	FROM waiter w
	JOIN employee e ON w.waiter_ID = e.employee_ID
	WHERE w.waiter_rank = 1
	ORDER BY w.seniority_months DESC
	LIMIT 1;


/* מס כולל של סועדים בכל ההזמנות יחד ללקוח */
SELECT c.customer_ID, c.first_name, c.last_name, sum(ce.num_of_guests)  AS total_num_of_guest
from customer c , catering_event ce
where c.customer_ID = ce.customer_ID
group by ce.customer_ID
order by sum(ce.num_of_guests) DESC;

/* המחיר ועלות של כל מנה לפי סועד*/
SELECT d.dish_ID,d.dish_name,d.kosher,ROUND(d.price / die.amount, 2) AS price_per_guest,ROUND(d.cost / die.amount, 2) AS cost_per_guest
FROM dish d
JOIN dish_in_event die ON d.dish_ID = die.dish_ID
ORDER BY price_per_guest ASC;


/* מנה שיש פחות מ-2 שפים שיודעים להכין אותה */
SELECT d.dish_ID, d.dish_name, c.first_name AS chef_first_name, c.last_name AS chef_last_name
FROM dish d LEFT JOIN ( SELECT ccd.dish_ID, c.first_name, c.last_name
                        FROM chef_cook_dish ccd JOIN chef c 
                        ON ccd.chef_ID = c.chef_ID) c 
ON d.dish_ID = c.dish_ID
WHERE d.dish_ID not in (SELECT dish_ID
				        FROM chef_cook_dish
						GROUP BY dish_ID
                        HAVING COUNT(chef_ID) > 1);
                        
                        
