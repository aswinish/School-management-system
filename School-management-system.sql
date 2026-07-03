create database collegedb
use collegedb
create table students(
student_id int primary key,
student_name varchar(100) not null,
dob date not null,
gender varchar (15),
phone varchar(20) unique,
email varchar(50) unique
);
insert into  students values(101,"aswini","2006-01-11","female","2039435163","ashwini7079@gmail.com"),
(102,"shyju","2005-12-10","male","7010079366","shyju70100@gmail.com"),
(103,"abi","2008-06-13", "male","8845362710","abi3048@gmail.com"),(104,"ani","2004-07-17","female","8376545405","anisha2034@gmail.com"),
(105,"ashok","2003-05-08","male","9453621848","ashok2049@gmail.com"),(106,"ammu","2005-12-01","female","2345678924","assa143@gmail.com"),
(107,"unni","2006-10-11","male","3245678319","saas143@gmail.com"),(108,"malu","2003-11-03","female","9483764512","malu3546@gmail.com"),
(109,"kanimani","1998-05-07","female","8845637209","kanimani2364@gmail.com"),(110,"amutha","1983-04-09","female","9360984274","amutha2006@gmail.com");
create table departments(
department_id int primary key,
department_name varchar(50) not null
);
insert into departments values(1,"Computer Science"),(2,"Information Technology"),(3,"Artificial Intelligence"),
(4,"Data Science"),(5,"Electronics and Communication"),(6,"Electrical and Electronics"),(7,"Mechanical Engineering"),
(8,"Civil Engineering"),(9,"Business Administration"),(10,"commerce");
create table courses(
course_id int primary key,
course_name varchar(50) not null,
department_id int,
foreign key(department_id)
references departments(department_id)
);
insert into courses values(101,"B.Sc Computer Science",1),(102,"B.Sc Information Technology",2),
(103,"B.Tech Artificial Intelligence",3),(104,"B.Sc Data Science",4),(105,"B.E Electronics and Communication",5),
(106,"B.E Electrical and Electronics",6),(107,"B.E Mechanical Engineering",7),(108,"B.E Civil Engineering",8),
(109,"BBA Business Administration",9),(110,"B.Com commerce",10);
create table faculty(
faculty_id int primary key,
faculty_name varchar(50) not null,
department_id int,
foreign key(department_id)
references departments(department_id)
);
insert into faculty values(1,"unni",1),(2,"aswini",2),(3,"shyju",3),(4,"ammu",4),(5,"anu",5),(6,"amutha",6),
(7,"kanimani",7),(8,"malu",8),(9,"bommi",9),(10,"abi",10);
create table subjects(
subject_id int primary key,
subject_name varchar (50) not null,
course_id int,
foreign key(course_id)
references courses(course_id)
);
insert into subjects values (1,"programming in c",101),(2,"data structures",101),(3,"java progeamming",102),
(4,"python programming",102),(5,"database management system",104),(6,"digital electronics",105),(7,"electrical machines",106),
(8,"thermodynamics",107),(9,"surveying",108),(10,"business communication",109);
create table classes(
class_id int primary key,
class_name varchar(50) not null,
course_id int,
foreign key (course_id) references
courses(course_id)
);
insert into classes values(1,"CS_A",101),(2,"CS_B",101),(3,"IT_A",102),(4,"AI_A",103),(5,"DS_A",104),
(6,"ECE_A",105),(7,"EEE_A",106),(8,"MECH_A",107),(9,"CIVIL_A",108),(10,"BBA_A",109);
create table enrollment(
enrollment_id int primary key,
student_id int,
course_id int,
foreign key(student_id) references students(student_id),
foreign key(course_id) references courses(course_id)
);
insert into enrollment values(1,101,101),(2,102,102),(3,103,103),(4,104,104),(5,105,105),(6,106,106),
(7,107,107),(8,108,108),(9,109,109),(10,110,110);
create table attendance(
attendance_id int primary key,
student_id int,
subject_id int,
attendance_date date,
status varchar(20),
foreign key (student_id)
references students(student_id),
foreign key (subject_id)
references subjects(subject_id)
);
insert into attendance values (1,101,1,"2026-06-01","present"),(2,102,2,"2026-06-01","absent"),(3,103,3,"2026-06-01","present"),
(4,104,4,"2026-06-01","present"),(5,105,5,"2026-06-01","absent"),(6,106,6,"2026-06-01","absent"),(7,107,7,"2026-06-01","present"),
(8,108,8,"2026-06-01","present"),(9,109,9,"2026-06-01","present"),(10,110,10,"2026-06-01","absent");
create table fees(
fee_id int primary key, student_id int, 
amount decimal(10,2), payment_date date,
status varchar(20), foreign key (student_id)
references students(student_id)
);
insert  into fees values (1,101,25000.00,"2026-06-10","paid"),(2,102,25000.00,"2026-06-11","paid"),(3,103,30000.00,"2026-06-12","pending"),
(4,104,28000.00,"2026-06-13","paid"),(5,105,32000.00,"2026-06-14","pending"),(6,106,27000.00,"2026-06-15","paid"),
(7,107,26000.00,"2026-06-16","paid"),(8,108,29000.00,"2026-06-17","panding"),(9,109,24000.00,"2026-06-18","pending"),
(10,110,23000.00,"2026-06-19","paid");
create table marks(
mark_id int primary key,
student_id int,
subject_id int,
internal_mark int,
external_mark int,
foreign key (student_id)references  
students(student_id),
foreign key(subject_id)references 
subjects(subject_id)
);
insert into marks values(1,101,1,25,90),(2,102,2,42,85),(3,103,3,48,95),(4,104,4,40,82),(5,105,5,44,88),
(6,106,6,46,91),(7,107,7,39,80),(8,108,8,47,93),(9,109,9,43,86),(10,110,10,49,97);
 create table exams(
 exam_id int primary key,
 exam_name varchar(100) not null,
 exam_date date
 );
 insert into exams values (1,'internal exam 1','2026-07-10'),(2,'internal exam 2','2026-08-15'),
 (3,'model exam 1','2026-09-05'),(4,'model exam 2','2026-10-10'),(5,'semester exam','2026-11-20'),
 (6,'practical exam','2026-11-25'),(7,'lab exam','2026-11-28'),(8,'viva exam','2026-12-01'),
 (9,'supplementary exam','2026-12-15'),(10,'final semester exam','2026-12-20');    
 select * from exams;
