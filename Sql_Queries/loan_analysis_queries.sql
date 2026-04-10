=================================================================
--Project 1: Decoding Credit Risk: A Data-Driven Lending Analysis
--Analyst:	 Josephine Hart
--Date:		 April 2026
==================================================================

--Query 1	Total_records & gender_split
select sex,
count(*)As total_applicants,
round(count(*)* 100/sum(count(*)) over(),2) As percentage
From german_credit_data
group by sex;

--Query 2	Average Credit-amount by purpose
select purpose,
count(*)As total_loans,
round(avg(credit_amount),2)As avg_credit_amount,
round(avg(duration),2)As avg_duration_months
from german_credit_data
group by purpose
order by avg_credit_amount DESC;

--Query 3	Housing type vs credit_amount
select housing,
count(*)As total_applicants,
round(avg(credit_amount),2) As avg_credit_amount
from german_credit_data
group by housing
order by avg_credit_amount DESC;

--Query 4	Top 10 Highes risk combinations (purpose vs housing)
select purpose, housing,
count(*)As total_loans,
round(avg(credit_amount),2)As avg_credit_amount
from german_credit_data
group by purpose, housing
order by avg_credit_amount DESC
limit 10;

--Query 5	Total vs Average_credit_amount by Purpose
select purpose,
count(*)As total_loans,
round(avg(credit_amount),2) as avg_credit_amount,
sum(credit_amount)As total_credit_amount
from german_credit_data
group by purpose
order by total_credit_amount desc;
