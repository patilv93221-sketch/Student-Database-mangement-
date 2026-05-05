create database studentManagementDB;
use studentManagementDB;

create table students(
	student_id int primary key auto_increment,
    student_name varchar(50),
    student_gender enum("M","F"),
    student_contact varchar(30),
    student_email varchar (50)
);

create table subjects(
	subject_id int primary key auto_increment,
    subject_name varchar(50)
);

create table marks(
    mark_id INT primary key auto_increment,
    student_id INT,
    subject_id INT,
    marks INT,
    foreign key (student_id) references students(student_id),
    foreign key (subject_id) references subjects(subject_id)
);

DELIMITER $$

create procedure addStudent(
student_name varchar(50),
student_gender enum("M","F"),
student_contact varchar(50),
student_email varchar(50)
 )
 begin
    insert into students(student_name,student_gender,student_contact,student_email)
    values (student_name,student_gender,student_contact,student_email);
 end $$
 DELIMITER ;
 
 call addstudent("chetan","M","+919876254872","chetan@gmail.com");
 
 select * from students;
 
 insert into subjects (subject_name)
 values ("English"),("Maths"),("Hindi");
 
 TRUNCATE TABLE marks;
 
 insert into marks (student_id,subject_id,marks)
 values (1,1,69),(1,2,55),(1,3,66);
 
 
  insert into marks (student_id,subject_id,marks)
 values (2,1,55),(2,2,65),(2,3,76);
 
 
  insert into marks (student_id,subject_id,marks)
 values (3,1,61),(3,2,59),(3,3,71);
 
 
  insert into marks (student_id,subject_id,marks)
 values (4,1,51),(4,2,67),(4,3,62);
 
 
 select m.mark_id,m.marks,s.subject_name,st.student_name from marks m
 JOIN subjects s on m.subject_id=s.subject_id
 join students st on m.student_id=st.student_id
 order by mark_id;
 
 select
 s.student_id,
 s.student_name,
 sum(m.marks) as sum
 from students s join marks m on s.student_id=m.student_id
 group by s.student_id,s.student_name order by sum DESC;