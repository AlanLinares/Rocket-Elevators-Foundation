-- how many contact requests are made per month
SELECT date_trunc('Month', creation_date) as "Month",count(contact_id) as QuotePerMonth
FROM public.fact_contacts
GROUP BY "Month"
ORDER BY "Month" DESC;

-- how many elevators per customer do we have
SELECT customer_id, COUNT (*) 
FROM fact_elevators GROUP BY customer_id;


-- how many quote solicitations are made per month
SELECT date_trunc('Month', creation) as "Month",count(quote_id) as QuotePerMonth
FROM public.fact_quotes
GROUP BY "Month"
ORDER BY "Month" DESC;
