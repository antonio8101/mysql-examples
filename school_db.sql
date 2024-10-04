drop database school_db;

create database school_db;

use school_db;

create table address (
    id int unsigned unique AUTO_INCREMENT,
    street varchar(50),
    city varchar(50),
    province varchar(50),
    country_code enum('IT', 'EU', 'NON-EU'),
    country varchar(50),
    PRIMARY KEY(id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

create table student (
    id int unsigned unique AUTO_INCREMENT,
    first_name varchar(50),
    last_name varchar(50),
    date_birth date null,
    phone_number varchar(100) null,
    email varchar(100) null,
    address_id int unsigned null unique,
    PRIMARY KEY(id),
    CONSTRAINT fk_address_student FOREIGN KEY (address_id) REFERENCES address(id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

INSERT INTO 
address (street, city, province, country_code, country) 
VALUES ('via tal dei tali 1', 'Milano', 'MI', 1, 'Italia');

INSERT INTO 
student (id, first_name, last_name, date_birth, phone_number, email, address_id) 
VALUES (1, 'John', 'Doe', '1980-01-01', '+ 39 02 939239293', 'doe@test.it', 1);

create table course(
    id int unsigned unique AUTO_INCREMENT,
    name varchar(50),
    description text,
    start_date date,
    end_date date,
    duration smallint unsigned,
    location varchar(50),
    PRIMARY KEY(id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

create table teacher (
    id int unsigned unique AUTO_INCREMENT,
    first_name varchar(50),
    last_name varchar(50),
    date_birth date null,
    phone_number varchar(100) null,
    email varchar(100) null,
    address_id int unsigned null,
    PRIMARY KEY(id),
    CONSTRAINT fk_address_teachers FOREIGN KEY (address_id) REFERENCES address(id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

create table course_teacher(
    teacher_id int unsigned,
    course_id int unsigned,
    PRIMARY KEY(teacher_id, course_id),
    CONSTRAINT fk_course_teacher_teacher FOREIGN KEY (teacher_id) REFERENCES teacher(id),
    CONSTRAINT fk_course_teacher_course FOREIGN KEY (course_id) REFERENCES course(id)
);

INSERT INTO 
address (street, city, province, country_code, country) 
VALUES ('via tal dei tali 1', 'Milano', 'MI', 1, 'Italia');

INSERT INTO 
teacher (id, first_name, last_name, date_birth, phone_number, email, address_id) 
VALUES (1, 'Antonio', 'Bruno', '1981-01-01', '+ 39 02 939239293', 'br@test.it', 1);

INSERT INTO
course (id, name, description, start_date, end_date, duration, location)
VALUES (1, 'Back end Web Development', 'Best course..', '2024-07-01', '2025-01-31', 130, 'online');

INSERT INTO
course_teacher (teacher_id, course_id)
VALUES (1, 1);

create table bookings(
    id int unsigned AUTO_INCREMENT,
    student_id int unsigned not null,
    course_id int unsigned not null,
    create_date timestamp DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    CONSTRAINT fk_bookings_student FOREIGN KEY (student_id) REFERENCES student(id),
    CONSTRAINT fk_bookings_course FOREIGN KEY (course_id) REFERENCES course(id)
);

INSERT INTO
bookings (student_id, course_id)
VALUES (1, 1);