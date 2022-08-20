--a
SELECT * FROM Vaccslot WHERE hinsurnum is NULL AND locname = 'Jewish General' AND vdate = '2021-03-20';

--b
SELECT p.name, v.asgndate, vb.exprydate FROM VaccSlot v LEFT JOIN Person p ON v.hinsurnum = p.hinsurnum LEFT JOIN VaccineBatch vb ON vb.vname =v.vname AND vb.batchno = v.batchno WHERE p.name = 'Jane Doe' AND v.asgndate = '2021-02-06';

--c
SELECT COUNT(*) FROM VaccSlot v LEFT JOIN VaccLocation n ON v.locname = n.locname WHERE n.lcity = 'Montreal' AND v.asgndate ='2021-02-06';
	
--d
SELECT name,phone,hinsurnum FROM Person WHERE hinsurnum in (SELECT P.hinsurnum FROM (SELECT  hinsurnum  FROM VaccSlot WHERE vname = 'Pfizer-BioNTech' AND asgndate <'2021-02-01' AND hinsurnum is not NULL) P GROUP BY P.hinsurnum HAVING COUNT(P.hinsurnum)<2);

--e
SELECT  c.cname ,COUNT(p.hinsurnum)  FROM VaccSlot v LEFT JOIN  Person p ON v.hinsurnum = p.hinsurnum LEFT JOIN  Category c ON p.cname = c.cname GROUP BY c.cname HAVING COUNT(p.hinsurnum)>0;