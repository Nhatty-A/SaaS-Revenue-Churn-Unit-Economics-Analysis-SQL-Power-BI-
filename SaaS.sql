select COUNT(*) 
from subscriptions


---delete 
----select *
---from subscriptions
---where customer_id is not null
-----------------------------------------------------------------------------------------
select distinct churned
from subscriptions;
-----------------------------------------------------------------------------------------
-----------------------------1. CHURN-----------------------------------------------------
----------------------overall churn rate--------------------------------------------------
select 
	count(*) as total_customers,
	sum(case when churned = 'Yes' then 1 else 0 end) as total_churn,
	Round(
		sum(case when churned = 'Yes' then 1 else 0 end)*100.0/count(*),1) as chrned_rate
from subscriptions
-----------------------------------------------------------------------------------------

-----------------------churn by plan------------------------------------------------------
select 
		[plan],
		COUNT(*) as total_customers,
		SUM(case when churned = 'Yes' then 1 else 0 end) as total_churn,
		ROUND(
		SUM(case when churned='Yes' then 1 else 0 end)*100/COUNT(*),2
		) as churned_rate_pct
from subscriptions
group by [plan]
order by churned_rate_pct desc;
-------------------------------------------------------------------------------------------

------------------churn by billing cycle---------------------------------------------------
select
	billing_cycle,
	COUNT(*) as total_customers,
	SUM(case when churned ='Yes' then 1 else 0 end) as total_churn,
	ROUND(
		SUM(case when churned = 'Yes' then 1 else 0 end)*100/COUNT(*),2
		) as churned_rate_pct
from subscriptions
group by billing_cycle
order by churned_rate_pct desc;
------------------------------------------------------------------------------------------

---------------churn by company size------------------------------------------------------
select 
	company_size,
	COUNT(*) as total_customers,
	SUM(case when churned ='Yes' then 1 else 0 end) as total_churn,
	ROUND(
		SUM(case when churned = 'Yes' then 1 else 0 end)*100/COUNT(*),2
		) as churned_rate_pct
from subscriptions
group by company_size
order by churned_rate_pct desc;
-----------------------------------------------------------------------------------------

--------------------churn monthly trend--------------------------------------------------
select
	[month],
	monthly_churn_rate_pct as month_churn_rate
from monthly_revenue
order by [month]
------------------------------------------------------------------------------------------


-----------------Acquisition channel------------------------------------------------------
select acquisition_channel,
		COUNT(*)as total_customers,
		SUM(case when churned ='Yes' then 1 else 0 end) as total_churn,
		ROUND(
			SUM(case when churned='Yes' then 1 else 0 end)* 100/COUNT(*),1
			) as churn_rate_pct
from subscriptions
group by acquisition_channel
order by churn_rate_pct;
------------------------------------------------------------------------------------------

-------------------------2. Why cutomer leave--------------------------------------------
------------------------top churn reasons-----------------------------------------------
select
	churn_reason,
	COUNT(*) as churn_count
from subscriptions
where churned = 'Yes'
group by churn_reason
order by churn_count desc;
--------------------------------------------------------------------------------------------
select
	[plan],
	churn_reason,
	COUNT(*) as churn_count
from subscriptions
where churned = 'Yes'
group by [plan], churn_reason
order by [plan],churn_count desc;
-----------------------------------------------------------------------------------------------
-------------------------churn_reason by company size-----------------------------------------
select
	company_size,
	churn_reason,
	COUNT(*) as churn_count
from subscriptions
group by company_size,churn_reason 
order by company_size,churn_reason desc;

---------------------3. Unit Economics---------------------------------------------------------
---------------------Average revenue per plan--------------------------------------------------
select
	[plan],
	COUNT(*) as total_customers,
	AVG(monthly_revenue) as avg_rev
from subscriptions
group by [plan]
order by avg_rev desc;
-----------------------------------------------------------------------------------------------
---------------------4. Customer Life time value-------------------------------------------------
select
	[plan],
	COUNT(*) as total_customers,
	AVG(monthly_revenue)as avg_mrr,

	--churn rate
	avg(case when LTRIM(RTRIM(LOWER(churned))) = 'Yes' then 1.0 else 0.0 end) as churn_rate,

	---estimated lifetime
	1.0/(nullif(AVG(case when LTRIM(RTRIM(LOWER(churned)))='Yes' then 1.0 else 0.0 end),2)) as est_lifetime_months,

	----CLV
	AVG(monthly_revenue)* (1.0/nullif(AVG(case when LTRIM(RTRIM(LOWER(churned))) = 'Yes' then 1.0 else 0.0 end),2))as est_CLV

from subscriptions
group by [plan]
order by est_lifetime_months desc;
-------------------------------------------------------------------------------------------------------------------------------
--------------------------------Net Revenue Retention(NRR)--------------------------------------------------------------------
select [month],
		total_mrr,
		new_customers,
		churned_customers,
		(new_customers - churned_customers) as net_customers_change
from monthly_revenue
order by [month];


---------------------------5. Custoner Acquision cost-----------------------------------------------------------------------------
select
	AVG(customer_acquisition_cost) as avg_CAC
from monthly_revenue
--------------------------------------------------------------------------------------------------------------------------------


