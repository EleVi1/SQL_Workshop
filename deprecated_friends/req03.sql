ALTER TABLE migration.companies
--DROP growth;
ADD growth numeric(6,2) NOT NULL DEFAULT 0;

ALTER TABLE migration.companies
ADD CONSTRAINT positive_growth CHECK(growth >= 0);
