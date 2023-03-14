# Databases and SQL Tutorial

## Getting Started

#### 1. Databases
 - Data - raw information
 - Information - meaningful data

 - Database is a system which provides us some sort of usefull operations and it stores the data in a organised way
 - DBMS - It is a system which stores data and provide us a way of interatiion with that data

 - [Read more about databases](https://www.javatpoint.com/dbms-tutorial)

 #### 2. RDBMS
 - Data is stored in the form of rows and columns like tables, tables are also called as relations. 
 - MySQL and PostgreSQL are two popular RDBMS



 ## SQL(Structured Query Language)

   ### 1. Basics
  #### - Database Creation
  
  ```sql
    -- Syntax
    CREATE DATABASE <DATABASE_NAME>;
    -- Example:
    CREATE DATABASE Practice;

    -- Shell Output
    mysql> create database Practice;
    
    -- View exiting databases
    SHOW DATABASES;

    -- Shell Output
    mysql> show databases;
    +--------------------+
    | Database           |
    +--------------------+
    | dataanalytics      |
    | information_schema |
    | mysql              |
    | performance_schema |
    | practice           |
    | sys                |
    +--------------------+

    -- Use a particular database
    USE <DATABASE_NAME>;
   
    -- Shell Output
    mysql> use practice;
    Database changed
```

 ### 2. Types of commands in SQL - [Read more](https://www.javatpoint.com/dbms-sql-command)
  1. DDL (Data Definition Language) - these commands deal with the structure modification of table or columns.

    1. CREATE - To create tables

    2. ALTER - Further 4 types in ALTER command
      - ADD - adds the column
      - MODIFY - changes the column type
      - DROP - deletes column
      - RENAME - change table name or column name
    
    3. DROP - To drop/delete tables

    4. Truncate -  To delete all rows from a table in one go
    
  2. DML (Data Manipulation Language) - these commands deal with the actual data that is stored inside of the tables.

    1. INSERT - To insert a new record in a table
    2. UPDATE - To update an existing record in a table.
    3. DELETE - To delete a record from a table.
    
  3. DCL (Data Control Language) - these commands control the data access.

    1. GRANT - To grant privileges such as data access, update, delete etc.
    2. REVOKE - To revoke access privileges.

  4. DQL (Data Query Language) - To read data.

    1. SELECT - To read table data

  5. TCL (Transaction Control Language) - Commands related to trasaction management.
  
    1. COMMIT - To permanently save the changes in the database
    2. ROLLBACK - To undo the changes made during the transaction.
    3. SAVEPOINT - To maintain a checkpoint in between the transaction.


### 1. DML Commands
#### - **Creating a new table**
```sql
  -- Syntax
  CREATE TABLE <TABLE_NAME>(COLUMN1 DATA_TYPE,COLUMN2 DATA_TYPE, etc.);
  -- Example
  CREATE TABLE Students(student_id int, student_name varchar(20), student_age int);

  -- Shell Output
  mysql> create table Students(student_id int, student_name varchar(20), student_age int);
  Query OK, 0 rows affected (0.02 sec)

```

#### - **Inserting data in tables**
```sql
  -- Inserting data in tables
  
  -- Syntax
  -- When you want to insert data in all the columns of a table
  INSERT INTO <TABLE_NAME> VALUES(value1, value2, value3,....value n);
  -- or 
  -- When you want to insert data in selected columns of a table
  INSERT INTO <TABLE_NAME>(COLUMN_1, COLUMN_2,... etc.) VALUES(value1, value2, value3,....value n);
  
  -- Example
  INSERT INTO Students values(101,'Lovely',21);
  
  -- Shell Output
  mysql> insert into Students values(101,'Lovely',21);
  Query OK, 1 row affected (0.01 sec)
  
  --You can insert as many rows as you want 
  insert into Students values (102,'Jayesh',20);
  insert into Students values (103,'Noman',20);
```
#### - **Viewing table data**
```sql
  -- Now view the table data
  
  -- Syntax
  SELECT * FROM <TABLE_NAME>; -- This prints all the columns
  -- or
  SELECT <COLUMN_1,COLUMN_2, etc.> FROM <TABLE_NAME>; -- this prints only the specified columns
  
  -- Shell Output
  mysql> Select * from Students;
  +------------+--------------+-------------+
  | student_id | student_name | student_age |
  +------------+--------------+-------------+
  |        101 | Lovely       |          21 |
  |        102 | Jayesh       |          20 |
  |        103 | Noman        |          20 |
  +------------+--------------+-------------+    
  ```

#### - **Updating table data**
```sql
  -- To update a record in a table
  
  -- Syntax
  UPDATE <TABLE_NAME> SET <COLUMN_NAME> = <NEW_VALUE> WHERE <Condition>;
  -- the Where clause is used to specify a condition in order to target a single record, because if we don't specify the condition all the records will be updated instead of a single one.
 
  -- We can update multiple column in one go as well
  
  -- Syntax
  UPDATE <TABLE_NAME> SET <COLUMN1_NAME> = <NEW_VALUE>, <COLUMN2_NAME> = <NEW_VALUE>, <COLUMN n_NAME> = <NEW_VALUE> WHERE <Condition>;
  
  -- Example
  UPDATE Students SET student_age = 21 WHERE student_id = 102;
  -- Now this query will only update the student age column for a record where student id equals 102
  
  -- Shell output
  mysql> update Students set student_age = 21 where student_id = 102;
  Query OK, 1 row affected (0.01 sec)
  -- Run the SELECt * FROM Studensts; command in order to view the changes

```

#### - **Deleting records in Table**
```sql
  -- To delete a single records
  -- Syntax
  DELETE FROM <TABLE_NAME> WHERE <Condition>;
  -- The condition is an important factor over here so that you only end up deleting a specific row that you want
  
  -- Example
  DELETE FROM Students WHERE student_id = 103;
  -- It will only delete the record where the student id matches the value 103
  -- Delete all rows
  -- Syntax
  DELETE FROM <TABLE_NAME>;
  -- Since the condition factor is not specified all the rows will be deleted.(Risky)
```

### 2. DDL Commands
#### - **Viewing & Deleting Tables**
```sql    
  -- View all tables in current working database
  SHOW TABLES:
  
  -- Shell Output
  mysql> show tables;
  +--------------------+
  | Tables_in_practice |
  +--------------------+
  | students           |
  +--------------------+
  
  -- View table structure
  DESC <TABLE_NAME>;
  
  -- Example
  DESC Students;
  
  -- Shell Output
  mysql> desc students;
  +--------------+-------------+------+-----+---------+-------+
  | Field        | Type        | Null | Key | Default | Extra |
  +--------------+-------------+------+-----+---------+-------+
  | student_id   | int         | YES  |     | NULL    |       |
  | student_name | varchar(20) | YES  |     | NULL    |       |
  | student_age  | int         | YES  |     | NULL    |       |
  +--------------+-------------+------+-----+---------+-------+
  
  -- To delete a table
  -- Syntax
  DROP TABLE <TABLE_NAME>;
  
  -- Example
  DROP TABLE Students;
```
#### - **Adding a new column**
```sql
  -- In order to add a new column to an existing table we use the ALTER Command

  -- Syntax:
  ALTER TABLE <TABLE_NAME> ADD NEW_COLUMN_NAME DATA_TYPE;

  -- Example:
  ALTER TABLE Students ADD student_gender char(1);
  
  -- Run the DESC Students; in order to view the changes
  mysql> desc students;
  +----------------+-------------+------+-----+---------+----------------+
  | Field          | Type        | Null | Key | Default | Extra          |
  +----------------+-------------+------+-----+---------+----------------+
  | student_id     | int         | NO   | PRI | NULL    | auto_increment |
  | student_name   | varchar(20) | YES  |     | NULL    |                |
  | student_age    | int         | YES  |     | NULL    |                |
  | course_id      | int         | YES  | MUL | NULL    |                |
  | student_gender | char(1)     | YES  |     | NULL    |                |
  +----------------+-------------+------+-----+---------+----------------+ 
```
#### - **Deleting an existing column**
```sql
  -- This allows us to delete the column 

  -- Syntax:
  ALTER TABLE <TABLE_NAME> DROP COLUMN COLUMN_NAME;

  -- Example:
  ALTER TABLE Students DROP COLUMN student_gender;
  
  -- Run the DESC Students; in order to view the changes
  mysql> desc students;
  +----------------+-------------+------+-----+---------+----------------+
  | Field          | Type        | Null | Key | Default | Extra          |
  +----------------+-------------+------+-----+---------+----------------+
  | student_id     | int         | NO   | PRI | NULL    | auto_increment |
  | student_name   | varchar(20) | YES  |     | NULL    |                |
  | student_age    | int         | YES  |     | NULL    |                |
  | course_id      | int         | YES  | MUL | NULL    |                |
  +----------------+-------------+------+-----+---------+----------------+ 
```

#### - **Modifying an existing column**
```sql
  -- This allows us to change or modify the data type for the column

  -- Syntax:
  ALTER TABLE <TABLE_NAME> MODIFY COLUMN_NAME NEW_DATA_TYPE;

  -- Example:
  ALTER TABLE Students MODIFY student_id varchar(3);
  
  -- Run the DESC Students; in order to view the changes
  mysql> desc students;
  +--------------+-------------+------+-----+---------+-------+
  | Field        | Type        | Null | Key | Default | Extra |
  +--------------+-------------+------+-----+---------+-------+
  | student_id   | varchar(3)  | NO   | PRI | NULL    |       |
  | student_name | varchar(20) | YES  |     | NULL    |       |
  | student_age  | int         | YES  |     | NULL    |       |
  | course_id    | int         | YES  | MUL | NULL    |       |
  +--------------+-------------+------+-----+---------+-------+
```


#### - **Renaming an existing column**
```sql
  -- This allows us to rename the column

  -- Syntax:
  ALTER TABLE <TABLE_NAME> RENAME COLUMN COLUMN_NAME TO NEW_COLUMN_NAME;

  -- Example:
  ALTER TABLE Students RENAME COLUMN student_gender TO gender;
  
  -- Run the DESC Students; in order to view the changes
  mysql> desc students;
  +--------------+-------------+------+-----+---------+-------+
  | Field        | Type        | Null | Key | Default | Extra |
  +--------------+-------------+------+-----+---------+-------+
  | student_id   | varchar(3)  | NO   | PRI | NULL    |       |
  | student_name | varchar(20) | YES  |     | NULL    |       |
  | student_age  | int         | YES  |     | NULL    |       |
  | course_id    | int         | YES  | MUL | NULL    |       |
  | gender       | char(1)     | YES  |     | NULL    |       |
  +--------------+-------------+------+-----+---------+-------+
```

#### - **Truncate Command**
```sql
  -- This command is used to remove all the rows from the table in go.

  -- Syntax:
  TRUNCATE TABLE <TABLE_NAME>;

  -- Example:
  TRUNCATE TABLE Students;
```


### **Concept of Keys** [Read More]()
There are many type of keys in databases some are as follows:
1. Primary Key
2. Candidate Key
3. Foreign Key
4. Alternate Key


  #### 1. **Primary Key** [Read More](https://no2imphal.kvs.ac.in/sites/default/files/Class%20XII-UNIT%20III%20-%20SQL%20and%20MySQL%20Notes_0.pdf)
```sql
  -- The primary key is used to uiquely identify a row in a table
  -- There can be only one primary key in a table
  -- Primary key is a constraint which is applied on a particular column
  -- Only unique values are permitted for a primary key column
  -- It is usually applied on columns such as userId,student_roll_number,account_number etc. So that each record is distinct in nature


  -- Creating a primary key
  -- 1. During Table Creation
  -- Syntax: 
  CREATE TABLE <TABLE_NAME>(COLUMN_NAME DATA_TYPE PRIMARY KEY, COLUMN_NAME TYPE);

  -- Example:
  CREATE TABLE StudentInfo(student_roll_number INT PRIMARY KEY, student_name varchar(20));
  -- Mention along with the column
  -- or
  CREATE TABLE StudentInfo(student_roll_number INT, name student_name varchar(20), PRIMARY KEY (student_roll_number));
  -- Mention at the end of the table definition.

  -- 2. After the table is already created
  -- Syntax:
  ALTER TABLE <TABLE_NAME> ADD PRIMARY KEY (COLUMN_NAME);

  -- Example:
  ALTER TABLE Students ADD PRIMARY KEY (student_id);

  -- Run the DESC Students; command to view the changes in the table structure

```
It is recommended to use **AUTO_INCREMENT** with the priamry key column because we don't want the overhead of remembering which values have been used so that we can insert a new record. Thus, using **AUTO_INCREMENT** allows us to automatically assign a new value to this primary key column and we can simply insert the rest of the data.

```sql

  -- 1. During table creation
  -- Syntax: 
  CREATE TABLE <TABLE_NAME>(COLUMN_NAME DATA_TYPE AUTO_INCREMENT PRIMARY KEY, COLUMN_NAME TYPE);

  -- Example:
  CREATE TABLE StudentInfo(student_roll_number INT AUTO_INCREMENT PRIMARY KEY, student_name varchar(20));

  -- 2. After the table is created
  -- Syntax:
  ALTER TABLE <TABLE_NAME> CHANGE <COLUMN_NAME> <COLUMN_NAME> DATA_TYPE AUTO_INCREMENT;
  
  -- Example:
  ALTER TABLE Students CHANGE student_id student_id INT AUTO_INCREMENT;

  -- Run the DESC Students; command to view the changes in the table structure

  -- Shell output
  mysql> desc students;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| student_id   | int         | NO   | PRI | NULL    | auto_increment |
| student_name | varchar(20) | YES  |     | NULL    |                |
| student_age  | int         | YES  |     | NULL    |                |
| course_id    | int         | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
```
 #### 2. **Foreign Key** [Read More](https://no2imphal.kvs.ac.in/sites/default/files/Class%20XII-UNIT%20III%20-%20SQL%20and%20MySQL%20Notes_0.pdf)
 ```sql
  -- It is a non-key attribute whose values are derived from the primary key of another table
  -- This key is used to map relationship betweeen tables and table data
  -- Consider following tabls

-- Students table
mysql> select * from students;
+------------+--------------+-------------+-----------+
| student_id | student_name | student_age | course_id |
+------------+--------------+-------------+-----------+
|        101 | Lovely       |          21 |         1 |
|        102 | Jayeshree    |          20 |         1 |
|        103 | Noman        |          20 |         2 |
+------------+--------------+-------------+-----------+

-- Course table
mysql> select * from course;
+-----------+-------------+
| course_id | course_name |
+-----------+-------------+
|         1 | Polytechnic |
|         2 | B.Tech      |
+-----------+-------------+

-- In the above example the Students table has a column named course_id and there exists a table Course which has this course_id column. Now logically we can identify that which student is enrolled in which course. For eg. Noman is enrolled to B.Tech.
-- The course_id in Course table is the primary key column so that every course can be uniquely identified.
-- Now, this course_id of Course table will be used in the Students table and here, in the Students table it will act as a Foreign key column. Which justifies the definition of Foreign ke.


-- Creating Foreign key
-- 1. During table Creation
-- Syntax:
CREATE TABLE <TABLE_NAME>(COLUMN_NAME DATA_TYPE, COLUMN_NAME DATA_TYPE, FOREIGN KEY (COLUMN_NAME) REFERENCES TABLE_NAME(COLUMN_NAME));

-- Example:
CREATE TABLE (student_id INT PRIMARY KEY, student_name varchar(20), course_id int, FOREIGN KEY (course_id) REFERENCES Course(course_id));
--                              ↑                  ↑
--                    column of current table    column of another table
-- The example example considers that there exists a table named Course with course_id as one of it's column name;

-- 2. After table is created
-- Syntax: 
ALTER TABLE <TABLE_NAME> ADD FOREIGN KEY (COLUMN_NAME) REFERENCES <ANOTHER_TABLE_NAME>(COLUMN_NAME);

-- Example:
ALTER TABLE Students ADD FOREIGN KEY REFERENCES Course(course_id);

-- Run the DESC Students; command to view the reflected changes
mysql> desc students;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| student_id   | int         | NO   | PRI | NULL    | auto_increment |
| student_name | varchar(20) | YES  |     | NULL    |                |
| student_age  | int         | YES  |     | NULL    |                |
| course_id    | int         | YES  | MUL | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+

-- Now there is a MUL keyword in the key column for the course_id column, which stands for Multiple and this means there can exist mulitiple same values for this column
 ```
 #### Referential Integrity
-  A referential integrity is a system of rules that a DBMS uses to ensure that relationships between records in
related tables are valid, and that users don’t accidentally delete or change related data. 
- This integrity is
ensured by foreign key.


  
