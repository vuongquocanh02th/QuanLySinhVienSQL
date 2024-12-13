use quanlysinhvien;

create table class(
	classId int auto_increment not null primary key,
    className varchar(60) not null,
    startDate datetime not null,
    status bit 
);

create table student(
	studentId int auto_increment not null primary key,
    studentName varchar(30) not null,
    address varchar(50),
    phone varchar(20),
    status bit,
    classId int not null,
    foreign key (classId) references class(classId)
);

create table subject(
	subId int auto_increment not null primary key,
    subName varchar(30) not null,
    credit tinyint default 1 check (Credit >=1 ) not null,
    status bit default 1
);

create table mark(
	markId int auto_increment not null primary key,
    subId int not null,
    studentId int not null,
    mark float default 0 check (Mark between 0 and 100),
    examTimes tinyint default 1,
    unique(subId, studentId),
    foreign key (subId) references subject(subId),
    foreign key (studentId) references student(studentId)
);


