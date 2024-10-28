-- database creation & schema design
create schema school_managment;

create table students(
 student_id INT PRIMARY KEY,
 first_name varchar(50),
 last_name varchar(50),
 dob date,
 email text,
phone_number varchar(25)
);

create table courses(
course_id INT PRIMARY KEY,
course_name varchar(50),
course_code varchar(50),
credits varchar(50)
);

create table enrollments( 
enrollment_id INT PRIMARY KEY,
student_id INT,
course_id INT,
enrollment_date date
);

create table grades(
grade_id INT PRIMARY KEY,
enrollment_id INT,
 grade varchar(50)
 );
 
 -- 2. Alterations and Modifications
 -- Add a column `address` to the `students` table.
 alter table students add column address varchar(100);
 
 -- Modify the `course_name` column in the `courses` table to be of type `VARCHAR(100)`.
 alter table courses modify column course_name varchar(100);
 
 -- Change the position of the `credits` column to be right after the `course_code` in the `courses` table.
 alter table courses modify column credits varchar(25) after course_code;
 
 -- Rename the `dob` column in `students` to `date_of_birth`.
 alter table students rename column dob to date_of_birth;
 
 -- 3. Data Insertion
 -- Insert at least 30 students into the `students` table.
 insert into students(student_id,first_name,last_name,date_of_birth,email,phone_number) values
(001,'gerald','okafor','2009-03-10','gerald78@gmail.com','0806947898'),
(002,'gale','bolt','1998-05-25','galebolt600@gmail.com','07056790534'),
(003,'mark','ken','2001-08-26','mark2001@icloud.com','08075423598'),
(004,'frank','bob','1997-09-07','bobfrank@yahoo.com','090567320786'),
(005,'zion','fred','1770-10-09','fredzion@icloud.com','07004871937'),
(006,'bale','bull','1880-04-18','balebull@gmail.com','08056478391'),
(007,'whale','green','2000-08-20','whalegreen300@gamil.com','07073610376'),
(008,'chidimma','ford','2001-10-25','chidimmaford09@icloud.com','07065436789'),
(009,'lan','books','2003-01-01','lanbooks@gmail.com','09087690865'),
(010,'meek','mill','1909-02-04','meekmill90@yahoo.com','08075645376'),
(011,'jamie','fraser','2005-09-07','jamiefraser@yahoo.com','09087987678'),
(012,'mary','anna','2007-08-07','maryanna00@gmail.com','09087987678'),
(013,'clara','frost','1990-10-07','clarafrost@icloud.com','08078987654'),
(014,'elon','musk','1880-04-17','elonmusk@yahoo.com','07064534567'),
(015,'master','white','2008-06-07','masterwhite@gmail.com','09067543216'),
(016,'gucci','killer','2003-05-01','guccikiller@gmail.com','08076543521'),
(017,'barak','obama','1997-05-09','barakobama001@icloud.com','09087654325'),
(018,'chisom','free','2008-07-04','freechisom@gmail.com','08076545357'),
(019,'queen','mill','2005-09-08','queenmill@gmail.com','09078654678'),
(020,'rose','lick','1660-11-12','roselick@gmail.com','070678990789'),
(021,'nike','boy','2024-02-10','nikeboy@icloud.com','08079698767'),
(022,'brand','little','2023-12-20','brandlittle@yahoo.com','081756432318'),
(023,'kelly','ray','2024-10-09','kellyray@yahoo.com','09086754378'),
(024,'rita','why','2023-08-16','ritawhy@gmail.com','09087654789'),
(025,'emeka','dance','2024-10-18','emekadance@icloud.com','08198178178'),
(026,'peace','heart','2005-06-07','peaceheart@gmail.com','090876543212'),
(027,'range','rover','1990-08-15','rangerover@yahoo.com','08076854316'),
(028,'paul','will','2002-08-19','paulwill@yahoo.com','090787656432'),
(029,'jane','raw','2011-03-09','janeraw@gmail.com','08078965432'),
(030,'brave','jeff','2012-09-19','bravejeff@yahoo.com','0907456261');

-- Insert at least 10 courses into the `courses` table.
insert into courses(course_id,course_name,course_code,credits) values
(001,'introduction foundation of educational psychology ','edu122','2'),
(002,'philosophy and logic ','gss103','2'),
(003,'nigerian people and culture ','gss107','2'),
(004,'introduction to computer','cis101','2'),
(005,'introduction to political science','psc101','2'),
(006,'nigerian constitutional development','psc121','3'),
(007,'introduction to sociology','soc101','2'),
(008,'communication in english','gss101','2'),
(009,'historical foundation of education','edu101','2'),
(010,'introduction to teaching profession','edu103','2');

