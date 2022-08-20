-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!

INSERT INTO category VALUES ('Healthcare Workers', 1);
INSERT INTO category VALUES ('Teachers', 2);
INSERT INTO category VALUES ('Elderly', 3);
INSERT INTO category VALUES ('Children', 4);
INSERT INTO category VALUES ('Normal People', 5);

INSERT INTO person VALUES (2012032394, 'Aiden', 'Men', '1996-03-08', '416-4891561', 'Montreal', 'H1W71', '130 YUL street', '2020-04-05', 'Children');
INSERT INTO person VALUES (2012032396, 'Ethan', 'Woman', '1973/2/24', '416-4464267', 'Montreal', 'H1W92', '132 YUL street', '2020-07-07', 'Healthcare Workers');
INSERT INTO person VALUES (2012032397, 'Matthew', 'Men', '2004-02-16', '416-4659473', 'Montreal', 'H1W10', '133 YUL street', '2020-08-29', 'Teachers');
INSERT INTO person VALUES (2012032399, 'Jack', 'Men', '1996/8/16', '416-4025881', 'Montreal', 'H1W11', '134 YUL street', '2020-09-26', 'Normal People');
INSERT INTO person VALUES (2012032395, 'Jane Doe', 'Men', '1954-11-09', '416-4717863', 'Montreal', 'H1W83', '131 YUL street', '2020-02-24', 'Elderly');

INSERT INTO vaccine VALUES ('Pfizer-BioNTech', '1', '2');
INSERT INTO vaccine VALUES ('Moderna', '2', '2');
INSERT INTO vaccine VALUES ('Bayer', '3', '2');
INSERT INTO vaccine VALUES ('Zhongke', '1', '3');
INSERT INTO vaccine VALUES ('Weupu', '6', '4');

INSERT INTO vacclocation VALUES ('Central park', 'Montreal', 'H3B1B4', '130 City Councillor Street');
INSERT INTO vacclocation VALUES ('MTL Church', 'Montreal', 'H3B1B5', '131 City Councillor Street');
INSERT INTO vacclocation VALUES ('VCA Park', 'Montreal', 'H3B1B6', '45 People Councillor Street');
INSERT INTO vacclocation VALUES ('10th Avenue', 'Toronto', 'H3B1B7', '133 City Councillor Street');
INSERT INTO vacclocation VALUES ('Jewish General', 'Vancouver', 'H3B1B8', '134 City Councillor Street');

INSERT INTO vaccinebatch VALUES ('Pfizer-BioNTech', 28321, '2021-01-23', '2022-01-23', '560', 'Central park');
INSERT INTO vaccinebatch VALUES ('Moderna', 28322, '2021-01-09', '2022-01-09', '242', 'MTL Church');
INSERT INTO vaccinebatch VALUES ('Bayer', 28323, '2020-12-30', '2021-12-30', '780', 'VCA Park');
INSERT INTO vaccinebatch VALUES ('Zhongke', 28324, '2021-02-12', '2022-02-12', '618', '10th Avenue');
INSERT INTO vaccinebatch VALUES ('Weupu', 28325, '2021-01-07', '2022-01-07', '630', 'Jewish General');

INSERT INTO vial VALUES ('Pfizer-BioNTech', 28321, '75654');
INSERT INTO vial VALUES ('Moderna', 28322, '75655');
INSERT INTO vial VALUES ('Pfizer-BioNTech', 28321, '75656');
INSERT INTO vial VALUES ('Moderna', 28322, '75657');
INSERT INTO vial VALUES ('Pfizer-BioNTech', 28321, '75658');
INSERT INTO vial VALUES ('Moderna', 28322, '75677');
INSERT INTO vial VALUES ('Pfizer-BioNTech', 28321, '78658');

INSERT INTO hospital VALUES ('Central park');
INSERT INTO hospital VALUES ('MTL Church');
INSERT INTO hospital VALUES ('VCA Park');
INSERT INTO hospital VALUES ('10th Avenue');
INSERT INTO hospital VALUES ('Jewish General');

INSERT INTO nurse VALUES (2834294, 'Jane', 'Central park');
INSERT INTO nurse VALUES (2834295, 'Yori', 'MTL Church');
INSERT INTO nurse VALUES (2834296, 'Tomos', 'VCA Park');
INSERT INTO nurse VALUES (2834297, 'Nancy', '10th Avenue');
INSERT INTO nurse VALUES (2834298, 'Coco', 'Jewish General');

INSERT INTO vaccdates VALUES ('Central park', '2021-02-06');
INSERT INTO vaccdates VALUES ('MTL Church', '2021-01-12');
INSERT INTO vaccdates VALUES ('VCA Park', '2021-01-16');
INSERT INTO vaccdates VALUES ('10th Avenue', '2021-02-06');
INSERT INTO vaccdates VALUES ('Jewish General', '2021-03-20');

INSERT INTO vaccslot VALUES ('10th Avenue', '2021-02-06', '2021-02-06 15:00:00', '1', 2012032397, '2021-02-06', 2834297, 'Moderna', 28322, '75657');
INSERT INTO vaccslot VALUES ('Jewish General', '2021-03-20', '2021-03-20 16:00:00', '1', 2012032399, '2021-03-20', 2834298, 'Pfizer-BioNTech', 28321, '75658');
INSERT INTO vaccslot VALUES ('Jewish General', '2021-03-20', '2021-03-20 12:00:22', '1', NULL, NULL, 2834298, 'Moderna', 28322, '75677');
INSERT INTO vaccslot VALUES ('Jewish General', '2021-03-20', '2021-03-20 15:00:22', '1', NULL, NULL, 2834296, 'Pfizer-BioNTech', 28321, '78658');
INSERT INTO vaccslot VALUES ('Central park', '2021-02-06', '2021-02-6 12:37:54', '1', 2012032394, '2021-02-06', 2834294, 'Pfizer-BioNTech', 28321, '75654');
INSERT INTO vaccslot VALUES ('VCA Park', '2021-01-16', '2021-01-16 14:00:00', '1', 2012032396, '2021-01-16', 2834296, 'Pfizer-BioNTech', 28321, '75656');
INSERT INTO vaccslot VALUES ('MTL Church', '2021-01-12', '2021-01-16 13:00:00', '1', 2012032395, '2021-02-06', 2834295, 'Moderna', 28322, '75655');

INSERT INTO nurseassignments VALUES (2834294, 'Central park', '2021-02-06');
INSERT INTO nurseassignments VALUES (2834295, 'MTL Church', '2021-01-12');
INSERT INTO nurseassignments VALUES (2834296, 'Jewish General', '2021-03-20');
INSERT INTO nurseassignments VALUES (2834297, '10th Avenue', '2021-02-06');
INSERT INTO nurseassignments VALUES (2834298, 'VCA Park', '2021-01-16');