create table books(
book_id int primary key,
book_name varchar(100) not null,
author varchar(100) not null,
publisher varchar(100) not null
);
insert into books values(1,'database management system','raghu ramakrishnan','mcgraw hill'),(2,'programming in c','e.balagurusamy','mcgraw hill'),
(3,'java programming','herbert schildt','oracle press'),(4,'python programming','eric matthes','no starch press'),
(5,'data structures','seymour lipschutz','mcgraw hill'),(6,'operating system','abraham silberachatz','wiley'),
(7,'computer networks', 'andrew s.tanenbau,', 'pearson'),(8,'software engineering','ian sommerville','pearson'),
(9,'artifical intelligence','stuart russell','pearson'),(10,'web technologies','jeffrey c. jackson', 'pearson');
create table librarys(
library_id int primary key,
student_id int,
book_id int,
issue_date date,
retuen_date date,
foreign key(student_id)
references students(student_id),
foreign key(book_id)
references books(book_id)
);
insert into librarys values(1,101,1,'2026-06-01','2026-06-15'),(2,102,2,'2026-06-02','2026-06-16'),(3,103,3,'2026-06-03','2026-06-17'),
(4,104,4,'2026-06-04','2026-06-18'),(5,105,5,'2026-06-05','2026-06-19'),(6,106,6,'2026-06-06','2026-06-20'),(7,107,7,'2026-06-07','2026-06-21'),
(8,108,8,'2026-06-08','2026-06-22'),(9,109,9,'2026-06-09','2026-06-23'),(10,110,10,'2026-06-10','2026-06-24');
create table hostels(
hostel_id int primary key,
student_id int,
room_no varchar (10),
block_name varchar(20),
foreign key(student_id)
references students(student_id)
);
insert into hostels values (1,101,'A101','A Block'),(2,102,'A102','A Block'),(3,103,'B201','B Block'),(4,104,'B202','B Block'),
(5,105,'C301','C Block'),(6,106,'C302','C Block'),(7,107,'D401','D Block'),(8,108,'D402','D Block'),(9,109,'E501','E Block'),
(10,110,'E502','E Block');
create table placements(
placement_id int primary key,
student_id int,
company_name varchar(50) not null,
package decimal(10,2),
status varchar(20),
foreign key(student_id)
references students(student_id)
);
insert into placements values (1,101,'TCS',350000.00,'selected'),(2,102,'Infosys',400000.00,'selected'),(3,103,'Wipro',320000.00,'selected'),
(4,104,'HCL',380000.00,'selected'),(5,105,'Tech mahindea',360000.00,'pending'),(6,106,'cognizant',450000.00,'selected'),
(7,107,'accenture',420000.00,'selected'),(8,108,'capgemini',390000.00,'pending'),(9,109,'IBM',500000.00,'selected'),
(10,110,'zoho',600000.00,'selected');
select * from students;
select * from departments;
select * from courses;
select * from faculty;
select * from subjects;
select * from classes;
select * from enrollment;
select * from attendance;
select * from fees;
select * from marks;
select * from exams;
select * from books;
select * from librarys;
select * from hostels;
select * from placements;
select s.student_name,c.course_name from students s
join enrollment e on s.student_id = e.student_id
join courses c on e.course_id = c.course_id;
select department_id,count(*) as 
total_courses from courses group by department_id;
select student_name from students where student_id in (
select student_id from fees where status='pending'
);
create view student_details as select s.student_name,c.course_name
from students s join enrollment e on s.student_id=e.student_id
join courses c on e.course_id=c.course_id;
select * from student_details;
delimiter //
create procedure studentlist()
begin
select * from students;
end //
delimiter ;
call studentlist();
delimiter //
create function
totalmarks(internal_mark int,external_mark int)
returns int 
deterministic
begin
return internal_mark+external_mark;
end //
delimiter ;
select totalmarks(25,70);
delimiter //
create trigger student_trigger
before insert on students
for each row set
new.student_name=upper(new.student_name);
//
delimiter ;
show triggers ;
select max(external_mark) as maximum_max from marks;
select min(external_mark) as minimum_mark from marks;
select avg(external_mark) as average_mark from marks;
select sum(external_mark) as total_mark from marks;
select max(internal_mark) as maximum_mark from marks;
select min(internal_mark) as minimum_mark from marks;
select avg(internal_mark) as average_mark from marks;
select sum(internal_mark) as total_mark from marks;
select * from marks order by external_mark desc limit 3;
select * from students limit 5 offset 5;
select upper(student_name) as student_name from students;
select lower(student_name) as student_name from students;
select s.student_name,f.amount,f.status from students s inner join fees f on s.student_id = f.student_id;
select s.student_id,s.student_name,c.course_name from students s left outer join enrollment  e
on s.student_id = e.student_id left outer join courses c on e.course_id = c.course_id;
create index idx_student_name on students(student_name);
