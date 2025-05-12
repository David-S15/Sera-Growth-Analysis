-- Query 1: How many transactions occurred?
SELECT COUNT(*) AS total_transactions
FROM sales;

-- Query 2: What is the percentage covered in the analysis? (Percentage distribution of status)
SELECT 
    status,
    COUNT(*) AS count,
    ROUND((COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ()), 2) AS perc_total
FROM sales
GROUP BY status;

-- Query 3: Show the transaction count by status along with percentage of total
SELECT 
    status,
    COUNT(*) AS count,
    ROUND((COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ()), 2) AS perc_total
FROM sales
GROUP BY status;

-- Query 4: Show the total transactions by channel split by the transaction status. Which channel has the highest rate of success?
SELECT 
    channel,
    COUNT(*) AS total_txn,
    COUNT(CASE WHEN status = 'successful' THEN 1 END) AS total_successful,
    COUNT(CASE WHEN status = 'abandoned' THEN 1 END) AS total_abandoned,
    COUNT(CASE WHEN status = 'failed' THEN 1 END) AS total_failed,
    ROUND((COUNT(CASE WHEN status = 'successful' THEN 1 END) * 100.0 / COUNT(*)), 2) AS success_rate
FROM sales
GROUP BY channel
ORDER BY success_rate DESC
LIMIT 1;

-- Query 5: How many subscribers are there in total? (A subscriber is a user with a successful payment)
SELECT COUNT(DISTINCT user_id) AS total_subscribers
FROM sales
WHERE status = 'successful';

-- Query 6: A user is active within a month if there is an attempt to subscribe. Generate a list of users showing their number of active attempts, total successful, total abandoned, total failed attempts
WITH user_activity AS (
    SELECT 
        user_id,
        DATE_TRUNC('month', datetime) AS month,
        COUNT(*) AS total_attempts,
        COUNT(CASE WHEN status = 'successful' THEN 1 END) AS total_successful,
        COUNT(CASE WHEN status = 'abandoned' THEN 1 END) AS total_abandoned,
        COUNT(CASE WHEN status = 'failed' THEN 1 END) AS total_failed
    FROM sales
    GROUP BY user_id, DATE_TRUNC('month', datetime)
)
SELECT 
    user_id,
    month,
    total_attempts,
    total_successful,
    total_abandoned,
    total_failed
FROM user_activity
ORDER BY month, user_id;

-- Query 7: Identify the users who are more than 1 active without a successful transaction
WITH user_activity AS (
    SELECT 
        user_id,
        DATE_TRUNC('month', datetime) AS month,
        COUNT(*) AS total_attempts,
        COUNT(CASE WHEN status = 'successful' THEN 1 END) AS total_successful,
        COUNT(CASE WHEN status = 'abandoned' THEN 1 END) AS total_abandoned,
        COUNT(CASE WHEN status = 'failed' THEN 1 END) AS total_failed
    FROM sales
    GROUP BY user_id, DATE_TRUNC('month', datetime)
)
SELECT 
    user_id,
    month,
    total_attempts,
    total_successful,
    total_abandoned,
    total_failed
FROM user_activity
WHERE total_attempts > 1 AND total_successful = 0
ORDER BY month, user_id;

-- Query 8: Identify the users with more than 1 active month without a successful transaction
WITH user_month_activity AS (
    SELECT 
        user_id,
        DATE_TRUNC('month', datetime) AS month,
        COUNT(*) AS total_attempts,
        COUNT(CASE WHEN status = 'successful' THEN 1 END) AS total_successful
    FROM sales
    GROUP BY user_id, DATE_TRUNC('month', datetime)
),
user_summary AS (
    SELECT 
        user_id,
        COUNT(*) AS active_months,
        SUM(total_successful) AS total_successful
    FROM user_month_activity
    GROUP BY user_id
    HAVING COUNT(*) > 1 AND SUM(total_successful) = 0
)
SELECT 
    us.user_id,
    uma.month,
    uma.total_attempts,
    uma.total_successful
FROM user_summary us
JOIN user_month_activity uma ON us.user_id = uma.user_id
ORDER BY us.user_id, uma.month;