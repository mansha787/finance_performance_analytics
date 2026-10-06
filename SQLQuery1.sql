select *
from bank_loan_data 


-- application

select count(id) as Total_Loan_Application
from bank_loan_data

select count(id) as MTD_Total_Loan_Application
from bank_loan_data
where month(issue_date)=12 and year(issue_date)=2021

select count(id) as PMTD_Total_Loan_Application
from bank_loan_data
where month(issue_date)=11 and year(issue_date)=2021


-- funded

SELECT SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
AND YEAR(issue_date) = 2021;

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount
FROM bank_loan_data
WHERE MONTH(issue_date) = 11
AND YEAR(issue_date) = 2021;


--recived

SELECT SUM(total_payment) AS Total_Amount_received
FROM bank_loan_data

SELECT SUM(total_payment) AS MTD_Total_Amount_received
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
AND YEAR(issue_date) = 2021;

SELECT SUM(total_payment) AS PMTD_Total_Amount_received
FROM bank_loan_data
WHERE MONTH(issue_date) = 11
AND YEAR(issue_date) = 2021;


--rate

SELECT ROUND(AVG(int_rate), 4) * 100 AS Avg_Interest_Rate
FROM bank_loan_data

SELECT ROUND(AVG(int_rate), 4) * 100 AS MTD_Avg_Interest_Rate
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
AND YEAR(issue_date) = 2021;


SELECT ROUND(AVG(int_rate), 4) * 100 AS PMTD_Avg_Interest_Rate
FROM bank_loan_data
WHERE MONTH(issue_date) = 11
AND YEAR(issue_date) = 2021;


--DTI

SELECT ROUND(AVG(dti), 4) * 100 AS Avg_DTI
FROM bank_loan_data

SELECT ROUND(AVG(dti), 4) * 100 AS MTD_Avg_DTI
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
AND YEAR(issue_date) = 2021;

SELECT ROUND(AVG(dti), 4) * 100 AS PMTD_Avg_DTI
FROM bank_loan_data
WHERE MONTH(issue_date) = 11
AND YEAR(issue_date) = 2021;


--
--
--
-- good

SELECT
    (COUNT(CASE 
        WHEN loan_status = 'Fully Paid' 
        OR loan_status = 'Current' 
        THEN id 
    END) * 100)
    /
    COUNT(id) AS Good_loan_percentage
FROM bank_loan_data;

--

SELECT COUNT(id) AS Good_Loan_Applications
FROM bank_loan_data
WHERE loan_status = 'Fully Paid'
OR loan_status = 'Current';

--

SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount
FROM bank_loan_data
WHERE loan_status = 'Fully Paid'
OR loan_status = 'Current';

--

SELECT SUM(total_payment) AS Good_Loan_Recieved_amount
FROM bank_loan_data
WHERE loan_status = 'Fully Paid'
OR loan_status = 'Current';


--
--
--
--bad

SELECT
    (COUNT(CASE 
        WHEN loan_status = 'Charged Off' 
        THEN id 
    END) * 100.0) /
    COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data;


--
SELECT COUNT(id) AS Bad_Loan_Applications
FROM bank_loan_data
WHERE loan_status = 'Charged Off';

--
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount
FROM bank_loan_data
WHERE loan_status = 'Charged Off';

--
SELECT SUM(total_payment) AS Bad_Loan_Amount_Recieved
FROM bank_loan_data
WHERE loan_status = 'Charged Off';

--
--
--
--dashboard 2

--loan status
	SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status

--

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status


--month

SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)



--state
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state


--term
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term


--EMPLOYEE LENGTH
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length


--PURPOSE
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose



--HOME OWNERSHIP
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership


--
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose








