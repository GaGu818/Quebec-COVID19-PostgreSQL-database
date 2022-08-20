-- Include your drop table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the drop table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been dropped (reverse of the creation order).

DROP VIEW IF EXISTS mtlnurses;

DROP TABLE IF EXISTS NurseAssignments;

DROP TABLE IF EXISTS VaccSlot;

DROP TABLE IF EXISTS VaccDates;

DROP TABLE IF EXISTS Nurse;

DROP TABLE IF EXISTS Hospital;

DROP TABLE IF EXISTS Vial;

DROP TABLE IF EXISTS VaccineBatch;

DROP TABLE IF EXISTS VaccLocation;

DROP TABLE IF EXISTS Vaccine;

DROP TABLE IF EXISTS Person;

DROP TABLE IF EXISTS Category;
