use school_db;

-- Rename of the tables
-- RENAME table address TO addresses;
-- RENAME table student TO students;
-- RENAME table teacher TO teachers;
-- RENAME table course_teacher TO courses_teaches;

-- RENAME table courses TO course;


-- ALTER TABLE bookings RENAME COLUMN create_date TO created_at;
-- ALTER TABLE bookings RENAME KEY 'idx_tal_dei_tali' TO 'idx_tal_dei_tali';
-- ALTER TABLE bookings RENAME CONSTRAINT 'fk_address_teachers' TO 'fk_address_teachers_chnged';

/* MODIFICA TIPO E CARATTERISTICHE DELLE COLONNE */
-- ALTER TABLE bookings CHANGE id id bigint unsigned AUTO_INCREMENT not null;
-- ALTER TABLE teachers CHANGE first_name first_name int unsigned not null;
-- ALTER TABLE teachers CHANGE first_name first_name varchar(100) not null;
-- ALTER TABLE teachers MODIFY first_name varchar(100) not null;

/* AGGIUNTA ELEMENTI ALLA TABELLA */
-- ALTER TABLE bookings ADD updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
-- ALTER TABLE bookings ADD INDEX idx_created_at (created_at);
-- ALTER TABLE bookings ADD PRIMARY KEY (id);

/* TOGLI ELEMENTI DALLA TABELLA */
-- ALTER TABLE bookings DROP INDEX idx_created_at;

/* RINOMINARE DB */
-- CREATE database school_db_changed;
-- RENAME TABLE school_db.bookings TO school_db_changed.bookings; -- altro

/* CONSTRAINTs */
-- ALTER TABLE bookings DROP CONSTRAINT fk_bookings_student;
-- ALTER TABLE bookings ADD CONSTRAINT fk_bookings_student FOREIGN KEY (student_id) REFERENCES student(id);


-- select * from `sakila`.`actor` 
-- where 
-- -------------------------------------------------------------
-- actor_id > 270 | and not actor_id = 272 | or actor_id = 271 |


-- -------------------------------------------------------------
-- actor_id > 270 and ( actor_id = 272 or actor_id = 271 )|

-- 271
-- 272
