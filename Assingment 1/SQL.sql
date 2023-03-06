CREATE TABLE Departments(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(45) NOT NULL,
    manager_id INT NOT NULL,
    location_id INT NOT NULL,
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

CREATE TABLE Locations(
    location_id INT PRIMARY KEY,
    street_address VARCHAR(45) NOT NULL,
    postal_code VARCHAR(8) NOT NULL,
    city VARCHAR(25) NOT NULL,
    state_province VARCHAR(20) NOT NULL,
    country_id INT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
);

CREATE TABLE Countries(
    country_id INT PRIMARY KEY,
    country_name VARCHAR(15) NOT NULL,
    region_id INT NOT NULL,
    FOREIGN KEY (region_id) REFERENCES Regions(region_id)
);

CREATE TABLE Regions(
    region_id INT PRIMARY KEY,
    region_name VARCHAR(15) NOT NULL
);

CREATE TABLE Jobs(
    job_id VARCHAR(10) NOT NULL,
    job_title VARCHAR(45) NOT NULL,
    min_salary DECIMAL(8, 2) NOT NULL,
    max_salary DECIMAL(8, 2) NOT NULL
);

CREATE TABLE Job_History(
    employee_id INT PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    job_id INT NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

CREATE TABLE Employee(
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(20) NOT NULL,
    phone_number VARCHAR(13) NOT NULL,
    hire_date DATE NOT NULL,
    job_id VARCHAR(10) NOT NULL,
    salary DECIMAL(8, 2) NOT NULL,
    commission_pct DECIMAL(8, 2) NOT NULL,
    manager_id INT NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (job_id) REFERENCES Jobs(job_id),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);






