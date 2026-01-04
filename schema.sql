CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    branch VARCHAR(50),
    cgpa DECIMAL(3,2)
);

CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(50),
    sector VARCHAR(50)
);

CREATE TABLE placements (
    placement_id INT PRIMARY KEY,
    student_id INT,
    company_id INT,
    package_lpa DECIMAL(4,2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);
