# To create a database
CREATE DATABASE heart_attack;
use  heart_attack;

# To create a table named heart_attack_data in heart_attack database
CREATE TABLE heart_attack_data (
    Age INT,
    Gender INT,
    Heart_rate INT,
    Systolic_blood_pressure INT,
    Diastolic_blood_pressure INT,
    Blood_sugar FLOAT,
    CK_MB FLOAT,
    Troponin FLOAT,
    Result TEXT,
    Risk_Level TEXT,
    Recommendation TEXT
);

select * from heart_attack_data;

# Q.1 How many total records are in the dataset?
SELECT COUNT(*) AS TotalRecords
FROM heart_attack_data;

# Q.2 What are the unique risk levels and how many patients fall into each?
SELECT 
    Risk_Level, 
    COUNT(*) AS Patient_Count
FROM 
    heart_attack_data
GROUP BY 
    Risk_Level;
    
# Q.3 What is the average age of patients?
SELECT AVG(Age) AS Average_Age
FROM heart_attack_data;

# Q.4 How many male vs. female patients are there?
SELECT 
    CASE Gender 
        WHEN 1 THEN 'Male'
        WHEN 0 THEN 'Female' 
    END AS Gender,
    COUNT(*) AS Patient_Count
FROM 
    heart_attack_data
GROUP BY 
    Gender;
    
# Q.5 What is the average heart rate for each gender?
SELECT 
    CASE Gender 
        WHEN 1 THEN 'Male'
        WHEN 0 THEN 'Female' 
    END AS Gender,
    AVG(Heart_rate) AS Avg_Heart_Rate
FROM 
    heart_attack_data
GROUP BY 
    Gender;
    
# Q.6 What is the minimum and maximum blood pressure (systolic and diastolic)?
SELECT 
    MIN(Systolic_blood_pressure) AS Min_Systolic_BP,
    MAX(Systolic_blood_pressure) AS Max_Systolic_BP,
    MIN(Diastolic_blood_pressure) AS Min_Diastolic_BP,
    MAX(Diastolic_blood_pressure) AS Max_Diastolic_BP
FROM 
    heart_attack_data;
    
# Q.7 How many patients tested positive vs. negative for heart attack risk?
SELECT 
    Result AS Heart_Attack_Test_Result, 
    COUNT(*) AS Patient_Count
FROM 
    heart_attack_data
GROUP BY 
    Result;
    
# Q.8 What are the top 5 highest troponin levels?
SELECT 
    Age, Gender, Heart_rate, Troponin, Risk_Level, Recommendation
FROM 
     heart_attack_data
ORDER BY 
    Troponin DESC
LIMIT 5;

# Q.9 How many patients aged over 60 are in each risk level?
SELECT 
    Risk_Level,
    COUNT(*) AS Patient_Count
FROM 
     heart_attack_data
WHERE 
    Age > 60
GROUP BY 
    Risk_Level;
    
# Q.10 What’s the average blood sugar level per gender?
SELECT 
    CASE Gender 
        WHEN 1 THEN 'Male'
        WHEN 0 THEN 'Female' 
    END AS Gender,
    AVG(Blood_sugar) AS Avg_Blood_Sugar
FROM 
    heart_attack_data
GROUP BY 
    Gender;

# Q.11 How many patients are recommended "Immediate medical attention"?
SELECT 
    COUNT(*) AS Patient_Count
FROM 
    heart_attack_data
WHERE 
    Recommendation = 'Immediate medical attention';

# Q.12 Which age group has the most high-risk patients?
SELECT 
    CASE
        WHEN Age BETWEEN 0 AND 20 THEN '0-20'
        WHEN Age BETWEEN 21 AND 40 THEN '21-40'
        WHEN Age BETWEEN 41 AND 60 THEN '41-60'
        WHEN Age BETWEEN 61 AND 80 THEN '61-80'
        WHEN Age > 80 THEN '80+'
    END AS Age_Group,
    COUNT(*) AS High_Risk_Patient_Count
FROM heart_attack_data
WHERE Risk_Level = 'High'
GROUP BY 
    Age_Group
ORDER BY  High_Risk_Patient_Count DESC;
    
    














