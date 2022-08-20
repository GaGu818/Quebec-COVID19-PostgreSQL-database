ALTER TABLE  VaccineBatch ADD CONSTRAINT  comdate CHECK (mfgdate<exprydate);

INSERT INTO vaccinebatch VALUES ('Pfizer-BioNTech', 28320, '2021-01-23', '2020-01-23', '560', 'Central park');