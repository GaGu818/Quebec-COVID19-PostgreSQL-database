CREATE VIEW mtlnurses AS SELECT N.licensenum, N.name, N.locname AS Hospital, VA.lpostalcd, VA.lstreetaddr FROM Nurse N LEFT JOIN  NurseAssignments NA ON N.licensenum = NA.licensenum LEFT JOIN VaccLocatiON VA ON NA.locname = VA.locname WHERE VA.lcity = 'Montreal';
	
SELECT * FROM mtlnurses LIMIT 5;

SELECT * FROM mtlnurses WHERE Hospital = 'Jewish General' LIMIT 5;

INSERT INTO mtlnurses(licensenum,name,Hospital,lpostalcd,lstreetaddr) VALUES(2833290,'Tom','Central park','H3B1B4','130 City Councillor Street');