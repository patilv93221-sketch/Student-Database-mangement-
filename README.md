# 🎓 Student Management System (SQL Project)

## 📌 Overview

This project is a **Student Management System** built using **MySQL**. It demonstrates how to design and manage a relational database for storing student details, subjects, and their marks.

The project focuses on:

* Database design (normalization)
* Table relationships using foreign keys
* Stored procedures
* Data retrieval using JOINs and aggregate functions

---

## 🗂️ Database Structure

### 1. Students Table

Stores student information:

* `student_id` (Primary Key)
* `student_name`
* `student_gender`
* `student_contact`
* `student_email`

---

### 2. Subjects Table

Stores subject details:

* `subject_id` (Primary Key)
* `subject_name`

---

### 3. Marks Table

Stores marks scored by students:

* `mark_id` (Primary Key)
* `student_id` (Foreign Key)
* `subject_id` (Foreign Key)
* `marks`

---

## 🔗 Relationships

* One student can have **multiple marks**
* One subject can be assigned to **multiple students**
* `marks` table acts as a **bridge (many-to-many relationship)**

---

## ⚙️ Features

* ✅ Create database and tables
* ✅ Insert student data using stored procedure
* ✅ Maintain relational integrity using foreign keys
* ✅ Perform JOIN operations
* ✅ Calculate total marks using aggregation
* ✅ Sort students based on performance

---

## 🧪 Sample Queries

### 🔹 View Student Marks with Subjects

```sql
SELECT m.mark_id, m.marks, s.subject_name, st.student_name
FROM marks m
JOIN subjects s ON m.subject_id = s.subject_id
JOIN students st ON m.student_id = st.student_id
ORDER BY mark_id;
```

### 🔹 Calculate Total Marks of Each Student

```sql
SELECT 
    s.student_id,
    s.student_name,
    SUM(m.marks) AS total_marks
FROM students s
JOIN marks m ON s.student_id = m.student_id
GROUP BY s.student_id, s.student_name
ORDER BY total_marks DESC;
```

---

## 🛠️ Stored Procedure

### Add Student

```sql
CALL addStudent('chetan', 'M', '+919876254872', 'chetan@gmail.com');
```

---

## 🚀 How to Run

1. Install MySQL
2. Open MySQL Workbench / CLI
3. Run the SQL script:

   ```sql
   SOURCE your_file.sql;
   ```
4. Execute queries to test functionality

---

## 📈 Future Improvements

* Add grade calculation (A/B/C)
* Add pass/fail status
* Create views for reports
* Build frontend using Java/Python/PHP
* Add triggers for automation

---

## 👨‍💻 Author

**Your Name**

---

## 📄 License

This project is for educational purpose
