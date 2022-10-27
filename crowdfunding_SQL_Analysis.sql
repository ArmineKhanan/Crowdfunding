-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT 	cf_id, 
		backers_count  as backer_counts
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count desc;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT 	cf_id, 
		count(backer_id) backers_count
FROM backers
GROUP BY cf_id;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

--DROP TABLE "contact_name_remaining_goal_amount";
SELECT 	contacts.first_name,
		contacts.last_name, 
		contacts.email, 
		--campaign.goal, 
		--campaign.pledged , 
		(CAST(campaign.goal as double PRECISION) - CAST(campaign.pledged as double PRECISION)) as left_of_goal
INTO "contact_name_remaining_goal_amount"
FROM campaign
LEFT JOIN contacts on campaign.contact_id = contacts.contact_id
WHERE outcome = 'live'
ORDER BY left_of_goal DESC;

-- Check the table
SELECT * FROM "contact_name_remaining_goal_amount"

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

-- DROP TABLE "email_backers_remaining_goal_amount";
SELECT 	email as "Email Address",
		first_name as "First name",
		last_name as "Last name",
		b.cf_id as "CF ID", 
		c.company_name "Company name", 
		c.description "Description", 
		c.end_date "End Date",
		(CAST(c.goal as double PRECISION) - CAST(c.pledged as double PRECISION)) as "Left of Goal"
INTO "email_backers_remaining_goal_amount"
FROM backers b
LEFT JOIN campaign c on b.cf_id = c.cf_id
ORDER BY last_name ASC;

-- Check the table
SELECT * FROM "email_backers_remaining_goal_amount";
