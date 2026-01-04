-- 1. Average salary by branch
SELECT s.branch, ROUND(AVG(p.package_lpa),2) AS avg_package
FROM placements p
JOIN students s ON p.student_id = s.student_id
GROUP BY s.branch;

-- 2. Highest salary offered
SELECT MAX(package_lpa) AS highest_package
FROM placements;

-- 3. Placement count by branch
SELECT branch, COUNT(*) AS placed_students
FROM students s
JOIN placements p ON s.student_id = p.student_id
GROUP BY branch;

-- 4. CGPA vs Salary analysis
SELECT 
    CASE 
        WHEN s.cgpa >= 9 THEN '9+'
        WHEN s.cgpa >= 8 THEN '8–9'
        ELSE 'Below 8'
    END AS cgpa_range,
    ROUND(AVG(p.package_lpa), 2) AS avg_package
FROM students s
JOIN placements p 
    ON s.student_id = p.student_id
GROUP BY 
    CASE 
        WHEN s.cgpa >= 9 THEN '9+'
        WHEN s.cgpa >= 8 THEN '8–9'
        ELSE 'Below 8'
    END;


-- 5. Top 3 highest paid students
SELECT TOP 3 s.name, s.branch, p.package_lpa
FROM students s
JOIN placements p ON s.student_id = p.student_id
ORDER BY p.package_lpa DESC;

 --6. Placement Rate 
SELECT 
COUNT(DISTINCT p.student_id)*100.0 / COUNT(s.student_id) AS placement_rate_percentage
FROM students s
LEFT JOIN placements p ON s.student_id = p.student_id;

--7. Unplaced Students
SELECT name, branch, cgpa
FROM students
WHERE student_id NOT IN (SELECT student_id FROM placements);

--8. Sector-wise Salary Analysis 
SELECT c.sector, ROUND(AVG(p.package_lpa),2) AS avg_salary
FROM placements p
JOIN companies c ON p.company_id = c.company_id
GROUP BY c.sector;