-- Insert at least 12 records into the `enrollments` table, ensuring that some students are enrolled in multiple courses.
insert into enrollments(enrollment_id,student_id,course_id,enrollment_date) values
(001,'1','001','2024-07-09'),
(002,'2','002','2024-07-07'),
(003,'3','003','2024-08-07'),
(004,'4','004','2024-08-07'),
(005,'5','005','2024-08-07'),
(006,'6','006','2024-08-07'),
(007,'7','007','2024-08-07'),
(008,'8','008','2024-08-07'),
(009,'9','009','2024-08-07'),
(010,'10','010','2024-08-07'),
(011,'11','011','2024-08-07'),
(012,'12','012','2024-08-07');

-- Insert grades for each enrollment in the `grades` table.
insert into grades(grade_id,enrollment_id,grade) values
(001,'1','C'),
(002,'2','A'),
(003,'3','B'),
(004,'4','A'),
(005,'5','E'),
(006,'6','D'),
(007,'7','C'),
(008,'8','E'),
(009,'9','A'),
(010,'10','B'),
(011,'11','C'),
(012,'12','F');

-- 4. Complex Queries
-- Write a query to retrieve the full names and courses for all students
select s.student_id, concat(s.first_name,s.last_name) as full_name,c.course_name
from students as s
inner join enrollments as e
on s.student_id=e.student_id
inner join courses as c
on e.course_id=c.course_id;

-- Write a query to find all students who have not yet been assigned a grade.
select students.student_id, concat(students.first_name,students.last_name) as full_name
from students
left join enrollments
on students.student_id=enrollments.student_id
left join grades
on enrollments.enrollment_id=grades.enrollment_id
where grades.grade_id is null;

-- Write a query that returns the average grade for each course.
select courses.course_name, avg(grades.grade) as average_grade
from courses
join enrollments on courses.course_id=enrollments.course_id
inner join grades on enrollments.enrollment_id = grades.enrollment_id
group by courses.course_id;

-- Create a `CASE` statement to assign letter grades (A, B, C, D, F) based on numerical grades.
select grades.enrollment_id,grade_id, courses.course_name,grades.grade,
case
when grades.grade_id>= 012 and grades.grade_id<=010 then 'A'
when grades.grade_id>=009 and grades.grade_id<=007 then 'B'
when grades.grade_id>=006 and grades.grade_id<=004 then 'C'
when grades.grade_id>=003 and grades.grade_id<=001 then 'D'
else 'F'
END as letter_grade
from courses
join enrollments
on courses.course_id=enrollments.course_id
join grades
on enrollments.enrollment_id=grades.enrollment_id;

-- Use subqueries to find students with the highest grades in each course.
select courses.course_name,students.first_name,students.last_name,max(grades.grade_id) as highest_grade
from courses
join enrollments
on courses.course_id=enrollments.course_id
join grades
on enrollments.enrollment_id=grades.enrollment_id
join students
on enrollments.student_id=students.student_id
group by grades.grade_id
order by highest_grade desc
limit 1;

-- 5. Using CTEs (Common Table Expressions)
-- Write a CTE to list all students with their course names and grades.
with studentscoursesgrades as(
select concat(students.first_name,students.last_name) as full_name,courses.course_name,grades.grade
from students
join enrollments
on students.student_id=enrollments.student_id
join courses
on enrollments.course_id=courses.course_id
join grades
on enrollments.enrollment_id=grades.enrollment_id
)
select * from studentscoursesgrades;

-- Write a CTE to find students who have taken more than 2 courses.
with studentscoursescounts as(
select student_id, count(*) as num_courses
from enrollments
group by student_id
)
select concat(students.first_name,last_name) as full_name,students.student_id,c.num_courses
from students
join studentscoursescounts c
on students.student_id=c.student_id
where c.num_courses>=2;

-- 7. Additional Tasks
-- Write a query to count the number of students enrolled in each course.
select courses.course_name, count(enrollments.student_id) as enrolled_students
from courses
join enrollments on courses.course_id=enrollments.course_id
group by courses.course_name;

-- Create a report showing the total number of students, courses, and enrollments.
select
(select count(*) from students) as total_students,
(select count(*) from courses) as total_course,
(select count(*) from enrollments) as total_enrollments;

-- Use a JOIN to retrieve the names of students and the courses they are not enrolled in.
select students.first_name,students.last_name,courses.course_name
from students
cross join courses
left join enrollments on students.student_id=enrollments.student_id
and courses.course_id=enrollments.course_id
where enrollments.enrollment_id is null;

-- Write a query to find students who share the same last name.
select last_name,count(*) as count
from students
group by last_name
having count(*)> 1;

-- Create a new table named dropped_courses with the same structure as enrollments, then move all enrollments where the grade is "F" to this table.
