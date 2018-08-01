/* Warby Parker */

 SELECT *
 FROM survey
 LIMIT 10;
 
 SELECT question,
   COUNT(DISTINCT user_id) AS '# of respondents'
 FROM survey
 GROUP BY 1;
 
 SELECT *
 FROM quiz
 LIMIT 5;
 
 SELECT *
 FROM home_try_on
 LIMIT 5;
 
 SELECT *
 FROM purchase
 LIMIT 5;
 
 SELECT DISTINCT q.user_id,
   h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
   p.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz AS 'q'
 LEFT JOIN home_try_on AS 'h'
   ON q.user_id = h.user_id
 LEFT JOIN purchase AS 'p'
   ON q.user_id = p.user_id
 LIMIT 10;
 
 WITH funnel as (
 SELECT DISTINCT q.user_id,
   h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
   p.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz AS 'q'
 LEFT JOIN home_try_on AS 'h'
   ON q.user_id = h.user_id
 LEFT JOIN purchase AS 'p'
   ON q.user_id = p.user_id)
 SELECT COUNT(*) AS 'num_quizzed',
   SUM(is_home_try_on) AS 'num_tried',
   SUM(is_purchase) AS 'num_purchased',
   1.0*SUM(is_purchase)/COUNT(user_id) AS 'conversion_rate',
   1.0*SUM(is_home_try_on)/COUNT(user_id) AS 'quiz_to_tried',
   1.0*SUM(is_purchase)/SUM(is_home_try_on) AS 'tried_to_purchase'
 FROM funnel;
 
 WITH funnel as (
 SELECT DISTINCT q.user_id,
   h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
   p.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz AS 'q'
 LEFT JOIN home_try_on AS 'h'
   ON q.user_id = h.user_id
 LEFT JOIN purchase AS 'p'
   ON q.user_id = p.user_id)
 SELECT number_of_pairs,
   SUM(is_home_try_on) AS 'num_tried',
   SUM(is_purchase) AS 'num_purchased',
   ROUND(1.0*SUM(is_purchase)/SUM(is_home_try_on),2) AS 'tried_to_purchase'
 FROM funnel
 WHERE number_of_pairs IS NOT NULL
 GROUP BY number_of_pairs;
 
 SELECT DISTINCT style,
   COUNT(*)
 FROM quiz
 GROUP BY style
 ORDER BY COUNT(*) DESC
 LIMIT 3;
 
 SELECT DISTINCT fit,
   COUNT(*)
 FROM quiz
 GROUP BY fit
 ORDER BY COUNT(*) DESC
 LIMIT 3;
 
 SELECT DISTINCT shape,
   COUNT(*)
 FROM quiz
 GROUP BY shape
 ORDER BY COUNT (*) DESC
 LIMIT 3;
 
 SELECT DISTINCT color,
   COUNT(*)
 FROM quiz
 GROUP BY color
 ORDER BY COUNT(*) DESC
 LIMIT 3;
 
 SELECT DISTINCT product_id,
   COUNT(*)
 FROM purchase
 GROUP BY product_id
 ORDER BY COUNT(*) DESC
 LIMIT 3;
 
 SELECT DISTINCT style,
   COUNT(*)
 FROM purchase
 GROUP BY style
 ORDER BY COUNT(*) DESC
 LIMIT 3;
 
 SELECT DISTINCT fit,
   COUNT(*)
 FROM purchase
 GROUP BY fit
 ORDER BY COUNT(*) DESC
 LIMIT 3;
 
 SELECT DISTINCT model_name,
   COUNT(*)
 FROM purchase
 GROUP BY model_name
 ORDER BY COUNT(*) DESC
 LIMIT 3;
   
 SELECT DISTINCT color,
   COUNT(*)
 FROM purchase
 GROUP BY color
 ORDER BY COUNT(*) DESC
 LIMIT 3;
 
 SELECT DISTINCT price,
   COUNT(*)
 FROM purchase
 GROUP BY price
 ORDER BY COUNT(*) DESC
 LIMIT 3;   