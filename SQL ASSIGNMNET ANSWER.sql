DROP TABLE IF EXISTS Hospitals;

CREATE TABLE Hospitals(
hospital_name VARCHAR(50)NOT NULL,
location VARCHAR(50)NOT NULL,
department VARCHAR (50)NOT NULL,
doctors_count INT,
patients_count INT,
Admission_date DATE,
Discharge_date DATE,
Medical_expenses DECIMAL(10,2)
);



SELECT * FROM Hospitals;


--1. Total Number of Patients 
--o Write an SQL query to find the total number of patients across all hospitals.
   
    SELECT SUM (Patients_count)
    FROM Hospitals;


--2. Average Number of Doctors per Hospital 
--o Retrieve the average count of doctors available in each hospital.

   SELECT hospital_name, AVG(doctors_count)AS avg_doctors
   FROM Hospitals
   GROUP BY hospital_name;
    



--3. Top 3 Departments with the Highest Number of Patients 
--o Find the top 3 hospital departments that have the highest number of patients. 
    SELECT department, SUM(Patients_count)
    FROM Hospitals
	GROUP BY department 
	ORDER BY SUM (Patients_count) DESC LIMIT 3;





--4. Hospital with the Maximum Medical Expenses 
--o Identify the hospital that recorded the highest medical expenses.

   SELECT hospital_name, SUM(medical_expenses)
   FROM Hospitals
   GROUP BY hospital_name
   ORDER by SUM(medical_expenses) DESC LIMIT 1;
   




--5. Daily Average Medical Expenses 
--o Calculate the average medical expenses per day for each hospital. 
 
 SELECT hospital_name, admission_date,
AVG(medical_expenses) AS daily_avg
FROM hospitals
GROUP BY hospital_name, admission_date
ORDER BY hospital_name, admission_date;
	






--6. Longest Hospital Stay 
--o Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date. 

	SELECT hospital_name,
	admission_date,
	discharge_date,
	(discharge_date - admission_date)AS longest_stay
	FROM Hospitals
	ORDER BY longest_stay DESC LIMIT 1;




--7. Total Patients Treated Per City 
--o Count the total number of patients treated in each city.

   SELECT location, SUM(Patients_count)
   FROM Hospitals
   GROUP BY location 
   ORDER BY SUM(Patients_count);
   




--8. Average Length of Stay Per Department 
--o Calculate the average number of days patients spend in each department. 

   SELECT hospital_name, department,
   AVG (discharge_date-admission_date) AS avg_stay
   FROM Hospitals
   GROUP BY hospital_name, department
   ORDER BY avg_stay;  




--9. Identify the Department with the Lowest Number of Patients 
--o Find the department with the least number of patients. 

    SELECT department, COUNT(*) AS Patients_count
	FROM Hospitals
    GROUP BY department
	ORDER BY Patients_count ASC; 
	




--10. Monthly Medical Expenses Report 
--• Group the data by month and calculate the total medical expenses for each month.

	
	    SELECT TO_CHAR(admission_date,'month')AS month,
		 SUM(medical_expenses)AS total_expenses
		 FROM Hospitals
		 GROUP BY TO_CHAR(admission_date,'month');
		 